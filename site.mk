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
    gluon-ebtables-filter-multicast \
    gluon-ebtables-filter-ra-dhcp \
    gluon-web-admin \
    gluon-web-autoupdater \
    gluon-web-network \
    gluon-web-wifi-config \
    gluon-web-private-wifi \
    gluon-web-node-role  \
    gluon-mesh-vpn-fastd \
    gluon-setup-mode \
    gluon-status-page \
    iwinfo \
    iptables \
    haveged

# basic support for USB stack
USB_PACKAGES_BASIC := \
    kmod-usb-core \
    kmod-usb2

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
    $(USB_PACKAGES_GPS)
endif

# x86-64
ifeq ($(GLUON_TARGET),x86-64)
GLUON_SITE_PACKAGES += \
    $(USB_PACKAGES_HID) \
    $(USB_PACKAGES_BASIC) \
    $(USB_PACKAGES_3G) \
    $(USB_PACKAGES_STORAGE) \
    $(USB_X86_GENERIC_NETWORK_MODULES) \
    $(USB_PACKAGES_GPS)
endif

DEFAULT_GLUON_RELEASE := 0.10-exp$(shell date '+%Y%m%d')

# Allow overriding the release number from the command line
GLUON_RELEASE ?= $(DEFAULT_GLUON_RELEASE)

GLUON_PRIORITY ?= 0

GLUON_REGION ?= eu

GLUON_ATH10K_MESH ?= ibss

GLUON_WLAN_MESH ?= ibss

GLUON_LANGS ?= en de

GLUON_DEBUG ?= 0

# Controls whether images for deprecated devices (small flash) should be built
# 0, upgrade, full
GLUON_DEPRECATED ?= full
