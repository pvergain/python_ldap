# makefile for quality code.
#
# ATTENTION:
#
# - le marqueur est la tabulation
#
# Exemples
# =========
# https://github.com/kennethreitz/requests/blob/master/Makefile
#

# https://www.gnu.org/prep/standards/html_node/Makefile-Basics.html#Makefile-Basics
SHELL = /bin/bash

# Put it first so that "make" without argument is like "make help".
help:
	@echo " "
	@echo "Targets:"
	@echo " "
	@echo "- make build"
	@echo "- make images"
	@echo "- make autoupdate"
	@echo " "


check_all:
	pre-commit run --all-files

autoupdate:
	pre-commit autoupdate

build:
	docker build --tag python_ldap:3.9.0-slim-buster .

images:
	docker images

.PHONY: help  Makefile

# Catch-all target:
%: Makefile
	echo "Hello World !"
