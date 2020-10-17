#!/bin/bash

dir=/home/master/Baby/Recon/$1

cat $dir/$1_subdomains| httpx -silent |sort -u| nuclei -c 200 -silent -t /home/master/nuclei-templates/ -o $dir/$1_nuclei
