#!/bin/sh

dir=/home/master/Baby/Recon/$1

mkdir $dir

echo https://$1 | python3 /home/master/smuggler/smuggler.py > $dir/$1_smuggler
