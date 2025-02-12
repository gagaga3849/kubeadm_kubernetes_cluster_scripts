#!/bin/bash

sudo kubeadm reset -f

sudo rm -rf /etc/kubernetes
sudo rm -rf ~/.kube
sudo rm -rf /var/lib/etcd
sudo rm -rf /var/lib/kubelet/*

sudo rm -rf /etc/cni/net.d/
sudo docker system prune -a
