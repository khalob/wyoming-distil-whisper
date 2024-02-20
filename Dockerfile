FROM debian:bullseye-slim
# FROM ghcr.io/home-assistant/amd64-base-debian:bookworm

# Install Whisper
WORKDIR /usr/src
ARG WHISPER_VERSION='1.0.1'

COPY ./requirements.txt ./requirements.txt
RUN \
    apt-get update \
    && apt-get install -y --no-install-recommends \
    build-essential \
    python3 \
    python3-dev \
    python3-pip \
    \
    && pip3 install --no-cache-dir -U \
    setuptools \
    wheel \
    && pip3 install -r requirements.txt \
    && apt-get purge -y --auto-remove \
    build-essential \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*


COPY wyoming_faster_whisper /wyoming_faster_whisper

WORKDIR /


COPY script/run.sh /run.sh
# COPY ./models/faster-distil-whisper-small.en ./models/faster-distil-whisper-small.en

EXPOSE 10300

ENTRYPOINT ["/run.sh"]
