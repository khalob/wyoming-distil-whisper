#!/usr/bin/env bash
python3 -m wyoming_faster_whisper \
    --model 'distil-small.en' \
    --uri 'tcp://0.0.0.0:10300' \
    --data-dir /data \
    --download-dir /data "$@"
