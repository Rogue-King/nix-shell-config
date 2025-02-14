#!/bin/bash

git pull

cp -r home-manager/ ~/.config/

home-manager switch
