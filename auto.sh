#!/bin/bash

target_configs=(
    L1Icache.cfg
    L1Dcache.cfg
    L2cache.cfg
    L1TLB.cfg
    L2TLB.cfg
)

for tconfig in "${target_configs[@]}"; do
    make run CFG=cs152-sp19-configs/$tconfig
done 
