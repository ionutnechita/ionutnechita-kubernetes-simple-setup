#!/usr/bin/env -S bash -x

./helm repo add metrics-server https://kubernetes-sigs.github.io/metrics-server
./helm repo update
./helm install metrics-server metrics-server/metrics-server --set args="{--kubelet-insecure-tls}" -n kube-system
