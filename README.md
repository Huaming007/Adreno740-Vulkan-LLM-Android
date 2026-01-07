# Adreno 740 Vulkan LLM Acceleration on Android 15

本项目记录了在 **Android 15 (Root)** 环境下，利用 **Adreno 740 GPU** (Snapdragon 8 Gen 2) 和 **Turnip (Mesa) 驱动** 实现本地大语言模型 (Qwen2.5) 硬件加速的全过程。

## 🚀 核心特性
- **GPU 加速**：基于 Vulkan 后端的 `llama.cpp`，实现 100% GPU 负载卸载。
- **高性能**：Qwen2.5-1.5B 模型生成速度达到 ~13 Token/s，Prompt 处理速度突破 1500 Token/s。
- **完美中文**：通过强制 UTF-8 编码锁定和 ChatML 模板，彻底解决移动端中文乱码及死循环换行问题。

## 🛠️ 环境要求
- **设备**：骁龙 8 Gen 2 (Adreno 740) 或更高。
- **系统**：Android 15 (已 Root)。
- **环境**：NetHunter / Kali / Termux (chroot)。
- **驱动**：Mesa Turnip 驱动 (本仓库提供编译路径参考)。

## 📁 目录说明
- `/bin`: 预编译的 `llama-cli` (支持 Vulkan)。
- `/scripts`: 经过调优的启动脚本 `chat_gpu.sh`。
- `/docs`: 详细的踩坑记录。

## 📝 关键技术点记录

### 1. 驱动与后端
使用 `llama.cpp` 的 Vulkan 后端。在 Android 上必须正确指定 `LD_LIBRARY_PATH` 指向 Mesa 驱动位置（通常在 `/usr/lib/aarch64-linux-gnu`）。

### 2. 乱码修复方案
移动端终端经常出现中文输出乱码。本项目通过以下手段解决：
1. **环境锁定**：在脚本内强制 `export LANG=zh_CN.utf8`。
2. **模板校准**：使用 `ChatML` 模板格式，规避模型对中文字符的计算漂移。
3. **模型选择**：直接使用标准 GGUF 文件，弃用解析不完全的 Ollama Blob 原始文件。

## 🚀 快速开始
1. 下载本仓库到本地。
2. 将你喜欢的 GGUF 模型（推荐 Qwen2.5-1.5B）放入目录。
3. 修改 `scripts/chat_gpu.sh` 中的模型路径。
4. 运行 `bash scripts/chat_gpu.sh`。

---
*本项目由 花名 与 AI 协作完成，旨在推动端侧 AI 在移动端的普及。*

## ⚖️ License
本项目采用 MIT 协议开源。内置的  遵循其原作者的 MIT 许可。
