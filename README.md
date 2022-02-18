# kubernetes-homelab
Homelab automation for a K8s environment - fully virtualized and automated with GitOps



# Features
- [x] Automatic infrastructure set up using Vagrant
- [x] Kubernetes bootstrapping via K3s.io
- [ ] ArgoCD 
  - [x] Installation 
  - [ ] SSO / OIDC
  - [ ] Connect to app of apps repo (this repo)
- [ ] Determine consistent routing pattern for apps installed via ArgoCD
- [ ] DNS / SSL cert handling
  - [ ] Get trusted SSL certs for local DNS domain
  - [ ] Secure storage of SSL private key  
- [ ] Kubernetes Dashboard
- [ ] Operator Lifecycle Manager
- [ ] Log aggregation
  - [ ] Fluent bit
  - [ ] ELK? Loki? 
- [ ] Auth to Dash with Oauth/SSO
  - [ ] Dex/Authentik?
  - [ ] Kube oauth proxy
- [ ] Kube ops view
- [ ] Monitoring stack: prometheus/grafana/alertmanager
- [ ] Service mesh? 
- [ ] DNS/SSL/Cert management
- [ ] CI/CD - via Tekton?
- [ ] Private Container Registry
- [ ] Distributed Storage
  - [ ] Ceph?
  - [ ] Longhorn?
- [ ] Secrets mangement via Vault/Credhub
