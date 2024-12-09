#!/bin/bash

function title() {
	printf '\n\033[0;31m** %b **\033[00m\n\n' "${@}"
}

function subtitle() {
	printf '\n\033[01;34m* %b:\033[00m\n\n' "${@}"
}

date

title 'GLOBAL VIEW'

hostnamectl

title 'HARDWARE'

subtitle 'CPU'
lscpu

subtitle 'RAM'
vmstat -s -S M | grep "mémoire"
echo
free -ht

subtitle 'HDD'
df /media/mathieu/Data/ / -h

subtitle 'Devices'
lshw -short

title 'SOFTWARE'

subtitle 'OS version'
lsb_release -a

subtitle 'Linux kernel'

echo 'Selected kernel: ' `uname -mr`
echo
echo 'Installed kernels:'
linux-version list

subtitle 'Graphics'
echo "Graphical server: $XDG_SESSION_TYPE"

title 'NETWORK'
netstat -i
echo
ifconfig

