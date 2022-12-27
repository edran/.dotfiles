These dotfiles are compatible with `MacOS Monterey`, and with a good amount
massaging they can probably work across a bunch of recent linux distributions.

Feel free to check things out, and copy whatever may be necessary (since I've
done the same), but please don't run it as-is, as it might mess up your system.

You have been warned. Hopefully.

```
                        <>=======()
                       (/\___   /|\\          ()==========<>_
                             \_/ | \\        //|\   ______/ \)
                               \_|  \\      // | \_/
                                 \|\/|\_   //  /\/
                                  (oo)\ \_//  /
                                 //_/\_\/ /  |
                                @@/  |=\  \  |
                                     \_=\_ \ |
                                       \==\ \|\_
                                    __(\===\(  )\
                                   (((~) __(_/   |
                                        (((~) \  /
                                        ______/ /
                                        '------'
```

## Quick start

``` sh
$ git clone git@github.com:edran/.dotfiles ~/.dotfiles
$ cd .dotfiles/ansible
$ ansible-playbook main.yml --ask-become-pass
```

