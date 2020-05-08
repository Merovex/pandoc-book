#!/bin/sh -l
VERSION=v$(date '+%y.%m')
# remote=$(git config --get remote.origin.url)
# repo=$(basename $remote .git)
commit=$(git rev-parse HEAD)

curl -s -X POST https://api.github.com/repos/$GITHUB_REPOSITORY/git/refs \
-H "Authorization: token $GITHUB_TOKEN" \
-d @- << EOF
{
  "ref": "refs/tags/$VERSION",
  "sha": "$commit"
}
EOF
