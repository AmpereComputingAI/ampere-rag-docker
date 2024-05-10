#!/bin/bash

./get_repos.sh

docker build --squash -t rag:v0.0.1 --no-cache .
