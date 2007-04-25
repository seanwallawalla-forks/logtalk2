Name: logtalk
Summary: Logtalk - Open source object-oriented logic programming language
Version: 2.30.0
Release: 1
License: Artistic License 2.0
Group: Development/Languages
Packager: Paulo Moura <pmoura@logtalk.org>
Source: http://logtalk.org/files/lgt2300.tgz
BuildArchitectures: noarch
URL: http://logtalk.org/
Prefix: /usr/local
AutoReqProv: no
%description
Logtalk is an open source object-oriented logic programming language that can use most Prolog implementations as a back-end compiler. As a multi-paradigm language, Logtalk includes support for both prototypes and classes, protocols, component-based programming through category-based composition, event-driven programming, and multi-threading programming.

%prep

%setup -n lgt2300

%build

%install
mkdir -p /usr/local/share
rm -rf /usr/local/share/lgt2300
rm -f /usr/local/share/logtalk
mkdir /usr/local/share/lgt2300
cp -R * /usr/local/share/lgt2300
cd /usr/local/share
find lgt2300 -type f -print0 | xargs -0 chmod 644
find lgt2300 -type d -print0 | xargs -0 chmod 755
chmod a+x lgt2300/integration/*.sh
chmod a+x lgt2300/scripts/*.sh
chmod a-x lgt2300/scripts/*.js
chmod a+x lgt2300/scripts/linux/*.sh
chmod a+x lgt2300/scripts/macosx/postflight
chmod a+x lgt2300/xml/*.sh
chmod a-x lgt2300/xml/*.js
ln -sf lgt2300 logtalk
cd ..
mkdir -p bin 
cd bin
ln -sf ../share/logtalk/integration/bplgt.sh bplgt
ln -sf ../share/logtalk/integration/ciaolgt.sh ciaolgt
ln -sf ../share/logtalk/integration/cxlgt.sh cxlgt
ln -sf ../share/logtalk/integration/eclipselgt.sh eclipselgt
ln -sf ../share/logtalk/integration/gplgt.sh gplgt
ln -sf ../share/logtalk/integration/plclgt.sh plclgt
ln -sf ../share/logtalk/integration/sicstuslgt.sh sicstuslgt
ln -sf ../share/logtalk/integration/swilgt.sh swilgt
ln -sf ../share/logtalk/integration/xsblgt.sh xsblgt
ln -sf ../share/logtalk/integration/yaplgt.sh yaplgt
ln -sf ../share/logtalk/scripts/cplgtdirs.sh cplgtdirs
ln -sf ../share/logtalk/xml/lgt2pdf.sh lgt2pdf
ln -sf ../share/logtalk/xml/lgt2html.sh lgt2html
ln -sf ../share/logtalk/xml/lgt2xml.sh lgt2xml
%clean
%files
%defattr(-,root,root)
%doc /usr/local/share/lgt2300/BIBLIOGRAPHY.bib
%doc /usr/local/share/lgt2300/CUSTOMIZE.txt
%doc /usr/local/share/lgt2300/INSTALL.txt
%doc /usr/local/share/lgt2300/LICENSE.txt
%doc /usr/local/share/lgt2300/QUICK_START.txt
%doc /usr/local/share/lgt2300/README.txt
%doc /usr/local/share/lgt2300/RELEASE_NOTES.txt
%doc /usr/local/share/lgt2300/UPGRADING.txt
/usr/local/share/lgt2300/compiler
/usr/local/share/lgt2300/configs
/usr/local/share/lgt2300/contributions
/usr/local/share/lgt2300/examples
/usr/local/share/lgt2300/integration
/usr/local/share/lgt2300/libpaths
/usr/local/share/lgt2300/library
%docdir /usr/local/share/lgt2300/manuals
/usr/local/share/lgt2300/manuals
/usr/local/share/lgt2300/scripts
/usr/local/share/lgt2300/wenv
/usr/local/share/lgt2300/xml
/usr/local/share/logtalk
/usr/local/bin/cplgtdirs
/usr/local/bin/lgt2pdf
/usr/local/bin/lgt2html
/usr/local/bin/lgt2xml
/usr/local/bin/bplgt
/usr/local/bin/ciaolgt
/usr/local/bin/cxlgt
/usr/local/bin/eclipselgt
/usr/local/bin/gplgt
/usr/local/bin/plclgt
/usr/local/bin/sicstuslgt
/usr/local/bin/swilgt
/usr/local/bin/xsblgt
/usr/local/bin/yaplgt

%post
echo
echo "Installed Logtalk on $RPM_INSTALL_PREFIX/share."
echo
echo
echo "Links to the \"cplgtdirs\", \"lgt2pdf\", \"lgt2html\", and \"lgt2xml\" scripts have"
echo "been created on \"$RPM_INSTALL_PREFIX/bin\"; you may need to add this directory to"
echo "your execution path."
echo
echo "The following integration scripts are installed for running Logtalk"
echo "with selected back-end Prolog compilers:"
echo
echo "  B-Prolog:       bplgt       (first run must use sudo)"
echo "  CIAO:           ciaolgt     (first run must use sudo)"
echo "  CxProlog:       cxlgt"
echo "  ECLiPSe:        eclipselgt"
echo "  GNU Prolog:     gplgt"
echo "  K-Prolog:       plclgt"
echo "  SICStus Prolog: sicstuslgt"
echo "  SWI-Prolog:     swilgt"
echo "  XSB:            xsblgt      (first run must use sudo)"
echo "  YAP:            yaplgt"
echo
echo "The Prolog integration scripts can be found on $RPM_INSTALL_PREFIX/bin."
echo "Make sure that the Prolog compilers are also available on your execution"
echo "path."
echo
echo "If you got an unexpected failure when using one of the Prolog integration"
echo "scripts, make sure that the Prolog compiler is properly installed and see"
echo "the \"$RPM_INSTALL_PREFIX/share/logtalk/configs/NOTES.txt\" file."
mkdir -p /etc/profile.d
echo "# Logtalk environment setup" > /etc/profile.d/logtalk.sh
echo "" >> /etc/profile.d/logtalk.sh
echo "# Logtalk installation directory:" >> /etc/profile.d/logtalk.sh
echo "export LOGTALKHOME=$RPM_INSTALL_PREFIX/share/logtalk" >> /etc/profile.d/logtalk.sh
echo "" >> /etc/profile.d/logtalk.sh
echo "# Default location for Logtalk end-user files:" >> /etc/profile.d/logtalk.sh
echo "export LOGTALKUSER=\$HOME/logtalk" >> /etc/profile.d/logtalk.sh
chmod a+x /etc/profile.d/logtalk.sh
echo "# Logtalk environment setup" > /etc/profile.d/logtalk.csh
echo "" >> /etc/profile.d/logtalk.csh
echo "# Logtalk installation directory:" >> /etc/profile.d/logtalk.csh
echo "setenv LOGTALKHOME $RPM_INSTALL_PREFIX/share/logtalk" >> /etc/profile.d/logtalk.csh
echo "" >> /etc/profile.d/logtalk.csh
echo "# Default location for Logtalk end-user files:" >> /etc/profile.d/logtalk.csh
echo "setenv LOGTALKUSER \$HOME/logtalk" >> /etc/profile.d/logtalk.csh
chmod a+x /etc/profile.d/logtalk.csh
echo
echo "Defined the following environment variables for all users:"
echo
echo "  Logtalk installation directory: LOGTALKHOME = $RPM_INSTALL_PREFIX/share/logtalk"
echo "  Default Logtalk user files directory: LOGTALKUSER = \$HOME/logtalk"
echo
echo "You may need to logout and login again or start a new shell in order to"
echo "use the new environment variables."
echo
echo "Users may change the default value of the LOGTALKUSER environment variable"
echo "in their shell configuration files if they already use, or want to use, a "
echo "different location for the Logtalk user files directory. This directory "
echo "is created by running the \"cplgtdirs\" shell script, which must be run "
echo "once by each user before using the integration scripts."
echo
echo "Logtalk basic installation completed. See the \"\$LOGTALKHOME/CUSTOMIZE.txt\""
echo "file for details on customizing Logtalk and your working environment."
echo

%postun
rm -f /etc/profile.d/logtalk.sh 2> /dev/null
rm -f /etc/profile.d/logtalk.csh 2> /dev/null
