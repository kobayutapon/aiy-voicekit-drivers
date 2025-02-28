#!/bin/sh

sudo cp rt5645.ko  /lib/modules/$(uname -r)/extra/
sudo cp rl6231.ko  /lib/modules/$(uname -r)/extra/
sudo cp snd-aiy-voicebonnet.ko  /lib/modules/$(uname -r)/extra/

sudo depmod -a
