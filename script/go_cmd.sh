#!/bin/bash

set -e
set -x

go install golang.org/x/tools/gopls@latest
go install github.com/cosmtrek/air@latest
go install github.com/ss49919201/idgen@latest
go install github.com/globusdigital/deep-copy@latest
go install golang.org/x/tools/cmd/goimports@latest
go install golang.org/dl/gotip@latest
