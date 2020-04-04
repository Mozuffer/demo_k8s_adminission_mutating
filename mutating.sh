kubectl apply -f - <<EOF
apiVersion: admissionregistration.k8s.io/v1beta1
kind: MutatingWebhookConfiguration
metadata:
  name: mutate
  labels:
    app: mutate
webhooks:
  - name: mutate.default.svc.cluster.local
    clientConfig:
      caBundle: ${CA_BUNDLE}
      service:
        name: mutate
        namespace: default
        path: "/mutate"
    rules:
      - operations: ["CREATE"]
        apiGroups: [""]
        apiVersions: ["v1"]
        resources: ["pods"]
EOF
