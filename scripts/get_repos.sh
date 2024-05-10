#!/bin/bash

rm -rf repos
mkdir repos
cd repos
git clone --recurse-submodules https://github.com/AmpereComputingAI/llama-cpp-python
cd llama-cpp-python
git checkout ampere-build
cd ..


git clone git@github.com:AmpereComputingAI/llm_app_frameworks.git
cd llm_app_frameworks
cd ..

cd ..
