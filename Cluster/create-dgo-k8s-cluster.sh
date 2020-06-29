doctl k8s cluster create dgo-cluster-06 --region tor1 --version 1.18.3-do.0 --tag demo --size s-1vcpu-2gb --count 3
doctl kubernetes cluster kubeconfig save dgo-cluster-06
kubectl config use-context do-tor1-dgo-cluster-06
