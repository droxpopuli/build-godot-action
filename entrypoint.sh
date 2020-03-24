#!/bin/sh
set -e

# Setup templates
mkdir -p ${HOME}/.cache
mkdir -p ${HOME}/.config/godot
mkdir -p ${HOME}/.local/share/
ln -s /opt/godot ${HOME}/.local/share/

# Alias args
PROJECT_NAME=${1}
PROJECT_DIR=${2}
BUILD_PRESET=${3}
BUILD_DIR= ${4}
RUN_TESTS=${5}
USE_LATEST=${6}
DEBUG_MODE=${7}

# Location of Build Directory.
BUILD_DIR="~/build/${BUILD_DIR}"

# Debug Export Flag
mode="export"
if [ "${DEBUG_MODE}" = "true" ]
then
    mode="export-debug"
fi

branch="stable"
if [ "${USE_LATEST}" = "true" ]
then
    branch="latest"
fi

is_latest="stable"
if [ "${USE_LATEST}" != "" ]
then
    is_latest="latest"
fi

if [ "${PROJECT_DIR}" != "" ]
then
    cd ${PROJECT_DIR}
fi

if [ "${RUN_TESTS}" = "true" ]
then
    # Test
    echo "Testing ${PROJECT_NAME} on ${is_latest}"
    godot-${branch} -d -s --path $PWD addons/gut/gut_cmdln.gd
else
    # Export
    echo "Building ${PROJECT_NAME} for ${BUILD_PRESET} on ${is_latest}"
    mkdir -p ${BUILD_DIR}
    echo "Running: godot-${branch} --${mode} ${BUILD_PRESET} ${BUILD_DIR}${PROJECT_NAME}-${BUILD_PRESET}"
    godot-${branch} --${mode} ${BUILD_PRESET} ${BUILD_DIR}${PROJECT_NAME}-${BUILD_PRESET}
    zip ${BUILD_DIR}${PROJECT_NAME}-${BUILD_PRESET}.zip ${BUILD_DIR} -r
    ls -al --color ${BUILD_DIR}
fi
