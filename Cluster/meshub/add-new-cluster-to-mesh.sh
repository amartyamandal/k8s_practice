doctl k8s cluster create dgo-cluster-12 --region tor1 --version 1.18.3-do.0 --tag demo --size s-1vcpu-2gb --count 3
doctl kubernetes cluster kubeconfig save dgo-cluster-12 --context remote-cluster-context
kubectl config use-context remote-cluster-context
curl -sL https://run.solo.io/meshctl/install | sh
export PATH=$HOME/.service-mesh-hub/bin:$PATH

meshctl install --context remote-cluster-context

# note here that you could replace "istio1.5" with "istio1.6" to install that version
meshctl mesh install istio1.6 --context remote-cluster-context --operator-spec=- <<EOF
apiVersion: install.istio.io/v1alpha1
kind: IstioOperator
metadata:
  name: istiocontrolplane-default
  namespace: istio-operator
spec:
  profile: default
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
  --remote-cluster-name dgo-cluster-12 \
  --remote-context remote-cluster-context