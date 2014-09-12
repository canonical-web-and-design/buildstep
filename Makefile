
all: build

build: 
	rm -rf .ssh .bazaar
	cp -r ~/.ssh .ssh
	cp -r ~/.bazaar .bazaar
	docker build -t progrium/buildstep .
	rm -rf .ssh .bazaar

