#!/bin/sh

if [ -d "scripts/ci-deployment" ]; then
  rm -rf "scripts/ci-deployment"
fi

git clone https://github.com/nhsuk/ci-deployment.git scripts/ci-deployment

# CHECKOUT SPECIFIC COMMIT OR BRANCH IF SET
if [ -n "CI_SCRIPT_BRANCH" ]; then
  (cd scripts/ci-deployment && git checkout "${CI_SCRIPT_BRANCH}")
fi

bash scripts/ci-deployment/deploy.sh
