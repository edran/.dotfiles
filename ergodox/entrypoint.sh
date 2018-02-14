#!/bin/bash

if [ ! -f "/keymap/keymap.c" ]; then
  echo "No keymap.c found!"
  exit 1
fi

cd /firmware/keyboards/ergodox_ez

rm -rf keymaps/custom                # (just in case...)
mkdir -p keymaps/custom
cp /keymap/keymap.c keymaps/custom/

cd /firmware

make ergodox_ez:custom

cp -f /firmware/.build/ergodox_ez_custom.hex /keymap/ergodox_ez.hex
