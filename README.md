# <p align="center">Kali Linux NetHunter for Termux</p>

<p align="center">
  <img src="https://img.shields.io/badge/Platform-Termux-a80505?style=flat-square">
  <img src="https://img.shields.io/badge/License-MIT-a80505?style=flat-square">
  <img src="https://img.shields.io/badge/Open%20Source-Yes-a80505?style=flat-square">
  <img src="https://img.shields.io/github/repo-size/Midohajhouj/Kali-Nethunter?label=Size&color=a80505">
  <img src="https://img.shields.io/github/stars/Midohajhouj/Kali-Nethunter?style=flat&label=Stars&color=a80505">
  <img src="https://img.shields.io/github/languages/top/Midohajhouj/Kali-Nethunter?color=a80505">
</p>

Transform your Android device into a powerful penetration testing environment with Kali Linux NetHunter for Termux. This project offers both CLI and GUI setups, optimized for mobile devices with VNC support.

---

## Features

- **Easy Installation**: Automates the installation process of Kali Linux NetHunter on Termux.
- **Dependency Management**: Ensures all required dependencies are installed.
- **Logging**: Logs all installation steps for troubleshooting.
- **Environment Setup**: Configures the environment for seamless usage of Kali Linux NetHunter.

---

## 🛠 Prerequisites

1. **Termux**: Install Termux from [F-Droid](https://f-droid.org) or a trusted source.
2. **Internet Connection**: A stable internet connection is required for downloading packages and scripts.
# 🚀 Installation

### Clone the Repository
```bash
git clone https://github.com/Midohajhouj/Kali-Nethunter.git
cd Kali-Nethunter
```

### Run the Setup Script
```bash
bash setup.sh
```
During installation, select one of the following options:
- **Full (15 GB)**: Complete version with all tools and features.
- **Minimal (2 GB)**: Lightweight version and we will customize it (Best option).  
- **Nano (250 MB)**: Bare minimum for low-storage devices.

**My Option**: Minimal (2 GB). We will expand this later during installation to ~6 GB by adding only necessary tools.

If you encounter an error during installation, don't panic. Simply rerun the setup. Sometimes, a few weak or lightweight packages may cause the script to fail. 
 
---

## Usage

After the installation is complete, you can start using Kali Linux NetHunter on Termux:

- **Start Kali CLI**:
  - Type `kali` or `nh` in Termux to start the Kali Linux CLI.
  
- **Install Additional Tools**:
  - Use the `tools.sh` script to install additional tools:
    ```bash
    sudo tools.sh
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

### **<p align="center"> Coded by <a href="https://github.com/Midohajhouj">LIONMAD</a> </p>**
