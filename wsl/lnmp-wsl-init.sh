#!/usr/bin/env bash

#
# init WSL
#

sudo sed -i "s#deb.debian.org#mirrors.ustc.edu.cn#g" /etc/apt/sources.list
sudo sed -i "s#security.debian.org#mirrors.ustc.edu.cn#g" /etc/apt/sources.list

if [ -z $APP_ENV ];then
  echo "export APP_ENV=wsl" >> ~/.bash_profile
fi

if [ -z $WSL_HOME ];then
  echo "export WSL_HOME=/mnt/c/Users/90621" >> ~/.bash_profile
fi

if [ -z $COMPOSER_HOME ];then
  echo "export COMPOSER_HOME=/tmp" >> ~/.bash_profile
fi

sudo apt update && sudo apt install \
                            bash-completion \
                            vim \
                            git \
                            curl \
                            wget \
                            lsb-release

# composer cn mirror

command -v composer && composer config -g repo.packagist composer https://packagist.phpcomposer.com
