#!/bin/bash


set -e

for ns in sales housing finance data; do
  kubectl create namespace "$ns" --dry-run=client -o yaml | kubectl apply -f -
done

kubectl apply -f - <<EOF
# Только просмотр ресурсов кластера
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: role-viewer
rules:
- apiGroups: [""]
    resources: ["pods", "services", "deployments", "replicasets", "configmaps"]
    verbs: ["get", "list", "watch"]
---
# Просмотр секретов
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: role-secret
rules:
- apiGroups: [""]
  resources: ["secrets"]
  verbs: ["get", "list"] 

---
# роль ИБ: просмотр и настройка всего
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: cluster-role-ops
rules:
- apiGroups: ["*"]
  resources: ["*"]
  verbs: ["get", "list", "watch", "create", "update", "patch", "delete"]
EOF