#!/bin/bash

# Install MicroK8s
sudo snap install microk8s --classic

# Add the current user to the MicroK8s group
sudo usermod -a -G microk8s $USER

# Refresh the group membership
newgrp microk8s <<EONG
# Enable MicroK8s services
microk8s enable dns storage
EONG
