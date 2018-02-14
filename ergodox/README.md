# ErgodoxEZ configuration

This directory contains my own **ErgodoxEZ** configuration, plus a small docker
image with a script and all the dependencies needed to build its firmware using
the latest available Quantum Mechanical Keyboard Firmware.

Furthermore, it automatically clones a [fork](edran/teensy_loader_cli) of
`teensy_loader_cli` which builds on MacOS using libusb instead of HID (because
karabiner-elements somehow interferes with HID).


## Usage

```bash
# build the docker image
$ make docker

# build the teensy_loader_cli
$ brew install libusb  # required!
$ make loader

# build hex
$ make build

# flash to ergodox
$ make install
```

Alternatively:

```bash

$ brew install libusb
$ make
```

Finally, run `make docker_rebuild` to update the firmware repository if
necessary.


## Useful links

* [qmk_firmware](https://github.com/jackhumbert/qmk_firmware).


## Licence

Forked from https://github.com/potz/docker-ergodox-ez-compiler.

Original license: [MIT](https://opensource.org/licenses/MIT)
