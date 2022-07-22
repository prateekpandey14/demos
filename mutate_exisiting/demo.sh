#!/bin/bash

source <(curl -s -L https://raw.githubusercontent.com/paxtonhare/demo-magic/master/demo-magic.sh)

{
    cat *.yaml | kubectl delete --ignore-not-found -f -
    kubectl delete ns alpha --ignore-not-found
} 1> /dev/null 2>&1


pe "cat restart_pod_on_secret_update_policy.yaml"
pe "cat basic-secret.yaml"
pe "kubectl apply -f basic-secret.yaml"
pe "kubectl create deployment busybox --image=nginx:1.14.2"
pe "kubectl apply -f restart_pod_on_secret_update_policy.yaml"
pe "cat basic-secret-1.yaml"
pe "kubectl apply -f basic-secret-1.yaml"
pe "kubectl get pods"
pe "kubectl get deployment -l app=busybox -oyaml"
