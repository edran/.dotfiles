# ErgodoxEZ firmware compiler

This is a small docker image that has a script and all the dependencies needed
an **Ergodox EZ** firmware. It uses the latest available Quantum Mechanical
Keyboard Firmware.


## Usage

```bash
# build the docker image
$ make docker

# build hex
$ make build

# flash to ergodox
$ make install

# (alternatively)
$ make
```

Rebuild the docker image to update the firmware repository.


## Useful links

* [qmk_firmware](https://github.com/jackhumbert/qmk_firmware).


## Licence

Forked from https://github.com/potz/docker-ergodox-ez-compiler.

Original license: [MIT](https://opensource.org/licenses/MIT)
