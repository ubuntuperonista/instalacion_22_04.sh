#!bin/bash
echo 'Script de instalación de eron'
echo 'Para Ubuntu 20.04LTS Mate'
echo '* cancelar todos las actualizaciones automaticas'
echo '* poner el mejor servidor (UNLP) para los repositorios de Ubuntu'
echo '* instalar el controlador de video nVidia privativo'

echo '************actuaizar paquetería al dia actual'
sudo apt-get update
sudo apt-get upgrade

echo '*************** instalar SlowCAT ********************'
wget http://www.splode.com/~friedman/software/scripts/src/share/slowcat
sudo chmod 755 slowcat
sudo mv slowcat /usr/local/bin/scat 

echo '************instala Compiz************************'
sudo apt-get install compiz compiz-plugins compizconfig-settings-manager
echo 'abrir ccsm e importar el perfil de 2017 .profile'
echo 'si todo va bien poner Compatibilizar con escritorio, o si no 
ingresar'
sudo gsettings set org.mate.session.required-components windowmanager 
compiz
echo 'ver instrucciones en http://ubuntuperonista.blogspot.com.ar/2015/03/instalar-compiz-en-ubuntu-mate-14-04.html'
echo 'para desinstalar compiz'
sudo gsettings reset org.mate.session.required-components windowmanager
sudo apt-get purge compiz compiz-plugins-default compiz-plugins compizconfig-settings-manager

#no hace falta en 18.04lts:
#echo '#Agregado por script de Peron' >>  /etc/modprobe.d/alsa-base.conf
#echo 'options snd-hda-intel model=asus-mode5' >>  /etc/modprobe.d/alsa-base.conf


echo 'agregando PPAs'
sudo add-apt-repository ppa:nilarimogard/webupd8
sudo add-apt-repository ppa:widelands-dev/widelands
sudo add-apt-repository ppa:bugs-launchpad-net-falkensweb/cool-retro-term
sudo add-apt-repository ppa:rawstudio/ppa
sudo add-apt-repository http://ppa.launchpad.net/stebbins/handbrake-releases/ubuntu
sudo add-apt-repository ppa:ravefinity-project/ppa

sudo dpkg --add-architecture i386
sudo apt-get update

echo '********Instalar paqueteria básica adicional************'
sudo apt-get install ubuntu-restricted-extras openjdk-11-jre openssh-server openssh-client htop dstat bmon sysstat iftop ifstat iptraf mc iotop glances python-pip git sox rar totem w3m elinks lynx pm-utils


sudo apt-get install java-wrappers libcommons-cli-java libcommons-lang-java libcortado-java libmiglayout-java libwoodstox-java automake autoconf gettext libtool

echo '***instalando themes con colores y screensavers'
sudo apt-get install ambiance-flat-colors radiance-flat-colors xscreensaver xscreensaver-data-extra xdaliclock xscreensaver-data-extra

echo 'instalando fonts'
sudo apt-get install ttf-essays1743 fonts-inconsolata fonts-roboto fonts-isabella fonts-ubuntu-font-family-console fonts-liberation fonts-lindenhill

echo '**************instalando aplicaciones generales:****************'
sudo apt-get install openshot audacity asunder gimp inkscape vlc chromium-browser-l10n tmux moc byobu alpine links elinks lynx dvb-apps vlc vrms wordgrinder caca-utils figlet toilet fortunes-es cowsay mplayer ubuntustudio-audio-plugins python3-pip ruby cmatrix filezilla facter dmidecode jpegoptim handbrake gnome-disk-utility create-resources ocrfeeder tesseract-ocr-spa

echo '*********instalando juegos****************'
sudo apt-get install pychess fruit bsdgames bsdgames-nonfree freecol scummvm dosbox widelands

echo 'Copiar driver de impresora Samsung ML2851ND'
cd ~
cd ~/Dropbox/Programas\ y\ Archivos\ Ubuntu/Samsung\ ML-2851ND/
sudo cp ML-2850ps.ppd /usr/share/ppd/custom/

