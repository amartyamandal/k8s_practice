<<<<<<< HEAD
doctl k8s cluster create dgo-cluster-05 --region tor1 --version 1.18.3-do.0 --tag demo --size s-1vcpu-2gb --count 3
doctl kubernetes cluster kubeconfig save dgo-cluster-05
kubectl config use-context do-tor1-dgo-cluster-05
=======
doctl k8s cluster create dgo-cluster-04 --region tor1 --version 1.18.3-do.0 --tag demo --size s-1vcpu-2gb --count 3
doctl kubernetes cluster kubeconfig save dgo-cluster-04
kubectl config use-context do-tor1-dgo-cluster-04
>>>>>>> 8bfc859f96ded253b4a0a84fb052193f7c891cdc
