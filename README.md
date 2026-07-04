 HACKERS_SHELL_GPT 

Description :

HACKERS_SHELL_GPT is an elite, automated configuration suite designed to seamlessly integrate AI-powered CLI assistance directly into Kali Linux and Debian-based environments. Built specifically for ethical hackers, penetration testers, and cybersecurity students, it streamlines the deployment of ShellGPT while ensuring secure API credential handling.

By automating PEP-668 compliant virtual environments, establishing persistent shell aliases, and injecting a custom cyber_hacker threat-assessment persona, this tool accelerates reconnaissance, network analysis, and complex command generation in advanced cyber training labs.

Advanced Features :

Dual-Mode API Authentication: Seamlessly switch between a secure Developer Mode (via passcode) or Standard User Mode for custom API key injection.

Automated PEP-668 Compliance: Automatically builds a fully isolated Python Virtual Environment (~/.shellgpt-env) to bypass Kali's strict global pip installation blocks, ensuring an error-proof setup.

Cybersecurity AI Persona Injection: Hardcodes a specialized cyber_hacker role into the ShellGPT configuration, forcing the AI to respond as an elite, concise penetration testing assistant.

Global Persistence & Aliasing: Dynamically detects your active shell (.bashrc or .zshrc) and injects the necessary Azure/Gemini API variables and custom aliases (sgpt) for persistent, system-wide access.

Cyber-Themed Aesthetics: Features a professional FIGLET-style banner and color-coded, simulated "neural-link" terminal outputs for a highly immersive lab experience.

Installation & Setup :-)

Clone the Repository

git clone [https://github.com/vidit-shringi/HACKERS_SHELL_GPT.git](https://github.com/vidit-shringi/HACKERS_SHELL_GPT.git)
cd HACKERS_SHELL_GPT


Make the Script Executable

chmod +x setup_sgpt.sh


Initialize the Neural Link

./setup_sgpt.sh


Reload Your Terminal

source ~/.bashrc  # or source ~/.zshrc


Usage :
Once installed, you can call the AI from anywhere in your terminal using the sgpt command. The custom cyber_hacker role is automatically applied.

Example Prompts:

sgpt "Write a complex nmap scan to find hidden UDP ports and bypass firewalls"

sgpt "Generate a bash script to parse this Wireshark PCAP file for HTTP cookies"

sgpt "Explain how the Social-Engineer Toolkit (SET) handles credential sniffing"

Ethical Disclaimer :
This tool is developed strictly for educational purposes and authorized ethical hacking/penetration testing. Users are responsible for complying with all applicable local, state, and federal laws. The developers assume no liability for misuse or damage caused by this program.

Contributing :
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change. Ensure you update tests as appropriate.
