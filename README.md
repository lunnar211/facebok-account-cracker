<div align="center">

# 🔐 Facebook Account Security Tester

<img src="https://img.shields.io/badge/Python-3.7%2B-blue?style=for-the-badge&logo=python&logoColor=white" />
<img src="https://img.shields.io/badge/Platform-Linux%20%7C%20macOS%20%7C%20Termux-lightgrey?style=for-the-badge" />
<img src="https://img.shields.io/badge/License-MIT-green?style=for-the-badge" />
<img src="https://img.shields.io/badge/Use-Educational%20Only-red?style=for-the-badge" />

> **Dictionary-attack security auditor for Facebook accounts.**  
> Test the strength of *your own* password — or accounts you have written authorisation to audit.

</div>

---

## ⚠️ Disclaimer

> This tool is provided **strictly for educational purposes and authorised security testing only**.  
> Using it against accounts you do not own or do not have explicit written permission to test is **illegal** and may violate the Computer Fraud and Abuse Act (CFAA), GDPR, and equivalent laws in your jurisdiction.  
> The author accepts **no liability** for misuse.

---

## ✨ Features

| Feature | Details |
|---------|---------|
| 🐍 Python 3 | Fully rewritten in Python 3 — no Python 2 required |
| 🎨 Coloured output | ANSI colour banner with live progress display |
| 📋 Custom wordlists | Bring your own wordlist or use the bundled `common.txt` |
| 🔄 Session rotation | Automatically refreshes cookies every 10 attempts |
| 📱 Mobile user-agent | Uses Facebook's mobile login endpoint for better compatibility |
| ⌨️ Interactive mode | Prompts for input when no arguments are provided |

---

## 📦 Requirements

- Python **3.7** or newer
- [`requests`](https://pypi.org/project/requests/) library
- Active internet connection

---

## 🛠️ Installation

### Option A — Automatic (recommended)

```bash
git clone https://github.com/lunnar211/facebok-account-cracker.git
cd facebok-account-cracker
bash install.sh
```

### Option B — Manual

```bash
# Clone the repo
git clone https://github.com/lunnar211/facebok-account-cracker.git
cd facebok-account-cracker

# Install the Python dependency
pip3 install requests
```

### Termux (Android)

```bash
pkg update && pkg install python git
pip install requests
git clone https://github.com/lunnar211/facebok-account-cracker.git
cd facebok-account-cracker
```

---

## 🚀 Usage

### Interactive mode (no arguments)

```bash
python3 hack.py
```

You will be prompted for the target e-mail / phone number and an optional wordlist path.

### Command-line mode

```bash
# Use the built-in wordlist
python3 hack.py target@example.com

# Use a custom wordlist
python3 hack.py target@example.com /path/to/passwords.txt
```

---

## 🔄 How It Works — Step by Step

```
Step 1 ─ Startup
           └─ Print banner & disclaimer
           └─ Parse target email and wordlist path

Step 2 ─ Token Fetch
           └─ Open a new requests.Session
           └─ GET https://mbasic.facebook.com/
           └─ Extract the hidden `lsd` anti-CSRF token from the HTML

Step 3 ─ Dictionary Attack Loop
           └─ For each password in the wordlist:
               ├─ POST login credentials + lsd token to Facebook's mobile login endpoint
               ├─ Inspect redirect URL and session cookies for success indicators
               ├─ If login succeeds → print credentials and exit
               ├─ If login fails   → move to next password
               └─ Every 10 attempts → rotate session & refresh token

Step 4 ─ Result
           ├─ SUCCESS: prints the working email + password in green
           └─ FAILURE: reports that the password was not found in the wordlist
```

---

## 📁 File Structure

```
facebok-account-cracker/
├── hack.py        ← Main Python 3 script
├── common.txt     ← Built-in password wordlist (484 entries)
├── install.sh     ← Automatic dependency installer
└── README.md      ← This file
```

---

## 🤝 Contributing

Pull requests are welcome! Please open an issue first to discuss what you would like to change.

---

## 📄 License

Distributed under the [MIT License](LICENSE).

---

<div align="center">
Made with ❤️ for security research & education
</div>
