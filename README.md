# <p align="center">Kali Linux NetHunter for Termux</p>

<p align="center">
  <img src="https://img.shields.io/badge/Platform-Termux-a80505?style=flat-square">
  <img src="https://img.shields.io/badge/License-MIT-a80505?style=flat-square">
  <img src="https://img.shields.io/badge/Open%20Source-Yes-a80505?style=flat-square">
  <img src="https://img.shields.io/github/repo-size/Midohajhouj/Kali-Nethunter?label=Size&color=a80505">
  <img src="https://img.shields.io/github/stars/Midohajhouj/Kali-Nethunter?style=flat&label=Stars&color=a80505">
  <img src="https://img.shields.io/github/languages/top/Midohajhouj/Kali-Nethunter?color=a80505">
</p>

<p align="center">
Transform your Android device into a powerful penetration testing environment with Kali Linux NetHunter for Termux. This project offers both CLI and GUI setups, optimized for mobile devices with VNC support.
</p>

---

## 🌟 Features

- **Kali Linux NetHunter**: A robust Kali Linux environment designed for mobile devices.
- **Graphical Desktop**: Includes XFCE4 desktop environment with VNC access.
- **Flexible Installation Options**: Choose between Full (15 GB), Minimal (2 GB), or Nano (250 MB) versions.
- **Custom Scripts**: Automated scripts for installation, configuration, and usage.
- **VNC Support**: Seamlessly start and stop VNC servers for GUI access.

---

## 🛠 Prerequisites

1. **Termux**: Install Termux from [F-Droid](https://f-droid.org) or a trusted source.
2. **Storage Permissions**: Grant Termux storage access:
   ```bash
   termux-setup-storage
   ```

---

## 🚀 Installation

### 1️⃣ Clone the Repository
```bash
git clone https://github.com/your-repo/kali-nethunter-termux.git
cd kali-nethunter-termux
```

### 2️⃣ Run the Setup Script
```bash
bash setup.sh
```
During installation, select one of the following options:
- **Full (15 GB)**: Complete version with all tools and features.
- **Minimal (2 GB)**: Lightweight version and we will customize it (Best option).  
- **Nano (250 MB)**: Bare minimum for low-storage devices.

**My Option**: Minimal (2 GB). We will expand this later during installation to ~6 GB by adding only necessary tools.

### 3️⃣ Start the GUI
```bash
bash gui.sh
```
This script will:
- Install XFCE4 desktop environment.
- Configure and start the VNC server.
- Provide VNC connection details.

---

## 🎮 Usage

### 🖥️ CLI Mode
Access the Kali Linux CLI:
```bash
kali
```

### 📺 GUI Mode
Start the graphical desktop environment:
```bash
bash gui.sh
```
Follow the on-screen instructions to connect via a VNC viewer.

### VNC Server Commands
- **Start VNC Server**:
  ```bash
  bash vncstart.sh
  ```
- **Stop VNC Server**:
  ```bash
  bash vncstop.sh
  ```

---

## ⚒️ Tools Installation

Install additional penetration testing tools using the `tools.sh` script.

### Interactive Mode
```bash
bash tools.sh --interactive
```
This prompts you to choose tools by category.

### Non-Interactive Mode
```bash
bash tools.sh
```
This installs all available tools by default.

---

## ❓ Troubleshooting

- **VNC Connection Issues**: Ensure the VNC server is running and verify the connection port (default: `localhost:1`).
- **Sound Issues**: The `sound` function in `setup.sh` resolves common audio problems. Ensure PulseAudio is running.
- **Storage Issues**: If storage access fails, verify Termux has the required permissions:
  ```bash
  termux-setup-storage
  ```

---

## 🤝 Contributing

We welcome contributions!  
Fork the repository, make changes, and submit a pull request. Let's make this better together.

---

## 📜 License

This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for details.

---

## 🏆 Acknowledgments

- **Kali Linux**: For providing the NetHunter platform.
- **Termux**: For enabling a Linux-like environment on Android.
- **Community**: For their ongoing support and contributions.

---

<p align="center">
  Enjoy your Kali Linux NetHunter experience on Termux!  
  For issues or suggestions, <a href="https://github.com/your-repo/kali-nethunter-termux/issues">open an issue</a>.
</p>
