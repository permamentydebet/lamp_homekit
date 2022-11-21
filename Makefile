PROJECT_DIR := ${PWD}
MAIN_SRC_DIR := ${PROJECT_DIR}/src
OBJECT_DIR = ${PROJECT_DIR}/build

SHELL := /bin/bash

SDK_ROOT_DIR ?= ${PROJECT_DIR}
SDK_PATH = ${SDK_ROOT_DIR}/ESP8266_RTOS_SDK
SDK_EXPORT_ENVS = ${IDF_PATH}/export.sh

SUDO ?= sudo

sdk-install-prerequisites:
	${SUDO} apt-get update \
	&& ${SUDO} apt-get install -y gcc git wget make libncurses-dev flex bison gperf python3 python3-pip python-is-python3 \
	&& pip3 install pyserial

sdk-download:
	git clone https://github.com/espressif/ESP8266_RTOS_SDK.git

sdk-install:
	${SDK_PATH}/install.sh

get-sdk:
	source ${SDK_EXPORT_ENVS}

setup-sdk:
	make sdk-install-prerequisites \
	sdk-download \
	sdk-install
