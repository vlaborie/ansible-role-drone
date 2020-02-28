GOLANG=golang:1.13.8-buster

.PHONY: version clean

all: version files/drone-server files/drone-agent

src/.git:
	git submodule update --recursive --init

version:
	docker run -it $(GOLANG) go version

files/drone-server: src/.git
	docker run -it -v$(PWD):/data -w /data/src $(GOLANG) go build -o ../files/drone-server github.com/drone/drone/cmd/drone-server

files/drone-agent: src/.git
	docker run -it -v$(PWD):/data -w /data/src $(GOLANG) go build -o ../files/drone-agent github.com/drone/drone/cmd/drone-agent

clean:
	find src -mindepth 1 -delete && rm -f files/drone-server files/drone-agent
