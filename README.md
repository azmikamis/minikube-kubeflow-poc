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
Effect of enabling ingress (takes about 5 mins)
```
$ curl $(minikube ip)
curl: (7) Failed to connect to 192.168.39.188 port 80: Connection refused
$ minikube addons enable ingress
ingress was successfully enabled
$ curl $(minikube ip)
default backend - 404
```
```
KFAPP=kubeflow-lab
kfctl init ${KFAPP} --platform minikube
cd ${KFAPP}
kfctl generate all
kfctl apply all
```
