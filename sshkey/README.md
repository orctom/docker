# sshkey
Generate ssh key on first run (when `~/.ssh/id_rsa` not exists)

## What's in it
 * Base Image: `apline:latest`
 * Installed Packages: `openssh`
 * Image Size: ~10 MB

## How to use it
 * ```sudo docker run --name sshkey orctom/sshkey```
 * ```sudo docker run -d --name jenkins --volumes-from sshkey orctom/jenkins```