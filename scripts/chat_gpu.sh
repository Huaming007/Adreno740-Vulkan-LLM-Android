#!/bin/bash
export LANG=zh_CN.utf8
# 自动加载自带驱动库
export LD_LIBRARY_PATH=$(pwd)/../lib:$LD_LIBRARY_PATH
export LC_ALL=zh_CN.utf8

MODEL_PATH="/home/Hm/qwen2.5-1.5b-instruct-q8_0.gguf"
BIN_PATH="/home/Hm/llama.cpp/build/bin/llama-cli"

$BIN_PATH -m $MODEL_PATH \
    -ngl 99 \
    -cnv \
    --chat-template chatml \
    --color auto \
    -p "你是一个高效的AI助手。请用中文回答。"