echo '****configurando dosbox*************'
echo 'mount c ~/.jdos' >> ~/.dosbox/dosbox-0.74.conf
echo 'c:' >> ~/.dosbox/dosbox-0.74.conf


echo '******* instalando aplicaciones PIP ******************'
sudo -H pip install speedtest-cli 
sudo -H apt-get install -y wavemon
sudo -H pip3 install mps-youtube --upgrade

echo '***********Instalando decompresor de DVD **************'
sudo apt-get install libdvdread4 libdvdcss2
sudo dpkg-reconfigure libdvd-pkg

echo '************instalar GOOGLE EARTH**************'
sudo apt-get install libfontconfig1:i386 libx11-6:i386 libxrender1:i386 
libxext6:i386 libgl1-mesa-glx:i386 libglu1-mesa:i386 libglib2.0-0:i386 
libsm6:i386 
cd ~/Descargas/
wget http://dl.google.com/dl/earth/client/current/google-earth-stable_current_i386.deb
sudo dpkg -i google-earth-stable_current_i386.deb 
sudo apt-get install -f
cd ~

echo '**************instalar skype******************'
cd ~/Descargas/ ;
wget -O skype-install.deb http://www.skype.com/go/getskype-linux-deb ;
sudo dpkg -i skype-install.deb ;
sudo apt-get -f install ;
cd ~ ;

echo '*************instalar COOL RETRO TERM'
sudo add-apt-repository ppa:vantuz/cool-retro-term
sudo apt update
sudo apt-get install build-essential qml-module-qtgraphicaleffects qml-module-qt-labs-folderlistmodel qml-module-qt-labs-settings qml-module-qtquick-controls qml-module-qtquick-dialogs qmlscene qt5-default qt5-qmake qtdeclarative5-dev qtdeclarative5-localstorage-plugin qtdeclarative5-qtquick2-plugin qtdeclarative5-window-plugin
sudo apt-get install cool-retro-term

echo '************instalar Lightzone'
sudo apt-get install libjpeg62
wget http://download.opensuse.org/repositories/home:/ktgw0316:/LightZone/Debian_10/amd64/lightzone_4.2.1-0obs1_amd64.deb
sudo dpkg -i lightzone_4.2.1-0obs1_amd64.deb
sudo apt install -f
cd ~ ;

echo '****************instalar Natron ********************'
cd ~/Descargas/ ;
wget http://downloads.natron.fr/Linux/releases/64bit/files/natron_2.0.1_amd64.deb ;
sudo dpkg -i natron_2.0.1_amd64.deb ;

echo 'instalando youtube-dl'
sudo apt-get install youtube-dl ;
youtube-dl --update ;

echo '**********instalar musica y graficos *************'
sudo apt-get install clementine rawtherapee darktable mypaint mypaint-data-extras ;
cd ~

echo '******************instalando Rawstudio*******************'
sudo apt-get install rawstudio ;
rawstudio ;
echo 'cierre el Rawstudio!' ;
cd ~/.rawstudio ;
mkdir profiles ;
cd profiles/ ;
wget http://download.klauspost.com/Advanced-DCP-Profiles.tar.gz ;
tar xzvf Advanced-DCP-Profiles.tar.gz ;
rm -r *.tar.gz ;

echo '---instalando krita ----'
sudo add-apt-repository ppa:kubuntu-ppa/backports ;
sudo apt-get update ;
sudo apt-get install krita kritasketch ;
sudo apt-get install oxygen-icon-theme ;
sudo apt-get install kdelibs-bin  ;
kbuildsycoca4 ;

