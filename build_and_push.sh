#!/usr/bin/env bash

set -eu # European Union mode

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

CLUSTER="${1:-staging}"

gcloud auth login
gcloud container clusters get-credentials "k8s-${CLUSTER}" --region europe-west4-a --project "dyme-${CLUSTER}"

docker build --network host -t "eu.gcr.io/dyme-${CLUSTER}/keycloak-operator:latest" "${DIR}"
docker push "eu.gcr.io/dyme-${CLUSTER}/keycloak-operator:latest"