#!/bin/bash

apt update && \
  DEBIAN_FRONTEND=noninteractive apt install -y \
    git \
    jq \
    wget \
    curl \
    python3-pip \
&& rm -rf /var/lib/apt/lists/* \
&& apt-get clean

MKDOCS_TECHDOCS_CORE_VERSION="1.3.5"
MKDOCS_MATERIAL_VERSION="9.5.13"
MKDOCS_PYMDOWN_VERSION="10.3.1"
MKDOCS_VERSION="1.5.3"
MKDOCS_AWESOME_PAGES_VERSION="2.9.2"
MKDOCS_AUTOLINK_REFRENCES_VERSION="0.2.1"
MKDOCS_GIT_REVISION_DATE_VERSION="0.3.2"
MKDOCS_EXCLUDE_VERSION="1.0.2"

pip install \
    mkdocs-techdocs-core==$MKDOCS_TECHDOCS_CORE_VERSION \
    mkdocs-material==$MKDOCS_MATERIAL_VERSION \
    pymdown-extensions==$MKDOCS_PYMDOWN_VERSION \
    mkdocs==$MKDOCS_VERSION \
    mkdocs-awesome-pages-plugin==$MKDOCS_AWESOME_PAGES_VERSION \
    autolink-references-mkdocs-plugin==$MKDOCS_AUTOLINK_REFRENCES_VERSION \
    mkdocs-git-revision-date-plugin==$MKDOCS_GIT_REVISION_DATE_VERSION \
    mkdocs-exclude==$MKDOCS_EXCLUDE_VERSION \
    tzdata \
&& \
# Remove MkDocs hard-coded notice in footer
grep -v '{% trans mkdocs_link' /usr/local/lib/python3.10/dist-packages/mkdocs/themes/readthedocs/footer.html > /tmp/footer.html && \
mv /tmp/footer.html /usr/local/lib/python3.10/dist-packages/mkdocs/themes/readthedocs/footer.html