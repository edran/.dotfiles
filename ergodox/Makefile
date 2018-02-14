.PHONY : all
all : docker loader build install

docker:
	docker build -t ergodox-ez-compiler .

build:
	docker run -it --rm -v $(CURDIR):/keymap ergodox-ez-compiler

install:
	./teensy_loader_cli/teensy_loader_cli -mmcu=atmega32u4 -w -v ergodox_ez.hex

loader:
	-git clone git@github.com:edran/teensy_loader_cli -b macos_build
	$(MAKE) -C teensy_loader_cli clean
	$(MAKE) -C teensy_loader_cli

clean:
	-rm hergodox_ez.hex

docker_rebuild:
	docker build --no-cache -t ergodox-ez-compiler .
