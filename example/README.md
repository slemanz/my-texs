# LaTeX on Ubuntu — Setup & Compilation Guide
 
This guide walks you through installing LaTeX on Ubuntu and compiling `.tex`
files straight from the terminal. No GUI required.
 
## 1. Installing LaTeX
 
The easiest way to get a complete LaTeX environment on Ubuntu is through **TeX
Live**. It comes in a few flavors, here's how to choose:
 
### Option A: Full installation (recommended)
 
Installs everything. Takes more disk space (~5 GB), but you'll never miss a
package.
 
```bash
sudo apt update
sudo apt install texlive-full
```
 
### Option B: Minimal + extras (lighter approach)
 
Start lean and add what you need:
 
```bash
sudo apt update
sudo apt install texlive-latex-extra texlive-fonts-recommended texlive-lang-english
```
 
> **Tip:** If you ever run into a "package not found" error during compilation,
just install `texlive-full` and move on — life's too short to hunt packages
manually.