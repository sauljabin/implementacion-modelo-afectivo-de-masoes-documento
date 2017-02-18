FROM ubuntu:16.04
RUN apt-get update && \
    apt-get install -y --no-install-recommends --no-install-suggests texlive-full && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
ENTRYPOINT ["/bin/bash", "-c"]
