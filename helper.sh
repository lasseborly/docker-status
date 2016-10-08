#! /bin/bash

export PATH=$PATH:/usr/local/bin

getContainers() {
  docker ps --format '{"name": "{{.Names}}", "port": "{{.Ports}}"},'
}

"$@"
