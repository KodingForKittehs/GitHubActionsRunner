FROM ubuntu:22.04

RUN apt update && apt upgrade -y
RUN apt install -y curl
RUN mkdir actions-runner
WORKDIR /actions-runner
RUN curl -o actions-runner-linux-x64-2.308.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.308.0/actions-runner-linux-x64-2.308.0.tar.gz
RUN tar xzf ./actions-runner-linux-x64-2.308.0.tar.gz
RUN ./bin/installdependencies.sh
RUN groupadd --gid 1001 user && useradd --uid 1001 --gid user -m user
RUN chown user /actions-runner 
USER user
#RUN ./config.sh --url https://github.com/KodingForKittehs/GitHubActionsRunner --token $TOKEN

#ENTRYPOINT ./run.sh