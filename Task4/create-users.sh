#!/bin/bash

kubectl create namespace prop-dev
kubectl create namespace secure-space

kubectl create serviceaccount devops -n prop-dev
kubectl create serviceaccount viewer -n prop-dev
kubectl create serviceaccount security-officer -n secure-space