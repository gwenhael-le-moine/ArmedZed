#!/bin/sh

WHERE=$HOME/tosa-kernel-$(date +%F_%R | tr ':' -)

mkdir -p $WHERE

KERNEL_VERSION=$(basename $(pwd))
KERNEL_VERSION=${KERNEL_VERSION#linux-}

mkdir -p $WHERE/boot/$KERNEL_VERSION
cp .config System.map arch/arm/boot/zImage $WHERE/boot/$KERNEL_VERSION
mv $WHERE/boot/$KERNEL_VERSION/.config $WHERE/boot/$KERNEL_VERSION/config

make ARCH=arm modules_install INSTALL_MOD_PATH=$WHERE

echo "kernel available @ $WHERE"
