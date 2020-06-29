curl -L https://istio.io/downloadIstio | sh -
cd istio-1.6.3
export PATH=$PWD/bin:$PATH
kubectl create namespace istio-system
istioctl install --set profile=demo
kubectl label namespace default istio-injection=enabled
export INGRESS_HOST=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].port}')
export SECURE_INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="https")].port}')
export TCP_INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="tcp")].port}')

echo $INGRESS_HOST > ~/lb-ip.txt
