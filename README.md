# edran's dotfiles

<p align="center">
<a href="https://travis-ci.org/edran/.dotfiles">
<img src="https://travis-ci.org/edran/.dotfiles.svg"
     alt="Build Status"></a>
</p>

***

Compatible with `Ubuntu Xenial (16.04)` and `MacOS High Sierra`. Most of the
configuration can be found in `dots/`, but the installation (and update)
procedure is almost completely based on [ansible](https://www.ansible.com/) and
lives in `ansible/`.

See `Dockerfile` and `.travis.yml` to also check how it gets automagically
tested.


## One liner

`$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/edran/.dotfiles/master/install/install.sh)"`


## "Manual" installation

* `$ git clone --recursive git@github.com:edran/.dotfiles`
* `$ cd .dotfiles/install`
* `$ ./install.sh`


## Update local installation

* `$ git pull origin <branch>` (likely master)
* `$ ansible-playbook -i ansible/inventory ansible/full.yml --ask-become-pass`
* You can also just run `install.sh`.

