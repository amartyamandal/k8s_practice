doctl kubernetes cluster kubeconfig save dgo-cluster-11

kubectl config use-context do-tor1-dgo-cluster-11

CONTEXT=$(kubectl config current-context)

kubectl apply --context $CONTEXT \
    -f service-account.yml

TOKEN=$(kubectl get secret --context $CONTEXT \
   $(kubectl get serviceaccount spinnaker-service-account \
       --context $CONTEXT \
       -n spinnaker \
       -o jsonpath='{.secrets[0].name}') \
   -n spinnaker \
   -o jsonpath='{.data.token}' | base64 --decode)

kubectl config set-credentials ${CONTEXT}-token-user --token $TOKEN

kubectl config set-context $CONTEXT --user ${CONTEXT}-token-user

hal config provider kubernetes enable

CONTEXT=$(kubectl config current-context)

hal config provider kubernetes account add my-k8s-v2-account-11 \
    --provider-version v2 \
    --context $CONTEXT
