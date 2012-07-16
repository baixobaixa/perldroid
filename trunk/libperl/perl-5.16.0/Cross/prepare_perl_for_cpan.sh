#! /bin/bash

VERSION=5.16.0

if [[ ! -d ~/perl-$VERSION/install_me_here || -e ~/perl-$VERSION/fake_config_library/strict.pm || -d ~/.cpan.android ]]; then
    echo "You don't want to do that. See README.android"
    cat README.android 2>/dev/null
    exit 0
fi

mkdir -p ~/.cpan.android/CPAN
cp MyConfig.pm ~/.cpan.android/CPAN/

cd ~/perl-$VERSION/
cp ~/perldroid/libperl/perl-$VERSION/Cross/cpan.android .

mv perl perl.arm
ln -s miniperl perl
mv fake_config_library/Config.pm fake_config_library/Config_heavy.pl install_me_here/lib/
rmdir fake_config_library && ln -s install_me_here/lib/ fake_config_library

echo Now do:
echo cd ~/perl-$VERSION/
echo PATH=\$PATH:~/perl-$VERSION
echo ./cpan.android MODULE::TO::INSTALL ...