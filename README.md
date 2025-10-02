teleport:
  data_dir: /var/lib/teleport
  log:
    output: stderr
    severity: INFO

auth_service:
  enabled: yes
  cluster_name: "test-cluster"
  listen_addr: 0.0.0.0:3025
  tokens:
    - "node:mytesttoken"

proxy_service:
  enabled: yes
  listen_addr: 0.0.0.0:3023
  web_listen_addr: 0.0.0.0:3080
  tunnel_listen_addr: 0.0.0.0:3024

ssh_service:
  enabled: yes
