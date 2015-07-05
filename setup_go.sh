#!/bin/bash

sudo_prefix=""

if [[ $USER != "" && $USER != "root" ]]; then
	sudo_prefix="sudo"
fi

updated=false
for p in mercurial git curl; do
  if ! dpkg -s $p >/dev/null 2>&1; then
    if [[ $updated == false ]]; then
      updated=true
      $sudo_prefix apt-get update
    fi
    $sudo_prefix apt-get install -y $p
  else
    echo "pkg $p already installed"
  fi
done


if [[ ! -e ~/go/bin/go ]]; then
  echo "downloading and extracting go"
  tmp=$(mktemp -d /tmp/goXXXXXX)
  cd $tmp && curl -SsfL https://storage.googleapis.com/golang/go1.4.2.linux-amd64.tar.gz | tar xfz - --strip=1
  mv $tmp ~/go
else
  echo "go already installed"
fi
