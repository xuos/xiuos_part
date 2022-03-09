#切换到root目录
cd ../../
echo $(pwd)
git submodule init
git submodule update Ubiquitous/RT_Thread/rt-thread
git submodule update Ubiquitous/RT_Thread/aiit_board/k210/kendryte-sdk/kendryte-sdk-source