
# Enable autoupdater
GLUON_AUTOUPDATER_BRANCH ?= stable
GLUON_AUTOUPDATER_ENABLED ?= 1

# Which Version number do we have?
GLUON_BASE_VERSION := 1.3.0

# This string is displayed and used by the autoupdater to decide if a newer version is available.
ifeq ($(GLUON_AUTOUPDATER_BRANCH),stable)
    # Set DEFAULT_GLUON_RELEASE without date for stable branch
    DEFAULT_GLUON_RELEASE := $(GLUON_BASE_VERSION)
else ifeq ($(GLUON_AUTOUPDATER_BRANCH),beta)
    # Beta version
    DEFAULT_GLUON_RELEASE := $(GLUON_BASE_VERSION)-beta$(shell date '+%Y%m%d')
else
    # Set DEFAULT_GLUON_RELEASE with date for other branches
    DEFAULT_GLUON_RELEASE := $(GLUON_BASE_VERSION)-exp$(shell date '+%Y%m%d')
endif

# Allow overriding the release number from the command line
GLUON_RELEASE ?= $(DEFAULT_GLUON_RELEASE)

# How many days until all router should be updated
GLUON_PRIORITY ?= 7

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
GLUON_DEPRECATED ?= 0

# Multidomain support allows to build a single firmware with multiple, switchable domain configurations
GLUON_MULTIDOMAIN=1
