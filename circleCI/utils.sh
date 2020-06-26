#!/bin/bash

org=$(basename $(dirname $(pwd)))
repo=$(basename $(pwd))

#.Set up all the right environment variables
enable-env() {
  echo Set up all the environment variables
  curl "https://circleci.com/api/v2/project/${org}/${repo}/follow?circle-token=${circletoken}" \
    -X POST \
    -H "Accept: application/json" \
    --silent >/dev/null
}

#.Set up automatic slack notifications
slack-notification() {
  curl "https://circleci.com/api/v2/project/${org}/${repo}/settings?circle-token=${circletoken}" \
    -X PUT \
    -H "Content-Type: application/json" \
    -H "Accept: application/json" \
    -d '{"slack_webhook_url": "xxxxxxxxx"}' \
    --silent >/dev/null
}

#:Open the test results right from CLI in browser
open-test-results() {
  repo=$(git remote -v)
  re="github.com/([^/]+/[^[:space:]]+)(.git)"
  if [[ $repo =~ $re ]]; then open "https://circleci.com/gh/${BASH_REMATCH[1]}"; fi
}

create-circleCI-badge() {
  echo creating status token
  response=$(curl "https://circleci.com/api/v2/project/$org/$repo/token?circle-token=$circletoken" \
    -X POST \
    -H "Content-Type: application/json" \
    -H "Accept: application/json" \
    -d '{"label":"badge","scope":"status"}' \
    --silent)
  statustoken=$(node -pe 'JSON.parse(process.argv[1]).token' "$response")
  badge="[![Circle CI](https://circleci.com/gh/$repo/$repo.svg?style=svg&circle-token=$statustoken)](https://circleci.com/gh/segmentio/$repo)"
  echo adding badge to Readme.md
  echo $badge >temp-readme.md
  cat Readme.md >>temp-readme.md
  cp temp-readme.md Readme.md
  rm temp-readme.md
}
