#!/bin/bash

set -e

readonly api_endpoint=https://circleci.com/api/v1.1/project/github
readonly api_url="$api_endpoint/$(echo $CIRCLE_REPOSITORY_URL | rev | cut -d'/' -f 1,2 | rev)"
readonly ci_stime=$(curl -Ls "$api_url?limit=1&circle-token=$CIRCLE_API_TOKEN" | jq -r '.[0].start_time')
readonly ci_stime_sec=$(date --date="$ci_stime" "+%s")
readonly now_sec=$(date "+%s")
readonly ci_build_time=$(echo $(($now_sec - $ci_stime_sec)))

echo $ci_build_time

dog timeboard show_all