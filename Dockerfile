FROM ubuntu:latest

ENV PIP_ROOT_USER_ACTION=ignore

COPY mkdocs-install.sh /tmp
RUN chmod +x /tmp/mkdocs-install.sh && /tmp/mkdocs-install.sh
