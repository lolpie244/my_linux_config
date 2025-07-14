SHELL := /bin/bash
VENV := source .venv/bin/activate &&
MAKE := $(MAKE) -f $(firstword $(MAKEFILE_LIST))
IGNORE_OUTPUT = &> /dev/null
