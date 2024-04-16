#!/bin/bash

MKDOCS_TECHDOCS_CORE_VERSION="1.3.5"
MKDOCS_MATERIAL_VERSION="9.5.13"
MKDOCS_PYMDOWN_VERSION="10.3.1"
MKDOCS_VERSION="1.5.3"
MKDOCS_AWESOME_PAGES_VERSION="2.9.2"
MKDOCS_AUTOLINK_REFRENCES_VERSION="0.2.1"
MKDOCS_DRAWIO_EXPORTER_VERSION="0.8.0"
MKDOCS_GIT_REVISION_DATE_VERSION="0.3.2"
MKDOCS_EXCLUDE_VERSION="1.0.2"

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