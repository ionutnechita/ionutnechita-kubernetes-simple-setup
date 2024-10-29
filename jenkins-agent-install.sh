#!/usr/bin/env -S bash -x

./helm install jenkins-agent -f jenkins-agent-helm/custom-values.yaml jenkins-agent-helm --wait
