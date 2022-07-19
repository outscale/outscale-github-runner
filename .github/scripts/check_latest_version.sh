#!/bin/bash

set -e

root=$(cd "$(dirname $0)/../.." && pwd)

current_version=$(grep "myoung34/github-runner" terraform/env_file/etc/systemd/system/github-runners.service | head -1 | sed -r "s|.*myoung34/github-runner:(.*)-ubuntu-bionic$|\1|")
latest_version=$(git ls-remote --refs --sort="version:refname" --tags https://github.com/myoung34/docker-github-actions-runner| cut -d/ -f3- | tail -n1;)

if [ ! -z ${latest_version} ] && [ ${current_version} != ${latest_version} ]; then
    echo "Upgrading from ${current_version} to ${latest_version}"
    "${root}/.github/scripts/upgrade_image_version.sh" "${current_version}" "${latest_version}"
else
    echo "Got already the latest version"
fi

exit 0
