#!/usr/bin/env -S bash -x

kubectl get ingress harbor-ingress -o yaml > harbor/harbor-ingress.yaml
sed -i 's/host: localhost/host:/' harbor/harbor-ingress.yaml
kubectl delete ingress harbor-ingress
kubectl apply -f harbor/harbor-ingress.yaml
