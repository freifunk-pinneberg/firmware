# Freifunk Pinneberg Firmware

## Fertige Downloads

Wenn du unsere Firmware einfach nur nutzen möchtest, empfiehlt sich der Download der fertigen Binärdateien. Folge dazu
einfach den Anweisungen auf unserer [Downloadseite](https://pinneberg.freifunk.net/download.html)

## Selbst bauen

### Benötigte Software

Für den Bau werden folgende Pakete benötigt, welche mit der bevorzugten Paketverwaltung installiert werden können.
Unter Debian ist das beispielsweise:
apt-get install build-essential git subversion python gawk unzip libssl-dev zlib1g-dev libncurses5-dev

### Firmware auschecken

    git clone https://github.com/freifunk-gluon/gluon.git
    git clone https://github.com/freifunk-pinneberg/firmware.git gluon/site
    cd gluon/site
    git checkout v1.2.0
    cd ..
    git checkout v2022.1.4

### Firmware bauen

    make update
    make -j10 GLUON_TARGET=ar71xx-generic GLUON_BRANCH=stable

Über den Parameter **j** passt man die anzahl der Threads an. Es empfiehlt sich hier so viele anzugeben wie die CPU
Kerne hat.
Über **GLUON_TARGET** definiert man die Zielplattform, möglich Angaben sind derzeit:

* ar71xx-generic - Fast alle TP-Link & ubnt Router
* ar71xx-tiny - Geräte mit sehr wenig RAM (z.b. TP-LINK WR841N(D))
* ar71xx-nand
* brcm2708-bcm2708 - Raspberry 1
* brcm2708-bcm2709 - Raspberry 2
* mpc85xx-generic - z.b. TLWDR4900
* mpc85xx-p1020
* ramips-mt7621
* sunxi-cortexa7
* x86-generic - Klassischer PC (32bit)
* x86-geode - Klassischer PC (AMD Geode CPU)
* x86-64 - Klassischer PC (64bit)

Die Angabe von **GLUON_BRANCH** bewirkt, daß der Autoupdater für die angegeben Branch aktiviert wird.

Das Bauen kann man mit einem kleinen bash Script auch in einem rutsch erledigen.  
build.sh

```
#!/bin/bash

#BRANCH=experimental
#BRANCH=beta
BRANCH=stable

GLUON_BASE_VERSION=1.0.0+1


if [ "$BRANCH" == "stable" ]; then
    # Setze DEFAULT_GLUON_RELEASE ohne Datum für den stabilen Branch
    DEFAULT_GLUON_RELEASE="$GLUON_BASE_VERSION"
elif [ "$BRANCH" == "beta" ]; then
    # Beta-Version
    DEFAULT_GLUON_RELEASE="${GLUON_BASE_VERSION}-beta$(date '+%Y%m%d')"
else
    # Setze DEFAULT_GLUON_RELEASE mit Datum für andere Branches
    DEFAULT_GLUON_RELEASE="${GLUON_BASE_VERSION}-exp$(date '+%Y%m%d')"
fi


make update
for TARGET in $(make list-targets); do
  make -j10 GLUON_TARGET=$TARGET GLUON_BRANCH=$BRANCH GLUON_RELEASE=$DEFAULT_GLUON_RELEASE
  make clean GLUON_TARGET=$TARGET
done 

make manifest GLUON_BRANCH=$BRANCH

./contrib/sign.sh ../secret output/images/sysupgrade/$BRANCH.manifest 
```
