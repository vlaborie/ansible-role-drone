# Ansible role Drone

Deploy [Drone](https://drone.io/) server or agent (or both) from GO binaries and run them with systemd service.

Binaries are managed by [Git LFS](https://git-lfs.github.com/), on Debian you can install it with:

~~~
sudo apt install git-lfs
~~~

## Build drone binaries

For building Drone binaries, you need docker and make, on Debian run:

~~~
sudo apt install docker.io make
~~~

And then run make:

~~~
make
~~~
