#!/bin/bash

# Ensure that the GITHUB_TOKEN secret is included
if [[ -z "$GITHUB_TOKEN" ]]; then
  echo "Set the GITHUB_TOKEN env variable."
  exit 1
fi

# Ensure that the ACTION flag is set
if [[ -z "$ACTION" ]]; then
  echo "Set the ACTION env variable. (See http://verkilo.com for details)"
  verkilo version
  exit 1
fi

verkilo ${ACTION} ${FLAGS}

exit 0
