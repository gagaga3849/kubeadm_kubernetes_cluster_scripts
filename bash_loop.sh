#!/bin/bash

# Define the hosts
hosts=("controlplane02" "node01" "loadbalancer")

# Path to the scripts
script1="/root/kubeadm_kubernetes_cluster_scripts/kube_install_manual.sh"
script2="/root/kubeadm_kubernetes_cluster_scripts/kube_install_manual_part_2.sh"

# Execute scripts on each host
for host in "${hosts[@]}"; do
  echo "Executing scripts on $host..."
  
  # Copy the scripts to the remote host
  scp "$script1" "$script2" "$host:/tmp/" || { echo "Failed to copy scripts to $host"; continue; }

  # Execute the scripts on the remote host
  ssh "$host" "bash /tmp/script1.sh && bash /tmp/script2.sh" || { echo "Failed to execute scripts on $host"; continue; }

  echo "Scripts executed successfully on $host."
done

