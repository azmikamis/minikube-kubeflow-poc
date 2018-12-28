# minikube-kubeflow-poc
```
gcloud compute instances create minikube \
  --zone us-central1-b \
  --image ubuntu-vmx \
  --machine-type=n1-standard-4 \
  --boot-disk-size=60GB \
  --tags=http-server,https-server
```
```
curl https://raw.githubusercontent.com/azmikamis/minikube-kubeflow-poc/master/deploy_minikube_kubeflow.sh | bash
```
