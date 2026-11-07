#!/bin/bash
set -e

kubectl apply -f - <<EOF
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: bind-viewer
subjects:
- kind: ServiceAccount
  name: viewer
  namespace: prop-dev
roleRef:
  kind: ClusterRole
  name: role-viewer
  apiGroup: rbac.authorization.k8s.io

---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: bind-security
subjects:
- kind: ServiceAccount
  name: security-officer
  namespace: secure-space
roleRef:
  kind: ClusterRole
  name: role-secret
  apiGroup: rbac.authorization.k8s.io

---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: bind-devops
subjects:
- kind: ServiceAccount
  name: devops
  namespace: prop-dev
roleRef:
  kind: ClusterRole
  name: cluster-role-ops
  apiGroup: rbac.authorization.k8s.io
EOF 