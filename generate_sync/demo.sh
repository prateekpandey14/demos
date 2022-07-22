#!/bin/bash

source <(curl -s -L https://raw.githubusercontent.com/paxtonhare/demo-magic/master/demo-magic.sh)

{
    cat *.yaml | kubectl delete --ignore-not-found -f -
    kubectl delete ns alpha --ignore-not-found
} 1> /dev/null 2>&1

pe "kubectl create ns stagging"
pe "cat basic-secret.yaml"
pe "cat sync-secret-policy.yaml"
pe "kubectl apply -f basic-secret.yaml"
pe "kubectl apply -f sync-secret-policy.yaml"
pe "kubectl create ns alpha"
pe "kubectl -n alpha get secret regcred -oyaml"
pe "cat basic-secret-1.yaml"
pe "kubectl apply -f basic-secret-1.yaml"
pe "kubectl -n alpha get secret regcred -oyaml"
pe "kubectl get secret regcred -oyaml"
pe "cat sync-secret-with-gen-existing-policy.yaml"
pe "kubectl apply -f sync-secret-with-gen-existing-policy.yaml"
pe "kubectl get secret -n stagging"
pe "kubectl -n stagging get secret regcred -oyaml"
