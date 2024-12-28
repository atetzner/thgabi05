#!/bin/bash

docker build --tag thgabi05-mkdocs:latest .

docker run \
  --rm -ti \
  --volume "$PWD:/docs/:rw" \
  --workdir /docs \
  --publish 8000:8000 \
  --label mkdocs-serve \
  --user $(id -u) \
  thgabi05-mkdocs:latest \
  mkdocs serve --dev-addr 0.0.0.0:8000 --livereload