#! /bin/sh

current_path=$(pwd)
xizi_path=Ubiquitous/XiZi
board=cortex-m3-emulator
qemu_machine=lm3s6965evb

run_in_docker() {
    docker run \
        -i -t --rm \
        -v $current_path:$current_path \
        -w $current_path \
        xiuos_builder \
        $@
}

build() {
    run_in_docker make -C $xizi_path BOARD=$board
}

menuconfig() {
    run_in_docker make -C $xizi_path BOARD=$board menuconfig
}

clean() {
    run_in_docker make -C $xizi_path clean
}

distclean() {
    run_in_docker make -C $xizi_path distclean
}

simulate() {
    [ "$1" = "debug" ] && debug_param="-s -S"
    qemu-system-arm $debug_param \
        -machine $qemu_machine \
        -nographic \
        -kernel $xizi_path/build/XiZi_$board.elf
}

gdb() {
    gdb-multiarch \
        $xizi_path/build/XiZi_$board.elf \
        -ex "target remote localhost:1234"
}

$@
