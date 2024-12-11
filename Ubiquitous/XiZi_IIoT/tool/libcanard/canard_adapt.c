#include "canard.h"
#include <stdlib.h>

CanardInstance canard;
CanardTxQueue txQueue;

void* canard_memAllocate(CanardInstance* const canard, const size_t amount)
{
    (void) canard;
    return x_malloc(amount);
}

void canard_memFree(CanardInstance* const canard, void* const pointer)
{
    (void) canard;
    free(pointer);
}

void slave_comm_init()
{
	canard = canardInit(&canard_memAllocate, &canard_memFree);
	canard.node_id = savePara.id; 
	txQueue = canardTxInit(1536,  CANARD_MTU_CAN_CLASSIC);  // Set MTU = 64 bytes. There is also CANARD_MTU_CAN_CLASSIC.	
}	

void slave_comm_tx_process()
{
	for (const CanardTxQueueItem* ti = NULL; (ti = canardTxPeek(&txQueue)) != NULL;)  // Peek at the top of the queue.
	{
		if ((0U == ti->tx_deadline_usec) || (ti->tx_deadline_usec > rt_tick_get_millisecond()*1000))  // Check the deadline.
		{
			if (!slave_send_ext(ti->frame.extended_can_id,(void *)ti->frame.payload,ti->frame.payload_size))               // Send the frame over this redundant CAN iface.
			{
				break;                             // If the driver is busy, break and retry later.
			}
		}

		// After the frame is transmitted or if it has timed out while waiting, pop it from the queue and deallocate:
		canard.memory_free(&canard, canardTxPop(&txQueue, ti));
	}		
}

rt_inline uint8_t slave_send_ext(uint32_t id,uint8_t *sendBuf,uint8_t len)
{
	struct rt_can_msg txMsg = {0};
	
	txMsg.id = 	id;
	txMsg.ide = RT_CAN_EXTID;
	txMsg.rtr = RT_CAN_DTR;
	txMsg.len = len;
	for(rt_uint8_t i=0;i<len;i++)
	{
		txMsg.data[i] = sendBuf[i];
	}
	
	
	return rt_device_write(slaveDev,0,&txMsg,sizeof(txMsg));
	
}

void slave_comm_rx_process()
{
	CanardRxTransfer transfer;
	CanardFrame receivedFrame;
	struct rt_can_msg canRxMsg = {0};
	uint32_t rxTimestampUsec;
	int8_t result;
	
	while(rt_mq_recv(&slave_rec_msgq,&canRxMsg,sizeof(canRxMsg),RT_WAITING_NO) == RT_EOK)
	{
	
		receivedFrame.extended_can_id = canRxMsg.id;
		receivedFrame.payload_size = canRxMsg.len;
		receivedFrame.payload = canRxMsg.data;
		
		rxTimestampUsec = rt_tick_get_millisecond()*1000;
		
		result = canardRxAccept(&canard,
								rxTimestampUsec,          // When the frame was received, in microseconds.
								&receivedFrame,            // The CAN frame received from the bus.
								0,  // If the transport is not redundant, use 0.
								&transfer,
								NULL);
		if (result < 0)
		{
			// An error has occurred: either an argument is invalid or we've ran out of memory.
			// It is possible to statically prove that an out-of-memory will never occur for a given application if
			// the heap is sized correctly; for background, refer to the Robson's Proof and the documentation for O1Heap.
			// Reception of an invalid frame is NOT an error.
		}
		else if (result == 1)
		{
			void process_received_transfer(const uint8_t index,CanardRxTransfer* const transfer);
			process_received_transfer(0, &transfer);  // A transfer has been received, process it.
			canard.memory_free(&canard, transfer.payload);                  // Deallocate the dynamic memory afterwards.
		}
		else
		{
			// Nothing to do.
			// The received frame is either invalid or it's a non-last frame of a multi-frame transfer.
			// Reception of an invalid frame is NOT reported as an error because it is not an error.
		}
	}	
}

void process_received_transfer(const uint8_t index,CanardRxTransfer* const transfer)
{
	LOG_D("slave rec id:%d size:%d",transfer->metadata.remote_node_id,transfer->payload_size);
	if(transfer->metadata.remote_node_id == canard.node_id)
	{
		slavePackDef *p = (slavePackDef *)transfer->payload;
		recCmd = p->packCmd;
		
	}
		
}


