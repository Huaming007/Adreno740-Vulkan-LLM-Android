#!/bin/bash
# Adreno 740 GPU LLM 启动脚本 (自适应路径版)

# 强制指定中文 UTF-8 环境
export LANG=zh_CN.utf8
export LC_ALL=zh_CN.utf8

# 获取脚本所在的绝对路径
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
REPO_DIR="$( dirname "$SCRIPT_DIR" )"

# 自动加载仓库自带的驱动库 (位于 lib 目录)
export LD_LIBRARY_PATH="$REPO_DIR/lib:$LD_LIBRARY_PATH"

MODEL_PATH="/home/Hm/deepseek-r1-1.5b-q8_0.gguf"
# 如果仓库内没有模型，也可以在 scripts 目录下放一个软连接
[ ! -f "$MODEL_PATH" ] && MODEL_PATH="/home/Hm/deepseek-r1-1.5b-q8_0.gguf"

BIN_PATH="$REPO_DIR/bin/llama-cli"

echo "--- 硬件加速信息 ---"
echo "GPU: Adreno 740"
echo "Driver Path: $REPO_DIR/lib"
echo "-------------------"

$BIN_PATH -m $MODEL_PATH \
    -ngl 99 \
    -cnv \
    --chat-template chatml \
    --color auto \
    -p "你是一个高效的AI助手。请用中文回答。"