Tool to quickly deploy openstack dev environments.

# Goals

* To quickly build dev openstack environments in clean natty environments
* To describe working configurations of openstack (which code branches work together?  what do config files look like for those branches?)
* To make it easier for developers to dive into openstack so that they can productively contribute without having to understand every part of the system at once
* To make it easy to prototype cross-project features

Read more at http://devstack.org (built from the gh-pages branch)

Be sure to carefully read these scripts before you run them as they install software and may alter your networking configuration.

# To start a dev cloud on your local machine (installing on a dedicated vm is safer!):

    ./stack.sh

If working correctly, you should be able to access openstack endpoints, like:

* Horizon: http://myhost/
* Keystone: http://myhost:5000/v2.0/

# To start a dev cloud in an lxc container:

    ./build_lxc.sh

You will need to configure a bridge and network on your host machine (by default br0) before starting build_lxc.sh.  A sample host-only network configuration can be found in lxc_network_hostonlyplusnat.sh.

# To start a dev cloud on EC2
I used cloudsidekick-cato-v1.0.3-x86_64-ubuntu-oneiric (ami-cf458ba6) image.
It is required to reset mysql password on this image:
    ./mysql_reset.sh
- this command will reset mysql root password to 'nova'.

# Customizing

You can tweak environment variables by creating file name 'localrc' should you need to override defaults.  It is likely that you will need to do this to tweak your networking configuration should you need to access your cloud from a different host.

# Todo

* Add python-novaclient cli support
* syslog
* Add volume support
* Add quantum support

# Future

* idea: move from screen to tmux?
* idea: create a live-cd / vmware preview image using this?
