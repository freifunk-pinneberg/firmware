GLUON_SITE_PACKAGES := \
    gluon-mesh-batman-adv-15 \
    gluon-alfred \
    gluon-respondd \
    gluon-autoupdater \
    gluon-config-mode-autoupdater \
    gluon-config-mode-contact-info \
    gluon-config-mode-core \
    gluon-config-mode-geo-location \
    gluon-config-mode-hostname \
    gluon-config-mode-mesh-vpn \
    gluon-config-mode-domain-select \
    gluon-scheduled-domain-switch \
    gluon-ebtables-filter-multicast \
    gluon-ebtables-filter-ra-dhcp \
    gluon-web-admin \
    gluon-web-autoupdater \
    gluon-web-network \
    gluon-web-wifi-config \
    gluon-web-private-wifi \
    gluon-web-node-role  \
    gluon-mesh-vpn-fastd \
    gluon-web-logging \
    gluon-setup-mode \
    gluon-status-page \
    iwinfo \
    iptables \
    haveged

# basic support for USB stack
USB_PACKAGES_BASIC := \
    kmod-usb-core \
    kmod-usb2 \
    kmod-usb3

# support for USB UMTS/3G devices
USB_PACKAGES_3G := \
    kmod-usb-serial \
    kmod-usb-serial-wwan \
    kmod-usb-serial-option \
    chat \
    ppp

# support for USB GPS devices
USB_PACKAGES_GPS := \
    kmod-usb-acm \
    ugps

# support for HID devices (keyboard, mouse, ...)
USB_PACKAGES_HID := \
    kmod-usb-hid \
    kmod-hid-generic

# storage support for USB devices
USB_PACKAGES_STORAGE := \
    block-mount \
    blkid \
    kmod-fs-ext4 \
    kmod-fs-vfat \
    kmod-usb-storage \
    kmod-usb-storage-extras \
    kmod-nls-cp1250 \
    kmod-nls-cp1251 \
    kmod-nls-cp437 \
    kmod-nls-cp775 \
    kmod-nls-cp850 \
    kmod-nls-cp852 \
    kmod-nls-cp866 \
    kmod-nls-iso8859-1 \
    kmod-nls-iso8859-13 \
    kmod-nls-iso8859-15 \
    kmod-nls-iso8859-2 \
    kmod-nls-koi8r \
    kmod-nls-utf8 \
    swap-utils

# support for USB tethering
USB_PACKAGES_TETHERING := \
	kmod-usb-net \
	kmod-usb-net-asix \
	kmod-usb-net-dm9601-ether

USB_X86_GENERIC_NETWORK_MODULES := \
	kmod-usb-ohci-pci \
	kmod-sky2 \
	kmod-atl2 \
	kmod-igb \
	kmod-3c59x \
	kmod-e100 \
	kmod-e1000 \
	kmod-e1000e \
	kmod-natsemi \
	kmod-ne2k-pci \
	kmod-pcnet32 \
	kmod-8139too \
	kmod-r8169 \
	kmod-sis900 \
	kmod-tg3 \
	kmod-via-rhine \
	kmod-via-velocity \
	kmod-forcedeth

# AMD APU2 Offloader https://openwrt.org/toh/pcengines/apu2#kernel_modules
APU2_SUPPORT := \
    kmod-leds-apu2 \
    kmod-leds-gpio \
    kmod-crypto-hw-ccp \
    kmod-gpio-nct5104d \
    kmod-gpio-button-hotplug \
    kmod-sp5100_tco \
    kmod-usb-ohci \
    kmod-sound-core \
    kmod-pcspkr \
    irqbalance \
    fstrim

# ar71xx-generic
GLUON_ARCHERC7_SITE_PACKAGES := $(USB_PACKAGES_BASIC)
GLUON_GLINET_SITE_PACKAGES := $(USB_PACKAGES_BASIC)
GLUON_TLWDR4300_SITE_PACKAGES := $(USB_PACKAGES_BASIC) $(USB_PACKAGES_3G)
GLUON_TLWR1043_SITE_PACKAGES := $(USB_PACKAGES_BASIC) $(USB_PACKAGES_3G)
GLUON_TLWR2543_SITE_PACKAGES := $(USB_PACKAGES_BASIC)
GLUON_TLWR842_SITE_PACKAGES := $(USB_PACKAGES_BASIC) $(USB_PACKAGES_3G)
GLUON_WNDR3700_SITE_PACKAGE := $(USB_PACKAGES_BASIC)
GLUON_WRT160NL_SITE_PACKAGE := $(USB_PACKAGES_BASIC)
GLUON_WZRHPAG300H_SITE_PACKAGES := $(USB_PACKAGES_BASIC)
GLUON_WZRHPG450H_SITE_PACKAGES := $(USB_PACKAGES_BASIC)

# mpc85xx-generic
GLUON_TLWDR4900_SITE_PACKAGES := $(USB_PACKAGES_BASIC)

# x86-generic
ifeq ($(GLUON_TARGET),x86-generic)
GLUON_SITE_PACKAGES += \
    $(USB_PACKAGES_HID) \
    $(USB_PACKAGES_BASIC) \
    $(USB_PACKAGES_3G) \
    $(USB_PACKAGES_STORAGE) \
    $(USB_X86_GENERIC_NETWORK_MODULES) \
    $(USB_PACKAGES_GPS) \
    htop
endif

# x86-64
ifeq ($(GLUON_TARGET),x86-64)
GLUON_SITE_PACKAGES += \
    $(USB_PACKAGES_HID) \
    $(USB_PACKAGES_BASIC) \
    $(USB_PACKAGES_3G) \
    $(USB_PACKAGES_STORAGE) \
    $(USB_X86_GENERIC_NETWORK_MODULES) \
    $(USB_PACKAGES_GPS) \
    $(APU2_SUPPORT) \
    htop
endif

# Enable autoupdater
GLUON_BRANCH ?= stable

# Which Version number do we have?
GLUON_BASE_VERSION := 1.0.0

# This string is displayed and used by the autoupdater to decide if a newer version is available.
ifeq ($(GLUON_BRANCH),stable)
    # Set DEFAULT_GLUON_RELEASE without date for stable branch
    DEFAULT_GLUON_RELEASE := $(GLUON_BASE_VERSION)
else ifeq ($(GLUON_BRANCH),beta)
    # Beta version
    DEFAULT_GLUON_RELEASE := $(GLUON_BASE_VERSION)-beta$(shell date '+%Y%m%d')
else
    # Set DEFAULT_GLUON_RELEASE with date for other branches
    DEFAULT_GLUON_RELEASE := $(GLUON_BASE_VERSION)-exp$(shell date '+%Y%m%d')
endif

# Allow overriding the release number from the command line
GLUON_RELEASE ?= $(DEFAULT_GLUON_RELEASE)

# How many days until all router should be updated
GLUON_PRIORITY ?= 3

# Some devices contain a region code that restricts firmware installations.
# Set to eu or us to make the resulting images installable from the respective stock firmware.
GLUON_REGION ?= eu

# Setting this to 11s or ibss will enable generation of matching images for devices which don’t support both meshing modes
GLUON_WLAN_MESH ?= 11s

# List of languages (as two-letter-codes) to be included in the web interface
GLUON_LANGS ?= en de

# Setting this to 1 will provide firmware images including debugging symbols usable with GDB or similar tools.
GLUON_DEBUG ?= 0

# Controls whether images for deprecated devices (small flash) should be built
# 0, upgrade, full
GLUON_DEPRECATED ?= full

# Multidomain support allows to build a single firmware with multiple, switchable domain configurations
GLUON_MULTIDOMAIN=1
