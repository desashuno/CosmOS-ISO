#!/bin/bash

echo 'deliting all the non prescindible content'
sleep 0.5
sudo rm -rv PKGBUILD local_repo out_dir work_dir

echo 'adding all in the main branch'
git add --all .

echo 'write your commit comment:'

read input

git commit -m "$input"

git push -f -u origin main

echo 'done :)'
