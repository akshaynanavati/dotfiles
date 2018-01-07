#!/bin/bash

read -p 'Name: ' name
read -p 'Email: ' email

sed "s/YOUR_NAME_HERE/$name/g" gitconfig.tmpl | sed "s/YOUR_EMAIL_HERE/$email/g" > gitconfig.tmp
mv gitconfig.tmp $HOME/.gitconfig
