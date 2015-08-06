#!/bin/sh

set -e

# generate ssh key if not exist
. ~/.ssh/gen_ssh_key.sh

if [ "$1" == "-sh" ]; then
  /bin/sh
fi
