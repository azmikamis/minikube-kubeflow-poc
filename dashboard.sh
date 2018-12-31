kubectl proxy --address='0.0.0.0' --accept-hosts='.*' > /dev/null &
KC_PROXY_PID=$!
SERVICE_PREFIX=http://$(curl -sH "Metadata-Flavor: Google" http://169.254.169.254/computeMetadata/v1/instance/network-interfaces/0/access-configs/0/external-ip):8001/api/v1
DASHBOARD_URL=$SERVICE_PREFIX/namespaces/kube-system/services/http:kubernetes-dashboard:/proxy/
echo Dashboard up!
echo PID: $KC_PROXY_PID
echo URL: $DASHBOARD_URL
