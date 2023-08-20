#!/bin/bash

docker build -t github_runner .

docker run -it --rm github_runner