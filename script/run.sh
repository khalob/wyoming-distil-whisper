#!/usr/bin/env bash
python3 -m wyoming_faster_whisper \
    --model 'distil-medium.en' \
    --uri 'tcp://0.0.0.0:10300' \
    --data-dir './models/wis-distil-whisper-medium.en/' \
    "$@"
