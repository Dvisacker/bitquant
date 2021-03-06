Requirements
------------

The docker script requires docker 1.8 to implement cp from containers

Running an image
----------------

To run

    ./start-server.sh

The image for bitstation is stored on docker hub as
joequant/bitstation which will be downloaded automatically by the
script.

The scripts assume that you have set up docker to be runnable by your
user account.  You can also set the environment variable SUDO to sudo
if you are running docker via root.

You can then connect to the system via the localhost port 80

To build the image locally
--------------------------

    make

You may need to run make with "sudo make" if docker can only run under root

Notes
-----

The docker script to build a base mageia image is

https://raw.githubusercontent.com/joequant/docker-brew-mageia/master/mkimage-urpmi.sh

Troubleshooting
---------------

There appear to be some conflicts between docker networking and
firewalls.  You should open the port 80 to the docker network before
running docker.  Also you make have to restart the docker after
resetting the firewall.

Add user to docker

http://askubuntu.com/questions/477551/how-can-i-use-docker-without-sudo