echo '*********Instalando programas gráficos de Xn'
cd ~ ;
sudo apt-get update ;
sudo apt-get install libjpeg62:i386 ;
wget http://download.xnview.com/XnRetro-linux.tgz ;
tar xzvf XnRetro-linux.tgz ;
mv XnRetro .XnRetro ;
rm -r XnRetro-linux.tgz ; 
cd ~/Descargas/ ;
wget http://download.xnview.com/XnConvert-linux-x64.deb ;
sudo dpkg -i XnConvert-linux-x64.deb ;
cd ~ ;
sudo apt-get install lib32gcc1 lib32stdc++6 libc6-i386 libfontconfig1:i386 libfreetype6:i386 libglib2.0-0:i386 libgstreamer-plugins-base0.10-0:i386 libgstreamer0.10-0:i386 libice6:i386 libjpeg62:i386 libpng12-0:i386 libqt4-svg:i386 libsm6:i386 libx11-6:i386 libxext6:i386 libxml2:i386 libxrender1:i386 zlib1g:i386 ;
wget http://download.xnview.com/XnSketch-linux.tgz ;
tar xzvf XnSketch-linux.tgz ;
mv XnSketch/ .XnSketch/ ;
rm ~/XnSketch-linux.tgz ;
echo 'modifique el usuario pierre por el suyo en el archivo de configuración'
nano ~/.XnSketch/XnSketch.desktop
cd ~/.XnSketch/ ;
sudo cp XnSketch.desktop /usr/share/applications ;

echo '*********************instalando emuladores de PDP********************'
sudo apt-get install simh ;
mkdir ~/.simh ~/.simh/altairz80 ;
cd ~/.simh/altairz80/ ;
wget http://schorn.ch/cpm/zip/altairz80l64.tar.gz ;
tar xzf altairz80l64.tar.gz ;
rm ~/.simh/altairz80/altairz80l64.tar.gz ;
cd ~/.simh/altairz80/ ;
wget http://schorn.ch/cpm/zip/wordstar.zip ;
unzip wordstar.zip ;
wget http://schorn.ch/cpm/zip/dbase.zip ;
unzip dbase.zip ;
wget http://schorn.ch/cpm/zip/games.zip ;
unzip games.zip ;
wget http://schorn.ch/cpm/zip/vedit.zip ;
unzip vedit.zip ;
wget http://schorn.ch/cpm/zip/multiplan.zip ;
unzip multiplan.zip ;
wget http://schorn.ch/cpm/zip/supercalc.zip ;
unzip supercalc.zip ;
rm *.zip ;
mkdir ~/.simh/unix6/ ;
cd ~/.simh/unix6/
wget http://simh.trailing-edge.com/kits/uv6swre.zip
unzip -a uv6swre.zip
cd ~
mkdir ~/.simh ~/.simh/unixv6HP
cd ~/.simh/unixv6HP
wget 
http://sourceforge.net/projects/bsd42/files/Install%20tapes/Research%20Unix/Unix-v6-Ken-Wellsch.tap.bz2
bzip2 -d Unix-v6-Ken-Wellsch.tap.bz2
sudo dpkg --add-architecture i386 ;
sudo apt-get update ;
sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 ;
sudo apt-get install libpcap0.8:i386 ;
sudo apt-get install libXext6:i386 libXtst6:i386 libXi6:i386 ;
mkdir ~/.simh/ ~/.simh/panelsim/ ~/.simh/panelsim/pdp11-40/
cd ~/.simh/panelsim/pdp11-40/ ;
wget http://retrocmp.com/attachements/panelsim1140_linux.tgz ;
tar -xvf panelsim1140_linux.tgz -z ;
mkdir ~/.simh ~/.simh/panelsim/ ~/.simh/panelsim/pdp11-70/ ;
cd ~/.simh/panelsim/pdp11-70/ ;
wget 
http://www.blinkenbone.com/attachments/article/243/panelsim1170_linux.tgz 
;
tar -xvf panelsim1170_linux.tgz -z ;
mkdir ~/.simh ~/.simh/panelsim/ ~/.simh/panelsim/ki10/;
cd ~/.simh/panelsim/ki10 ;
wget http://www.retrocmp.com/attachements/panelsim_pdp10ki10_linux.tgz ;
tar xvzf panelsim_pdp10ki10_linux.tgz ;
rm ~/.simh/panelsim/ki10/start.sh ;
cd ~/.simh/panelsim/ki10/ ;
wget http://repositories.lib.utexas.edu/bitstream/handle/2152/13510/decwar_drforbin_cis2_tops10_port-2.3.tap ;
sudo apt-get install libX11-dev libpth-dev xorg-dev gcc libjpeg-dev 
libpthread-workqueue-dev x11proto-core-dev x11proto-bigreqs-dev 
freeglut3 freeglut3-dev ;
mkdir ~/.simh/ ~/.simh/panelsim/ ;
cd ~/.simh/panelsim/ ;
wget http://www.autometer.de/unix4fun/z80pack/ftp/z80pack-1.27.tgz ;
tar xzvf z80pack-1.27.tgz ;
cd ~/.simh/panelsim/z80pack-1.27/cpmsim/srcsim ;
make -f Makefile.linux ;
make -f Makefile.linux clean ;
cd ~/.simh/panelsim/z80pack-1.27/cpmsim/srctools/ ;
make ;
make clean ;
cd ~/.simh/panelsim/z80pack-1.27/cpmsim/disks/library/ ;
cp -p * ../backups ;
cd ~/.simh/panelsim/z80pack-1.27/frontpanel-2.1/ ;
make -f Makefile.linux ;
make -f Makefile.linux clean ;
sudo cp ~/.simh/panelsim/z80pack-1.27/frontpanel-2.1/libfrontpanel.so /usr/lib ; 
cd ~/.simh/panelsim/z80pack-1.27/altairsim/srcsim/ ;
make -f Makefile.linux ;
make -f Makefile.linux clean ;
cd ~/.simh/panelsim/z80pack-1.27/cromemcosim/srcsim/ ;
make -f Makefile.linux ;
make -f Makefile.linux clean ;
cd ~/.simh/panelsim/z80pack-1.27/imsaisim/srcsim/ ;
make -f Makefile.linux ;
make -f Makefile.linux clean ;




