#!/bin/bash

./get_repos.sh

docker build --squash -t local-rag:v0.0.1 --no-cache .
