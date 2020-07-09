# edran's dotfiles

***

These dotfiles are compatible with `MacOS Mojave` and `Ubuntu 20.04` (and
possibly `18.04` too). Most of the configuration files can be found in `dots/`.

Feel free to check things out, and copy whatever is needed, but please don't run
it as-is, as it might mess up your system.

## Installation

There are two install levels, `basic` and `full`. The former is for systems
where I require a quick installation and setup of basic tooling (like shell +
editor), and where I most likely do not have root access. The latter for my own
machines.

The automatic installation requires the following:

1. ssh authentication setup for github
2. `python3` + `ansible`


If these are done, then it's just a matter of running:

``` sh
$ git clone git@github.com:edran/.dotfiles ~/.dotfiles
$ cd .dotfiles/
$ ansible-playbook --ask-become-pass -i ansible/inventory ansible/<basic|full>.yml 
```


### After installation

There are a couple of things that need to be done, after the first installation
(but not necessarily subsequent playbook runs).

1. Reload the shell to make sure everything is sourced.
2. Run `zinit self-update` to finish configuring `zsh`.
3. Run `fast-theme clean` to set zsh highlighting.
