.PHONY : all
all : docker build

docker:
	docker build .

build:
	docker run --rm -v $(CURDIR):/keymap ergodox-ez-compiler

clean:
	rm hergodox_ez.hex

install:
	echo "All done!"
