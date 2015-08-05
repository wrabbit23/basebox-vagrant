# Sample Vagrant

A bare bones vagrant install with node.  It'll get you started, yo.

## To use

1. Install VirtualBox (https://www.virtualbox.org/)
2. Install Vagrant (https://www.vagrantup.com/)
3. Clone this repo
5. In the root of the repo:
    * `vagrant plugin install vagrant-hostmanager` - this manages all changes to hosts files
    * `vagrant plugin install vagrant-vbguest` - this keeps the guest additions upgraded so you don't have to worry about upgrading vagrant or virtualbox
    * if you are on windows 10 and they haven't fixed the crap yet, run the hackyfix so vagrant can set up the network properly (https://www.virtualbox.org/ticket/14040)
    * `vagrant up`
6. Mount the development directory
   * On windows:
     1. Open "My Computer"
     2. Click "Map network drive"
     3. Enter: `\\10.11.12.13\shared`
     4. Check "Reconnect at logon"
   * On a mac:
     1. Open finder
     2. `command+k`
     2. use the following URI: `cifs://GUEST:@10.11.12.13/shared`
7. ssh into the vm: `vagrant ssh`
   * note: if you had an existing git configuration, it should already be copied along with your ssh keys
   * actually, it requires a git configuration and ssh keys or the install will fail, sorry :(, i ought to fix this at some point
8. `cd development`
9. clone projects here

## What does this come with?

1. ubuntu
2. node.js pre-installed
3. samba server for file share

* check shell/bootstrap.sh for other packages that are installed

## How to change which ports are forwarded?

* open Vagrantfile and read the source, Luke
