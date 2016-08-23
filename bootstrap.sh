#!/bin/sh
#
# bootstrap devbox
# debian specific
#
CHEFDK_PKG="chefdk_0.17.17-1_amd64.deb"
CHEFDK_URL="https://packages.chef.io/stable/debian/8/$CHEFDK"

if [ $UID != "0" ]; then
  echo "Please run as root"
  exit 1
fi

#
# install prerequisites
#
apt-get install sudo build-essential git ruby ruby-dev rake
gem install bundle

#
# install ChefDK
#
pushd /tmp
wget --no-clobber $CHEFDK_URL
dpkg -i $CHEFDK_PKG
popd

#
# add chef gem binaries to PATH
#
PATH=`chef env | grep "GEM HOME" | cut -d: -f2 | tr -d \"`/bin:$PATH

#
# install chefzero_simple gem into chef gem repo
#
git clone https://github.com/christopherdeutsch/chefzero_simple.git
pushd chefzero_simple
bundle install
bundle exec rake build
chef gem install pkg/chefzero_simple-*.gem
popd

#
# set up the devbox
#
git clone https://github.com/christopherdeutsch/devbox.git
pushd devbox
chef exec rake chefzero_simple
popd

echo "Done!"
