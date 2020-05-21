#!/bin/bash
#
# Upload binary artifacts when a new release is made.
#
reponame=$(basename $GITHUB_REPOSITORY)
status_code=$(curl --write-out %{http_code} --silent --output /dev/null https://github.com/$GITHUB_REPOSITORY/releases/latest)

# echo "STATUS: ${status_code}"

if [[ "$status_code" -ne 200 ]] ; then
  VERSION=v$(date '+%y.%m')
else
  VERSION=$(curl --silent "https://github.com/$GITHUB_REPOSITORY/releases/latest" | sed 's#.*tag/\(.*\)\".*#\1#')
fi

ghr -t ${GITHUB_TOKEN} -r ${reponame} -c ${GITHUB_SHA} -delete ${VERSION} build/ || exit 1
