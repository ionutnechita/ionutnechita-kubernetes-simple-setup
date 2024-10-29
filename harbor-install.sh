#!/usr/bin/env -S bash -x

./helm repo add harbor https://helm.goharbor.io
./helm repo update
./helm install harbor harbor/harbor -f harbor/values.yaml --wait
