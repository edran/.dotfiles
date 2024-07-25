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
$ ansible-galaxy install -r requirements.yml
$ ansible-playbook main.yml --ask-become-pass
```


## After install

### Patching Berkeley Mono

Worth maybe updating the first fonts on gdrive with a new version available at [Berkeley Graphics](https://berkeleygraphics.com).

After starting the docker daemon:

``` shell
$ docker run --rm \
  -v /path/to/fonts:/in \
  -v /path/for/output:/out nerdfonts/patcher \
  nerdfonts/patcher \
  --progressbars \
  --mono \
  --adjust-line-height \
  --complete
```

The open `Font Book` and install the fonts manually.
