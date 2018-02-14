.PHONY : all
all : docker build install

docker:
	docker build -t ergodox-ez-compiler .

build:
	docker run -it --rm -v $(CURDIR):/keymap ergodox-ez-compiler

clean:
	rm hergodox_ez.hex

install:
	teensy_loader_cli -mmcu=atmega32u4 -w -v ergodox_ez.hex
