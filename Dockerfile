FROM debian:bookworm
RUN apt-get update && \
    apt-get install -y stress-ng && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
COPY run.sh /run.sh
RUN chmod +x /run.sh
CMD ["/bin/bash", "/run.sh"]