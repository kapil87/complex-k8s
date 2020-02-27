# complex-k8s
Kubernetes project integrated with google cloud using Travis CI.

When you deploy this on New Cluster Please do following steps:

 curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
 chmod 700 get_helm.sh
 ./get_helm.sh

#Add service account

kubectl create serviceaccount --namespace kube-system tiller

#Add cluster role to the service account

kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
