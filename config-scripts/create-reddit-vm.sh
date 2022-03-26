#!/bin/bash
rm -f output.json
packer build -var-file=variables.json immutable.json
image_id=$(cat ./output.json | grep artifact_id | awk '{print $2}' | sed s/\"//g | sed s/\,//g)
yc compute instance create \
  --name reddit-app \
  --hostname reddit-app \
  --memory=4 \
  --preemptible=true \
  --create-boot-disk name=disk1,size=10,image-id=$image_id \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata serial-port-enable=1 \
  --metadata-from-file user-data=../packer/files/metadata.yml
image_id=""
