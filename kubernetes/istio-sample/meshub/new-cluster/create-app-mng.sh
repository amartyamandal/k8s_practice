kubectl apply -f https://raw.githubusercontent.com/amartyamandal/k8s_practice/master/kubernetes/apps/test-istio2.yaml
kubectl apply -f https://raw.githubusercontent.com/amartyamandal/k8s_practice/master/kubernetes/istio-sample/meshub/production-issuer-istio.yaml
kubectl apply -f https://raw.githubusercontent.com/amartyamandal/k8s_practice/master/kubernetes/istio-sample/meshub/new-cluster/ingress-cert-istio.yaml
kubectl apply -f https://raw.githubusercontent.com/amartyamandal/k8s_practice/master/kubernetes/istio-sample/meshub/new-cluster/ingress-gateway-istio.yaml
kubectl apply -f https://raw.githubusercontent.com/amartyamandal/k8s_practice/master/kubernetes/istio-sample/meshub/new-cluster/ingress-vs-istio.yaml