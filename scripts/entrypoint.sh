#!/bin/bash

# Ensure that the GITHUB_TOKEN secret is included
if [[ -z "$GITHUB_TOKEN" ]]; then
  echo "Set the GITHUB_TOKEN env variable."
  exit 1
fi

reponame=$(basename $GITHUB_REPOSITORY)

pandoc-book.rb ${reponame}
# upload-build.sh

# status_code=$(curl --write-out %{http_code} --silent --output /dev/null https://github.com/$GITHUB_REPOSITORY/releases/latest)
#
# # echo "STATUS: ${status_code}"
#
# if [[ "$status_code" -ne 200 ]] ; then
#   VERSION=v$(date '+%y.%m')
# else
#   VERSION=$(curl --silent "https://github.com/$GITHUB_REPOSITORY/releases/latest" | sed 's#.*tag/\(.*\)\".*#\1#')
# fi
#
# ghr -t ${GITHUB_TOKEN} -r ${reponame} -c ${GITHUB_SHA} -delete ${VERSION} build/ || exit 1
exit 0
