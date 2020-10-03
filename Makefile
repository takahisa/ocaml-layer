REPO := ocaml-layer
USER := takahisa
TAG := $(shell cat TAG)

system: opam/Dockerfile
	docker build -t ghcr.io/$(USER)/$(REPO)/opam:system-$(TAG) opam/
	docker tag ghcr.io/$(USER)/$(REPO)/opam:system-$(TAG) ghcr.io/$(USER)/$(REPO)/opam:system

4.10.1: opam-4.10.1/Dockerfile
	make -C . system
	docker build -t ghcr.io/$(USER)/$(REPO)/opam:4.10.1-$(TAG) opam-4.10.1/
	docker tag ghcr.io/$(USER)/$(REPO)/opam:4.10.1-$(TAG) ghcr.io/$(USER)/$(REPO)/opam:4.10.1

4.11.1: opam-4.10.1/Dockerfile system
	make -C . system
	docker build -t ghcr.io/$(USER)/$(REPO)/opam:4.11.1-$(TAG) opam-4.11.1/
	docker tag ghcr.io/$(USER)/$(REPO)/opam:4.11.1-$(TAG) ghcr.io/$(USER)/$(REPO)/opam:4.11.1

publish: system 4.10.1 4.11.1
	docker push ghcr.io/$(USER)/$(REPO)/opam:system-$(TAG)
	docker push ghcr.io/$(USER)/$(REPO)/opam:system
	docker push ghcr.io/$(USER)/$(REPO)/opam:4.10.1-$(TAG)
	docker push ghcr.io/$(USER)/$(REPO)/opam:4.10.1
	docker push ghcr.io/$(USER)/$(REPO)/opam:4.11.1-$(TAG)
	docker push ghcr.io/$(USER)/$(REPO)/opam:4.11.1

