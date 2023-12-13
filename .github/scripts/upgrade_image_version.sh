#!/bin/bash

set -e 

CURRENT_VERSION="$1"
UPGRADE_VERSION="$2"

root=$(cd "$(dirname $0)/../.." && pwd)

sed -ri "s|myoung34/github-runner:${CURRENT_VERSION}-ubuntu-jammy|myoung34/github-runner:${UPGRADE_VERSION}-ubuntu-jammy|g" "${root}/terraform/env_file/etc/systemd/system/github-runners.service"

branch_name="autoupgrade-${UPGRADE_VERSION}"
git branch -m $branch_name


# setup git && commit
git config user.name "Outscale Bot"
git config user.email "opensource+bot@outscale.com"
cd "$root"
git add "terraform/env_file/etc/systemd/system/github-runners.service"
git commit -m "Upgrade github-runner to ${UPGRADE_VERSION}"


# Push the commit
git push -f origin $branch_name


if [ -z "$GH_TOKEN" ]; then
    echo "GH_TOKEN is missing, abort."
    exit 1
fi

# https://docs.github.com/en/free-pro-team@latest/rest/reference/pulls#create-a-pull-request
result=$(curl -s -X POST -H "Authorization: token $GH_TOKEN" -d "{\"head\":\"$branch_name\",\"base\":\"main\",\"title\":\"Upgrade Github Runner ($UPGRADE_VERSION)\",\"body\":\"Automatic upgrade of Github Runner to $UPGRADE_VERSION.\n\n **Changelog**: https://github.com/myoung34/docker-github-actions-runner/compare/$CURRENT_VERSION...$UPGRADE_VERSION\"}" "https://api.github.com/repos/outscale/outscale-github-runner/pulls")

errors=$(echo $result | jq .errors)

if [ "$errors" != "null" ]; then
    echo "errors while creating pull request, abort."
    exit 1
fi
