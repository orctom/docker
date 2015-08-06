#!/bin/sh

BASEDIR=`dirname $0`

if [ ! -f ~/.ssh/id_rsa ];
then
  ssh-keygen -q -N "" -t rsa -f ~/.ssh/id_rsa
  cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
  chmod -R 600 ~/.ssh/
  cp $BASEDIR/config ~/.ssh/
  echo -e "SSH Key Generated Successfully!"
fi