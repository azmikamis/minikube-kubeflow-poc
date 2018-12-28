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
curl https://raw.githubusercontent.com/azmikamis/minikube-kubeflow-poc/master/setup_tools.sh | bash
```
Log out and log back in for group membership to be re-evaluated
```
export PATH=${PATH}:${HOME}/src/kubeflow/scripts/
```
```
minikube config set WantReportErrorPrompt false
minikube config set vm-driver kvm2
minikube start --cpus 4 --memory 8096 --disk-size=40g
minikube addons enable ingress
```
```
KFAPP=kubeflow-lab
kfctl init ${KFAPP} --platform minikube
cd ${KFAPP}
kfctl generate all
kfctl apply all
```
