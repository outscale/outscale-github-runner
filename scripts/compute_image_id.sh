#!/bin/bash

echo image_id=\"$(jq -r '.builds[0].artifact_id' packer/manifest.json | awk -F ':' '{ print $2}')\" | tee terraform/omi.tfvars