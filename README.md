# Adreno 740 Vulkan LLM Acceleration Toolkit

```text
▄▄ ▄▄
██ ██
██ ██  ▀▀█▄ ███▄███▄  ▀▀█▄    ▄████ ████▄ ████▄
██ ██ ▄█▀██ ██ ██ ██ ▄█▀██    ██    ██ ██ ██ ██
██ ██ ▀█▄██ ██ ██ ██ ▀█▄██ ██ ▀████ ████▀ ████▀
                                    ██    ██
                                    ▀▀    ▀▀
```

本项目旨在释放 **骁龙 8 Gen 2 (Adreno 740)** 的极致潜能，在 Android 15 环境下通过 Vulkan 驱动实现大语言模型（LLM）的全硬件加速。

---

## ⚡ 硬件峰值性能 (GPU Peak Performance)

通过 `vkpeak` 实测，Adreno 740 在移动端展现了接近桌面级显卡的算力：

| 测试项目 (Vulkan) | 理论峰值 (GFLOPS/GIOPS) | 对标说明 |
| :--- | :--- | :--- |
| **FP16 (Half Precision)** | **4163.19 GFLOPS** | **~4.1 TFLOPS** (LLM 推理核心算力) |
| **FP32 (Single Precision)** | **2044.57 GFLOPS** | **~2.0 TFLOPS** (接近 GTX 1050) |
| **Int8 (Integer Dot)** | **5197.53 GIOPS** | **极速量化计算能力** |
| **Memory Bandwidth** | **17.73 GB/s** | **高速统一内存通道 (UMA)** |

---

## 📊 LLM 实测基准 (AI Benchmarks)

基于 **Qwen2.5-1.5B-Instruct-Q8_0** 模型实测：

| 关键指标 | 性能数据 | 体验评价 |
| :--- | :--- | :--- |
| **Prompt Processing** | **1542.0 t/s** | **降维打击**：长文档理解瞬间完成 |
| **Text Generation** | **6.7 t/s** | **流畅丝滑**：超越人类正常阅读速度 |

---

## 💻 显卡级别对标

**Adreno 740 (Mobile) ≈ NVIDIA GeForce GTX 1050 Ti / GTX 1650 (Mobile)**

### 🌟 物理内存 16GB 的优势
本设备拥有 **16GB 统一内存 (UMA)**，相比传统 PC 显卡：
1. **显存容量翻倍**：PC 独立显卡（如 1050 Ti）通常仅 4GB 显存，而本项目可直接调用 **16GB** 内存作为显存。
2. **支持更大模型**：可以从容运行 7B 甚至 14B 模型，不会因显存溢出而崩溃。

---

## 📖 真实对话演示 (Case Study)

> **User**: 你是谁？  
> **AI**: 我是来自阿里云的AI助手...  
> `[ Prompt: 606.5 t/s | Generation: 6.6 t/s ]`

> **User**: 16+8 貌似是一个减肥方式  
> **AI**: 我理解你可能在讨论...16+8指的是断食减肥法...  
> `[ Prompt: 1130.4 t/s | Generation: 6.7 t/s ]`

---

## ⚙️ 核心组件
- `/bin`: 适配 Android 15 的预编译 `llama-cli` (Vulkan)。
- `/lib`: 针对 Adreno 740 调优的 **Mesa Turnip** 驱动库。
- `/scripts`: 完美解决中文乱码、支持本地文件读取的启动脚本。

## 🛠️ 如何使用
1. 下载仓库并赋予执行权限。
2. 运行 `./scripts/chat_gpu.sh` 开启 GPU 加速对话。
3. 途中检索文件：在对话框输入 `/read /path/to/your/file.txt`。

---

## 🏁 实时更新记录
- **[2026-01-07]**: 成功引入 `vkpeak` 硬件压测数据，更新 FP16 峰值算力。

---

## ⚖️ License
本项目采用 MIT 协议开源。

**Author**: 花名 (Huaming007)  
**AI 协作**: Gemini CLI Agent