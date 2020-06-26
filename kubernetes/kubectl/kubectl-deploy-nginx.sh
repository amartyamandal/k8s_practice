helm install nginx-ingress stable/nginx-ingress --set controller.publishService.enabled=true 
helm upgrade nginx-ingress stable/nginx-ingress --set rbac.create=true

kubectl  get service nginx-ingress-controller -o jsonpath='{.status.loadBalancer.ingress[0].ip}'


helm del --purge my-nginx
helm delete my-nginx