echo '************instalar cool-retro-term en Ubuntu 20.04lts'

sudo apt-get install build-essential qml-module-qtgraphicaleffects qml-module-qt-labs-folderlistmodel qml-module-qt-labs-settings qml-module-qtquick-controls qml-module-qtquick-dialogs qmlscene qt5-default qt5-qmake qtdeclarative5-dev qtdeclarative5-localstorage-plugin qtdeclarative5-qtquick2-plugin qtdeclarative5-window-plugin qtdeclarative5-dev ;
git clone --recursive https://github.com/Swordfish90/cool-retro-term.git ;
cd cool-retro-term ;
qmake && make ;
./cool-retro-term

echo '*********************** Emparchar y compilar MOCP********'

sudo apt install libmadlib-dev libwavpack-dev libsndfile1-dev libspeex-dev libmpc-dev libid3-3.8.3-dev libmodplug-dev libfaad-dev libavcodec-dev libsidplay2-dev libflac-dev libvorbis-dev libsndfile1-dev liboggplay1-dev libncurses5-dev libavformat-dev librcc-dev libresample1-dev libcurl4-gnutls-dev libtaglib-cil-dev libvorbisidec-dev quilt libdb-dev autoconf libpopt-dev libltdl-dev ;
touch ~/.popt ;
chmod og-w ~/.popt ;
cd /tmp ;
wget http://ftp.daper.net/pub/soft/moc/unstable/moc-2.6-alpha3.tar.xz ;
tar xf moc-2.6-alpha3.tar.xz ;
cp ~/Descargas/moc-26a3-to_r3005-1.patch.gz /tmp/moc-2.6-alpha3/ ;
cd /tmp/moc-2.6-alpha3/ ;
zcat /tmp/moc-2.6-alpha3/moc-26a3-to_r3005-1.patch.gz | patch -p1 ;
echo -n 3005 > REVISION ;
autoreconf -if
./configure --prefix=/usr/local/
make
sudo make install
