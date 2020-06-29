curl -L https://istio.io/downloadIstio | sh -
cd istio-1.6.3
export PATH=$PWD/bin:$PATH
kubectl create namespace istio-system
istioctl install --set profile=demo