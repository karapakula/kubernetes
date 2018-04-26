swapoff -a
sudo sed -i 's/.*swap/#&/' /etc/fstab
sudo yum update -y

sudo yum install -y docker
sudo systemctl enable docker && sudo systemctl start docker

sudo sh -c "cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF
"

sudo setenforce 0
sudo yum install -y kubelet kubeadm kubectl
sudo systemctl enable kubelet && sudo systemctl start kubelet

sudo sh -c "cat <<EOF >  /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
"
sudo sysctl --system

#To check Cgroup 
sudo docker info | grep -i cgroup
sudo cat /etc/systemd/system/kubelet.service.d/10-kubeadm.conf



