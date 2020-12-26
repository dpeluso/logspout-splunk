#!/bin/sh
set -e

cat > ./Dockerfile <<DOCKERFILE
FROM gliderlabs/logspout:master
DOCKERFILE

cat > ./modules.go <<MODULES
package main
import (
	_ "github.com/gliderlabs/logspout/httpstream"
	_ "github.com/gliderlabs/logspout/routesapi"
	_ "github.com/chakrabortymrinal/logspout-splunk"
)
MODULES

sudo docker build .
rm -f Dockerfile modules.go
