#!/bin/sh -l
# /readme.rb
remote=$(git config --get remote.origin.url)
echo $remote
git commit --allow-empty -m "[skip ci] compiling README"
git push -q $remote master
# VERSION=v$(date '+%y.%m')
# remote=$(git config --get remote.origin.url)
# repo=$(basename $remote .git)
# commit=$(git rev-parse HEAD)
#
# curl -s -X POST https://api.github.com/repos/$REPO_OWNER/$repo/git/refs \
# -H "Authorization: token $GITHUB_TOKEN" \
# -d @- << EOF
# {
#   "ref": "refs/tags/$VERSION",
#   "sha": "$commit"
# }
# EOF