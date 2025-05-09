# 🧠 TensorFlow GPU Docker Setup

A ready-to-use environment for training deep learning models with TensorFlow 2.15.0 GPU in Docker. Includes Jupyter Notebook support and essential Python libraries preinstalled.

---

## ✅ System Requirements (Windows)

> Before using this setup, make sure the following are properly configured:

- 🐳 **Docker Desktop** must be installed  
  👉 https://www.docker.com/products/docker-desktop

- ⚙️ **BIOS** must have Virtualization Technology **enabled**

- 🔧 Enable these **Windows Features**:
  - [x] Hyper-V
  - [x] Windows Subsystem for Linux (WSL2)
  - [x] Virtual Machine Platform

- 🐧 Set WSL2 as default version:
  ```bash
  wsl --set-default-version 2
  ```

- 🚀 **NVIDIA Container Toolkit** must be installed for GPU support  
  👉 https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html

---

## 🚀 Features

- ✅ TensorFlow 2.15.0 with GPU (Compute Capability 12.0 supported)
- 🐳 Docker-based container (`tf-gpu-container`)
- 📊 Preinstalled packages:
  - pandas
  - gensim
  - wordcloud
  - scikit-learn
  - seaborn
- 🧪 Python runtime access inside container
- 📓 Jupyter Notebook support via `localhost:8888`

---

## 📂 File Structure

| File Name                | Description                                              |
|-------------------------|----------------------------------------------------------|
| `run_tf_gpu.bat`        | Launches TensorFlow GPU container with Jupyter enabled. |
| `install-requirements.bat` | Installs Python packages inside the container.        |
| `run-tf-python.bat`     | Opens terminal into the container and runs Python shell.|

---

## 📌 Usage

1. **Run the container**  
   ```bash
   run_tf_gpu.bat
   ```

2. **Install required packages**  
   ```bash
   install-requirements.bat
   ```

3. **Access container terminal (optional)**  
   ```bash
   run-tf-python.bat
   ```

4. **Use Jupyter Notebook**  
   Open browser at: [http://localhost:8888](http://localhost:8888)

---

## 🇹🇷 Türkçe Açıklama

Bu repo, TensorFlow 2.15.0 GPU destekli bir Docker ortamı sunar. Gerekli kütüphaneler yüklüdür ve Jupyter desteğiyle model geliştirme sürecini hızlandırır.

---

## 🛠️ Hazırlayan

📎 Mücahit Söylemez tarafından oluşturulmuştur.
