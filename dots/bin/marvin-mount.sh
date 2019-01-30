#!/usr/bin/env bash

umount ~/sshfs/marvin
sshfs -o Cipher=arcfour128 -o Compression=no marvin:/home/nantas ~/sshfs/marvin/
