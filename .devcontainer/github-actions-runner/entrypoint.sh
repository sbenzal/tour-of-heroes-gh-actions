#!/usr/bin/env bash

REGISTRATION_TOKEN_API_URL=https://api.github.com/repos/$OWNER/$REPO/actions/runners/registration-token

echo -e "Registration token API URL: $REGISTRATION_TOKEN_API_URL\n"

PRIVATE_KEY_PATH=/run/secrets/github_app_private_key

source /home/runner/generate-jwt-for-gh-app.sh $APP_ID $PRIVATE_KEY_PATH

ACCESS_TOKEN=$(curl --request POST \
--url "https://api.github.com/app/installations/$INSTALLATION_ID/access_tokens" \
--header "Accept: application/vnd.github+json" \
--header "Authorization: Bearer $JWT" \
--header "X-GitHub-Api-Version: 2022-11-28" | jq -r '.token')

echo -e "Access token: $ACCESS_TOKEN\n"

# Retrieve a short lived runner registration token using the PAT
REGISTRATION_TOKEN="$(curl -X POST -fsSL \
  -H 'Accept: application/vnd.github.v3+json' \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  -H 'X-GitHub-Api-Version: 2022-11-28' \
  "$REGISTRATION_TOKEN_API_URL" \
  | jq -r '.token')"

echo -e "REGISTRATION_TOKEN=$REGISTRATION_TOKEN\n"

REPO_URL="https://github.com/$OWNER/$REPO"

# https://docs.github.com/en/actions/hosting-your-own-runners/managing-self-hosted-runners/about-self-hosted-runners
./config.sh --url $REPO_URL --token $REGISTRATION_TOKEN --unattended && ./run.sh
