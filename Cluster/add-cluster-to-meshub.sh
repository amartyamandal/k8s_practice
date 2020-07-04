curl -sL https://run.solo.io/meshctl/install | sh
export PATH=$HOME/.service-mesh-hub/bin:$PATH

meshctl cluster register \
  --remote-cluster-name dgo-cluster-11 \
  --remote-context do-tor1-dgo-cluster-11
