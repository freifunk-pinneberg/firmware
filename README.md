# Freifunk Pinneberg Firmware

## Selbst bauen

### Benötigte Software
Für den Bau werden folgende Pakete benötigt.
build-essential git subversion python gawk unzip libssl-dev zlib1g-dev libncurses5-dev

### Firmware auschecken
git clone https://github.com/freifunk-gluon/gluon.git
git clone https://github.com/freifunk-pinneberg/firmware.git gluon/site
cd gluon/site
git checkout v0.8-beta1
cd ..
git checkout v2016.1.4

### Firmware bauen
make update
make -j10 GLUON_TARGET=ar71xx-generic
