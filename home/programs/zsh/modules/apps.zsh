# mitmproxy
if command -v mitmproxy &> /dev/null; then
  export GLOBAL_AGENT_HTTP_PROXY=http://127.0.0.1:8080

  # Only set CA cert if the file exists
  if [[ -f ~/.mitmproxy/mitmproxy-ca-cert.pem ]]; then
    export NODE_EXTRA_CA_CERTS=~/.mitmproxy/mitmproxy-ca-cert.pem
  fi
fi
