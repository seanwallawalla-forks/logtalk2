#!/bin/sh

## =================================================================
## Logtalk - Object oriented extension to Prolog
## Release 2.29.1
##
## Copyright (c) 1998-2006 Paulo Moura.  All Rights Reserved.
## =================================================================

cd ..
dir="$PWD"

port uninstall logtalk
port clean --all logtalk

LOGTALKHOME=/opt/local/logtalk ./lgt_uninstall.sh
./lgt_install.sh /opt/local

cd /opt/local/logtalk
scripts/cleandist.sh
chmod a+x scripts/*.sh
chmod a-x scripts/*.js
chmod a+x xml/*.sh
chmod a-x xml/*.js

cd ..
tar -czf lgt2291.tgz lgt2291
md5="`md5 -q lgt2291.tgz`"
mkdir -p /opt/local/var/db/dports/distfiles/logtalk
mv lgt2291.tgz /opt/local/var/db/dports/distfiles/logtalk/lgt2291.tgz

cd "$dir"
LOGTALKHOME=/opt/local/logtalk ./lgt_uninstall.sh

cd /opt/local/var/db/dports/sources/rsync.rsync.darwinports.org_dpupdate_dports/lang/logtalk/
cp Portfile Portfile.old
sed -e 's/^version.*/version 2.29.1/' -i '' Portfile
sed -e "s/^checksums.*/checksums md5 $md5/" -i '' Portfile
sed -e 's/^distname.*/distname lgt2291/' -i '' Portfile

port install logtalk
port pkg logtalk

cd /opt/local/var/db/dports/build/_opt_local_var_db_dports_sources_rsync.rsync.darwinports.org_dpupdate_dports_lang_logtalk/work
rm -fr $HOME/Desktop/logtalk-2.29.1.pkg
mv logtalk-2.29.1.pkg $HOME/Desktop

port uninstall logtalk
