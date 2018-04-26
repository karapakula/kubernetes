swapoff -a
sudo sed -i 's/.*swap/#&/' /etc/fstab

kubeadm init --pod-network-cidr=10.244.0.0/16

sysctl net.bridge.bridge-nf-call-iptables=1


exit
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/v0.9.1/Documentation/kube-flannel.yml


#Comand to pint join command
sudo kubeadm token create --print-join-command