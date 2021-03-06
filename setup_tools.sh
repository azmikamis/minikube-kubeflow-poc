sudo apt update && sudo apt upgrade -y

sudo apt install libvirt-bin qemu-kvm -y
sudo usermod -aG libvirtd $(whoami)

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt update && sudo apt install kubectl -y

curl -LO https://storage.googleapis.com/minikube/releases/v0.30.0/docker-machine-driver-kvm2
chmod +x docker-machine-driver-kvm2
sudo mv docker-machine-driver-kvm2 /usr/local/bin/

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube-linux-amd64
sudo mv minikube-linux-amd64 /usr/local/bin/minikube

KUBEFLOW_SRC=${HOME}/src/kubeflow
KUBEFLOW_TAG=v0.3.4
mkdir -p ${KUBEFLOW_SRC}
cd ${KUBEFLOW_SRC} && curl https://raw.githubusercontent.com/kubeflow/kubeflow/${KUBEFLOW_TAG}/scripts/download.sh | bash
cd ~
sudo ln -s ${KUBEFLOW_SRC}/scripts/kfctl.sh ${KUBEFLOW_SRC}/scripts/kfctl
sudo chown -h $(whoami):$(whoami) ${KUBEFLOW_SRC}/scripts/kfctl

KS_VER=0.13.1
KSFILE_VER=ks_${KS_VER}_linux_amd64
wget -O /tmp/${KSFILE_VER}.tar.gz https://github.com/ksonnet/ksonnet/releases/download/v${KS_VER}/${KSFILE_VER}.tar.gz
tar -xvf /tmp/${KSFILE_VER}.tar.gz -C /tmp
sudo mv /tmp/${KSFILE_VER}/ks /usr/local/bin/
rm -rf /tmp/${KSFILE_VER}
rm /tmp/${KSFILE_VER}.tar.gz

wget https://raw.githubusercontent.com/ahmetb/kubectx/master/kubectx
wget https://raw.githubusercontent.com/ahmetb/kubectx/master/kubens
chmod +x kubectx
chmod +x kubens
sudo mv kubectx /usr/local/bin/
sudo mv kubens /usr/local/bin/
