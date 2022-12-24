#!/bin/bash
set -eo pipefail

arch=`uname -m`
echo "DOCKERIZE Running on $arch"
if [[ arch -eq 'aarch64' ]] || [[ arch -eq 'arm64' ]]; then
  echo "DOCKERIZE Running on arm64"
  arch="arm64"
  hash="541ee4713933e087d766e2954b37cc652dff73b569d26b0c589277dcf8b16a9a"
  curl -o dockerize-linux-${arch} https://github.com/powerman/dockerize/releases/download/v0.16.0/dockerize-linux-${arch} -SL
  echo "${hash}  dockerize-linux-${arch}" | sha256sum -c -
  install dockerize-linux-${arch} /usr/local/bin/dockerize && rm dockerize-linux-${arch}
else
  curl -o dockerize-linux-amd64-v0.6.0.tar.gz https://github.com/jwilder/dockerize/releases/download/v0.6.0/dockerize-linux-amd64-v0.6.0.tar.gz -SL
  echo 'a13ff2aa6937f45ccde1f29b1574744930f5c9a5 dockerize-linux-amd64-v0.6.0.tar.gz' | sha1sum -c -
  tar xvfz dockerize-linux-amd64-v0.6.0.tar.gz -C /usr/local/bin && rm dockerize-linux-amd64-v0.6.0.tar.gz
fi

# TODO update version and repo