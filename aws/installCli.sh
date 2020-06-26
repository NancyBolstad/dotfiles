#!/bin/bash

set -e

  if type aws > /dev/null; then
    echo "AWS cli already installed"
    return
  fi

  echo "Installing AWS cli..."
  curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
  sudo installer -pkg AWSCLIV2.pkg -target /
  echo "Completed AWS cli install"