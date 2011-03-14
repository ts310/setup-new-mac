#!/bin/bash

echo 'Setting up new mac'

echo '----------------------------------------------------'

echo 'Installing homebrew to' $HOME'/.homebrew/'
echo 'Would you like to continue? [yes]'
read answer
if [ "${answer}" == 'yes' ];
then
  brew install git tig lv wget
fi

echo '----------------------------------------------------'

echo 'Installing rvm (ruby version manager)'
echo 'Would you like to continue? [yes]'
read answer
if [ "${answer}" == 'yes' ];
then
  bash < <( curl http://rvm.beginrescueend.com/releases/rvm-install-head )
  type rvm | head -1
  source ~/.rvm/scripts/rvm
  rvm notes
fi

echo '----------------------------------------------------'

echo 'Would you like to install default system ruby? [yes]'
read answer
if [ "${answer}" == 'yes' ];
then
  rvm system ; which ruby ; rvm gemset export system.gems ;
  rvm install 1.8.7 ;
  rvm 1.8.7 ; rvm gemset import system ;
  rvm --default 1.8.7 ;
fi
