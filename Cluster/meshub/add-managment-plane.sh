
doctl k8s cluster create dgo-management-plane --region tor1 --version 1.18.3-do.0 --tag demo --size s-1vcpu-2gb --count 3
doctl kubernetes cluster kubeconfig save dgo-management-plane --context management-plane-context
kubectl config use-context management-plane-context
curl -sL https://run.solo.io/meshctl/install | sh
export PATH=$HOME/.service-mesh-hub/bin:$PATH

meshctl install --context management-plane-context
# note here that you could replace "istio1.5" with "istio1.6" to install that version
meshctl mesh install istio1.6 --context management-plane-context --operator-spec=- <<EOF
apiVersion: install.istio.io/v1alpha1
kind: IstioOperator
metadata:
  name: istiocontrolplane-default
  namespace: istio-operator
spec:
  profile: default
  addonComponents:
    istiocoredns:
      enabled: true  
  values:
    global:
      controlPlaneSecurityEnabled: true
      mtls:
        enabled: true
      pilotCertProvider: kubernetes
      podDNSSearchNamespaces:
      - global
      - '{{ valueOrDefault .DeploymentMeta.Namespace "default" }}.global'
    prometheus:
      enabled: false
EOF

meshctl check
kubectl label namespace default istio-injection=enabled
meshctl cluster register \
  --remote-cluster-name dgo-management-plane \
  --remote-context management-plane-context
