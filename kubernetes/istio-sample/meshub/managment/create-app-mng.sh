kubectl apply -f https://raw.githubusercontent.com/amartyamandal/k8s_practice/master/kubernetes/apps/test-istio1.yaml
kubectl apply -f https://raw.githubusercontent.com/amartyamandal/k8s_practice/master/kubernetes/istio-sample/meshub/production-issuer-istio.yaml
kubectl apply -f https://raw.githubusercontent.com/amartyamandal/k8s_practice/master/kubernetes/istio-sample/meshub/managment/ingress-cert-istio.yaml
kubectl apply -f https://raw.githubusercontent.com/amartyamandal/k8s_practice/master/kubernetes/istio-sample/meshub/managment/ingress-gateway-istio.yaml
kubectl apply -f https://raw.githubusercontent.com/amartyamandal/k8s_practice/master/kubernetes/istio-sample/meshub/managment/ingress-vs-istio.yaml