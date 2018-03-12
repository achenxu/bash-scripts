#!/bin/bash

GH_DIR=${PWD##*/}

git remote set-url origin git@personal:terribledevice/${echo $GH_DIR}.git

unset GH_DIR