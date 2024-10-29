#!/usr/bin/env -S bash -x

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/main/config/manifests/metallb-native.yaml --wait

PODS_NR=$(kubectl get pods -l app=metallb -n metallb-system | grep Running | wc -l)

while [ ! $PODS_NR -eq 3 ]
do
 PODS_NR=$(kubectl get pods -l app=metallb -n metallb-system | grep Running | wc -l)
 sleep 15
done
