#!/bin/bash
sudo virsh start win11

while [! -f "/dev/shm/looking-glass"]; do
    sleep 1
done

sudo chown $USER:$USER /dev/shm/looking-glass

fi