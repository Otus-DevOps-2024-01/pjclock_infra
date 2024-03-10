#!/bin/bash

image_id=$(yc compute images get-latest-from-family reddit-full | grep "^id" | awk '{print $2}')

yc vpc network create --name default
yc vpc subnet create --name default-ru-central1-a --zone ru-central1-a --range 172.16.0.0/24 --network-name default

yc compute instance create --name reddit-app --hostname reddit-app --ssh-key /Users/e.loginov/.ssh/ubuntu.pub --zone ru-central1-a --create-boot-disk image-id=$image_id --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 
