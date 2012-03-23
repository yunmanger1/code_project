#!/bin/bash

#WORKING_DIR=../
#ACTIVATE_PATH=../bin/activate
#MY_PATH="`dirname \"$0\"`"              # relative
#MY_PATH="`( cd \"$MY_PATH\" && pwd )`"  # absolutized and normalized

source envs/code_project/bin/activate
exec $@
