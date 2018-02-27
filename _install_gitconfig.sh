#!/bin/bash

read -p 'Name: ' name
read -p 'Email: ' email

sed "s/YOUR_NAME_HERE/$name/g" gitconfig.tmpl | sed "s/YOUR_EMAIL_HERE/$email/g" | sed "s#YOUR_HOME_DIR_HERE#$HOME#g" > gitconfig.tmp
mv gitconfig.tmp $HOME/.gitconfig
