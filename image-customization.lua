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
    'gluon-alfred',
    'gluon-config-mode-geo-location',
    'gluon-config-mode-contact-info',
    'gluon-config-mode-hostname',
    'gluon-ebtables-source-filter',
    'gluon-scheduled-domain-switch',
    'gluon-web-mesh-vpn-fastd',
    'gluon-web-node-role',
    'gluon-web-logging',
    'gluon-setup-mode',
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

-- support for USB storage devices
pkgs__usb_storage_dev = {
    'block-mount',
    'blkid',
    'kmod-fs-ext4',
    'kmod-fs-vfat',
    'kmod-usb-storage',
    'kmod-usb-storage-extras',
    'kmod-nls-cp1250',
    'kmod-nls-cp1251',
    'kmod-nls-cp437',
    'kmod-nls-cp775',
    'kmod-nls-cp850',
    'kmod-nls-cp852',
    'kmod-nls-cp866',
    'kmod-nls-iso8859-1',
    'kmod-nls-iso8859-13',
    'kmod-nls-iso8859-15',
    'kmod-nls-iso8859-2',
    'kmod-nls-koi8r',
    'kmod-nls-utf8',
    'swap-utils',
}

-- support for USB tetherings
pkgs__usb_tetherings = {
    'kmod-usb-net',
    'kmod-usb-net-asix',
    'kmod-usb-net-dm9601-ether',
}

-- support for X86 USB generic Network Modules
pkgs__usb_x86_gen_network_mod = {
    'kmod-usb-ohci-pci',
    'kmod-sky2',
    'kmod-atl2',
    'kmod-igb',
    'kmod-3c59x',
    'kmod-e100',
    'kmod-e1000',
    'kmod-e1000e',
    'kmod-natsemi',
    'kmod-ne2k-pci',
    'kmod-pcnet32',
    'kmod-8139too',
    'kmod-r8169',
    'kmod-sis900',
    'kmod-tg3',
    'kmod-via-rhine',
    'kmod-via-velocity',
    'kmod-forcedeth',
}

-- support for AMD APU2 Offloader
pkgs__APU2_offloader = {
    'kmod-leds-gpio',
    'kmod-crypto-hw-ccp',
    'kmod-gpio-nct5104d',
    'kmod-gpio-button-hotplug',
    'kmod-sp5100-tco',
    'kmod-usb-ohci',
    'kmod-sound-core',
    'kmod-pcspkr',
    'irqbalance',
    'fstrim',
}

-- support for ...
pkgs__base_tools = {
        'nano',
        'htop',
}

pkgs_dev_tools = {
        'nano',
        'htop',
        'ethtool',
        'vnstat',
        'iperf',
        'iperf3',
        'socat',
        'nmap',
        'tcpdump',
}


-- #################################
-- add packages to targets or devices
-- ##################################

if target('x86-generic') then
    packages(pkgs__usb_hid)
    packages(pkgs__usb_basic)
    packages(pkgs__usb_3G)
    packages(pkgs__usb_storage_dev)
    packages(pkgs__usb_x86_gen_network_mod)
    packages(pkgs__usb_gps)
    packages(pkgs_dev_tools)
end

if target('x86-64') then
    packages(pkgs__usb_hid)
    packages(pkgs__usb_basic)
    packages(pkgs__usb_3G)
    packages(pkgs__usb_storage_dev)
    packages(pkgs__usb_x86_gen_network_mod)
    packages(pkgs__usb_gps)
    packages(pkgs__APU2_offloader)
    packages(pkgs_dev_tools)
end

if  device({'cudy-x6-v2'}) then
    packages(pkgs_dev_tools)
    packages(pkgs__usb_basic)
end

if  device({'cudy-wr3000-v1'}) then
    packages(pkgs_dev_tools)
    packages(pkgs__usb_basic)
end

if  device({'zyxel-nwa50ax'}) then
    packages(pkgs_dev_tools)
    packages(pkgs__usb_basic)
end

if  device({'tp-link-tl-wdr4900-v1'}) then
    packages(pkgs_dev_tools)
    packages(pkgs__usb_basic)
end


if  device({
    'tp-link-archer-c7-v2',
    'tp-link-archer-c7-v4',
    'tp-link-archer-c7-v5'
    }) then
    packages(pkgs_dev_tools)
    packages(pkgs__usb_basic)
end

if  device({
    'gl.inet-6416',
    'gl.inet-gl-ar150',
    'gl.inet-gl-ar300m-lite',
    'gl.inet-gl-ar750',
    'gl.inet-gl-usb150'
    }) then
    packages(pkgs__usb_basic)
end

if  device({'tp-link-tl-wdr4300-v1'}) then
    packages(pkgs_dev_tools)
    packages(pkgs__usb_basic)
    packages(pkgs__usb_3G)
end

if  device({
    'tp-link-tl-wr1043nd-v2',
    'tp-link-tl-wr1043nd-v3',
    'tp-link-tl-wr1043nd-v4',
    'tp-link-tl-wr1043n-v5'
    }) then
    packages(pkgs_dev_tools)
    packages(pkgs__usb_basic)
    packages(pkgs__usb_3G)
end

if  device({'tp-link-tl-wr2543n-nd'}) then
    packages(pkgs__usb_basic)
end

if  device({'tp-link-tl-wr842n-v3'}) then
    packages(pkgs_dev_tools)
    packages(pkgs__usb_basic)
    packages(pkgs__usb_3G)
end

if  device({
    'netgear-wndr3700',
    'netgear-wndr3700-v2'
    }) then
    packages(pkgs_dev_tools)
    packages(pkgs__usb_basic)
end

if  device({'buffalo-wzr-hp-ag300h'}) then
    packages(pkgs__usb_basic)
end


