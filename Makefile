NAME=mullvad-api
VERSION=$(shell cat VERSION)
BUILD=$(shell git rev-parse --short HEAD)

default: build

deps:
	dart pub get

build: deps
	dart compile exe -o $(NAME) bin/main.dart
