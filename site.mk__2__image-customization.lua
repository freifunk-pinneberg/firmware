features({
    'autoupdater',
    'config-mode-domain-select',
    'ebtables-filter-multicast',
    'ebtables-filter-ra-dhcp',
    'mesh-batman-adv-15',
    'mesh-vpn-fastd',
    'web-private-wifi',
    'radvd',
    'radv-filterd',
    'respondd',
    'status-page',
    'web-advanced',
    'web-wizard',
})

if not device_class('tiny') then
    features({
        'wireless-encryption-wpa3',
    })
end


packages({
    'gluon-config-mode-geo-location',
    'gluon-config-mode-contact-info',
    'gluon-ebtables-source-filter',
    'gluon-web-mesh-vpn-fastd',
    'respondd-module-airtime',
    'iwinfo',
    'iptables',
    'haveged',
})


-- ###################
-- custom PACKAGES dev
-- ###################

-- basic support for USB stack
pkgs__usb_basic = {
    'kmod-usb-core',
    'kmod-usb2',
    'kmod-usb3',
}

-- support for USB UMTS/3G devices
pkgs__usb_3G = {
    'kmod-usb-serial',
    'kmod-usb-serial-wwan',
    'kmod-usb-serial-option',
    'chat',
    'ppp',
}

-- support for USB GPS devices
pkgs__usb_gps = {
    'kmod-usb-acm',
    'ugps',

}

-- support for HID devices (keyboard, mouse, ...)
pkgs__usb_hid = {
    'kmod-usb-hid',
    'kmod-hid-generic',

}

-- storage support for USB devices
pkgs__ = {


}


-- support for USB tetherings
pkgs__usb_tetherings = {
	'kmod-usb-net',
	'kmod-usb-net-asix',
	'kmod-usb-net-dm9601-ether',

}


--
pkgs__ = {


}


--
pkgs__ = {


}


--
pkgs__ = {


}


--
pkgs__ = {


}


--
pkgs__ = {


}


--
pkgs__ = {


}







-- ###########################
-- alt: in lua zu konvertieren
-- ###########################
##	GLUON_FEATURES
#		Specify Gluon features/packages to enable;
#		Gluon will automatically enable a set of packages
#		depending on the combination of features listed
GLUON_FEATURES := \
--	autoupdater \
--	ebtables-filter-multicast \
--    ebtables-filter-ra-dhcp \
--    mesh-batman-adv-15 \
--	mesh-vpn-fastd \
--	radvd \
--    respondd \
--	status-page \
--	web-advanced \
--	web-wizard

##	GLUON_SITE_PACKAGES
#		Specify additional Gluon/OpenWrt packages to include here;
#		A minus sign may be prepended to remove a packages from the
#		selection that would be enabled by default or due to the
#		chosen feature flags
GLUON_SITE_PACKAGES := \
--    gluon-mesh-batman-adv-15 \
    gluon-alfred \
--    gluon-config-mode-contact-info \
--    gluon-config-mode-geo-location \
    gluon-config-mode-hostname \
--    gluon-config-mode-domain-select \
    gluon-scheduled-domain-switch \
    gluon-web-node-role  \
    gluon-web-logging \
    gluon-setup-mode \
--    gluon-status-page \
--    respondd-module-airtime \
--    iwinfo

--GLUON_FEATURES_standard := \
--  wireless-encryption-wpa3

--# basic support for USB stack
--USB_PACKAGES_BASIC := \
--    kmod-usb-core \
--    kmod-usb2 \
--    kmod-usb3

--# support for USB UMTS/3G devices
--USB_PACKAGES_3G := \
--    kmod-usb-serial \
--    kmod-usb-serial-wwan \
--    kmod-usb-serial-option \
--    chat \
--    ppp

--# support for USB GPS devices
--USB_PACKAGES_GPS := \
--    kmod-usb-acm \
--    ugps

-- # support for HID devices (keyboard, mouse, ...)
--USB_PACKAGES_HID := \
--    kmod-usb-hid \
--    kmod-hid-generic

-- # storage support for USB devices
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

-- # support for USB tethering
--USB_PACKAGES_TETHERING := \
--	kmod-usb-net \
--	kmod-usb-net-asix \
--	kmod-usb-net-dm9601-ether

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
    kmod-leds-gpio \
    kmod-crypto-hw-ccp \
    kmod-gpio-nct5104d \
    kmod-gpio-button-hotplug \
    kmod-sp5100-tco \
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

=======
>>>>>>> Stashed changes
