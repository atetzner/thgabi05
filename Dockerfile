FROM ubuntu:latest

COPY mkdocs-install.sh /tmp
RUN chmod +x /tmp/mkdocs-install.sh && /tmp/mkdocs-install.sh
