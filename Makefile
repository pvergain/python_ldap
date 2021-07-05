# makefile for quality code.
#
# ATTENTION:
#
# - le marqueur est la tabulation
#
# https://www.gnu.org/prep/standards/html_node/Makefile-Basics.html#Makefile-Basics
SHELL = /bin/bash

# Put it first so that "make" without argument is like "make help".
# docker exec -it 4b09 /bin/bash
help:
	@echo " "
	@echo "Targets:"
	@echo " "
	@echo "- make build (1)"
	@echo "- make images"
	@echo "- make run"
	@echo "- make login (2)"
	@echo "- make ps"
	@echo "- make push (push to docker) (3)"
	@echo "- make autoupdate"
	@echo " "


check_all:
	pre-commit run --all-files

autoupdate:
	pre-commit autoupdate

build:
	docker build --tag pvergain/python_ldap:3.9.6-slim-buster .

login:
	docker login

run:
	# https://docs.docker.com/docker-hub/#step-3-download-and-install-docker-desktop
	docker run pvergain/python_ldap:3.9.6-slim-buster

push:
	docker push pvergain/python_ldap:3.9.6-slim-buster

images:
	docker images

ps:
	docker ps


.PHONY: help  Makefile

# Catch-all target:
%: Makefile
	echo "Hello World !"
