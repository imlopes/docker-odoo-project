#!/bin/bash
set -eo pipefail

arch=`uname -m`

apt-get install -y build-essential gcc

echo "DOCKERIZE Running on $arch"
if [[ arch -eq 'aarch64' ]] || [[ arch -eq 'arm64' ]]; then
  echo "DOCKERIZE Running on arm64"
  arch="arm64"
  hash="41adf4cacf82e952a771201c185e3b83ef76f240ea891e4c4f7a4ef6d39553fa"
else
  echo "DOCKERIZE Running on x86_64"
  arch="x86_64"
  hash="9baf0af30e0ec0b47a0a34e0a2b2a0e5de1872d2f9e846829692b3457407cb29"
fi

echo "DOCKERIZE Running on x86_64"
arch="x86_64"
hash="9baf0af30e0ec0b47a0a34e0a2b2a0e5de1872d2f9e846829692b3457407cb29"

curl -o dockerize-linux-${arch} https://github.com/powerman/dockerize/releases/download/v0.17.0/dockerize-linux-${arch} -SL
echo "${hash}  dockerize-linux-${arch}" | sha256sum -c -
install dockerize-linux-${arch} /usr/local/bin/dockerize && rm dockerize-linux-${arch}
chmod +x /usr/local/bin/dockerize

# TODO update version and repo