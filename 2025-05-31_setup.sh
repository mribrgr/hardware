#!/bin/bash

k3sup install \
--host v2202505270128345138.powersrv.de \
--user root \
--ssh-key ~/.ssh/id_netcup_max_1 \
--local-path kubeconfig \
--context default \
# --k3s-extra-args="--node-taint CriticalAddonsOnly=true:NoSchedule"
