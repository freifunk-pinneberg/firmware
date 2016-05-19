# Freifunk Pinneberg Firmware

## Fertige Downloads
Wenn du unsere Firmware einfach nur nutzen möchtest, empfihelt sich der Download der fertigen Binärdateien. Folge dazu einfach den Anweisungen auf unserer [Download Seite](https://pinneberg.freifunk.net/download.html)

## Selbst bauen

### Benötigte Software
Für den Bau werden folgende Pakete benötigt, welche mit der bevorzugten Paketverwaltung installiert werden können.
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

Über den Parameter **j** passt man die anzahl der Threads an. Es empfiehlt sich hier so viele anzugeben wie die CPU Kerne hat.
Über **GLUON_TARGET** definiert man die Zielplatform, möglich angaben sind derzeit.

* ar71xx-generic - Fast alle Router
* mpc85xx-generic - TLWDR4900
* ar71xx-nand - WNDR4300
* x86-generic - Klassischer PC (32bit)
* x86-64 - Klassischer PC (64bit)
* x86-kvm_guest - Viretuelle Maschienen