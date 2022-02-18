#!/bin/bash
echo "Running bootstrap.sh on $(hostname)"
KUBE_ENDPOINT=$(sudo cat /etc/systemd/system/k3s-agent.service.env | grep -i K3S_URL | awk -F "'" '{print $2}')
echo $KUBE_ENDPOINT
mkdir -p ~/.kube
cat /vagrant/k3s.yaml | sed -e "s|https://127.0.0.1:6443|${KUBE_ENDPOINT}|g" > ~/.kube/config
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl patch deployment argocd-server --namespace argocd --type='json' -p='[{"op": "replace", "path": "/spec/template/spec/containers/0/args", "value": ["--insecure"]}]'; 
kubectl apply -f /vagrant/argocd-ingress-route.yml
