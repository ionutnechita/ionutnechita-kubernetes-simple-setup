#!/usr/bin/env -S bash -x

NETWORK_SELECTOR=$(docker network inspect -f '{{.IPAM.Config}}' kind  | grep 172. | awk '{ print $1 }' | cut -d{ -f2- | cut -d. -f2)

cat <<EOF >metallb-config.yaml
apiVersion: metallb.io/v1beta1
kind: IPAddressPool
metadata:
  name: example
  namespace: metallb-system
spec:
  addresses:
  - 172.${NETWORK_SELECTOR}.255.200-172.${NETWORK_SELECTOR}.255.250
---
apiVersion: metallb.io/v1beta1
kind: L2Advertisement
metadata:
  name: empty
  namespace: metallb-system
EOF

kubectl apply -f metallb-config.yaml --wait
