#*************************************************************************
#
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
#
# Copyright 2008 by Sun Microsystems, Inc.
#
# OpenOffice.org - a multi-platform office productivity suite
#
# $RCSfile: makefile.mk,v $
#
# $Revision: 1.8 $
#
# This file is part of OpenOffice.org.
#
# OpenOffice.org is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License version 3
# only, as published by the Free Software Foundation.
#
# OpenOffice.org is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License version 3 for more details
# (a copy is included in the LICENSE file that accompanied this code).
#
# You should have received a copy of the GNU Lesser General Public License
# version 3 along with OpenOffice.org.  If not, see
# <http://www.openoffice.org/license.html>
# for a copy of the LGPLv3 License.
#
#*************************************************************************

PRJ=..

PRJNAME=dictionaries
TARGET=dict-pl

# --- Settings -----------------------------------------------------

.INCLUDE: settings.mk
# it might be useful to have an extension wide include to set things
# like the EXTNAME variable (used for configuration processing)
# .INCLUDE :  $(PRJ)$/source$/<extension name>$/<extension_name>.pmk

# --- Files --------------------------------------------------------

# name for uniq directory
EXTENSIONNAME:=dict-pl
EXTENSION_ZIPNAME:=dict-pl

# some other targets to be done

# --- Extension packaging ------------------------------------------

# just copy:
COMPONENT_FILES= \
    $(EXTENSIONDIR)$/pl_PL.aff \
    $(EXTENSIONDIR)$/pl_PL.dic \
    $(EXTENSIONDIR)$/hyph_pl_PL.dic \
    $(EXTENSIONDIR)$/README_pl_PL.txt \
    $(EXTENSIONDIR)$/README_hyph_pl_PL.txt

COMPONENT_CONFIGDEST=.
COMPONENT_XCU= \
    $(EXTENSIONDIR)$/dictionaries.xcu

# disable fetching default OOo license text
# CUSTOM_LICENSE=Copyright
# override default license destination
# PACKLICS= $(EXTENSIONDIR)$/registration$/$(CUSTOM_LICENSE)

COMPONENT_ZIP:=$(PWD)$/th_pl_PL_v2.zip
COMPONENT_UNZIP_FILES= \
    $(EXTENSIONDIR)$/th_pl_PL_v2.dat \
    $(EXTENSIONDIR)$/th_pl_PL_v2.idx \
    $(EXTENSIONDIR)$/README_th_pl_PL_v2.txt

# add own targets to packing dependencies (need to be done before
# packing the xtension
# EXTENSION_PACKDEPS=makefile.mk $(CUSTOM_LICENSE)
EXTENSION_PACKDEPS=$(COMPONENT_UNZIP_FILES)

# global settings for extension packing
.INCLUDE : extension_pre.mk
.INCLUDE : target.mk
# global targets for extension packing
.INCLUDE : extension_post.mk

.IF "$(COMPONENT_UNZIP_FILES)"!=""
$(COMPONENT_UNZIP_FILES) : "$(COMPONENT_ZIP)"
    cd $(EXTENSIONDIR) && unzip -o $< $(subst,$(EXTENSIONDIR)$/, $@)
.ENDIF			# "$(COMPONENT_UNZIP_FILES)"!=""
