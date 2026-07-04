#!/bin/bash

# ==========================================
# HACKERS_SHELL_GPT (sgpt) AI Configuration Script
# Target Environment: Kali Linux / Debian
# ==========================================

# --- ANSI Color Codes for UI ---
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
PURPLE='\033[0;35m'
BLUE='\033[0;34m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# --- Global Configurations ---
CONFIG_DIR="$HOME/.config/shell_gpt"
CONFIG_FILE="$CONFIG_DIR/.sgptrc"
SHELL_RC_FILE="$HOME/.$(basename "$SHELL")rc"
ACTIVATION_KEY=""
DEFAULT_MODEL="azure/gpt-4o"
USE_LITELLM="true"
API_BASE_URL="https://apiservice5lh2czy2mmcta.azure-api.net/ecc-sqmp-v1/"
AZURE_API_VERSION="2024-09-01-preview"

# --- 1. Elegant Figlet/ASCII Banner with Logo ---
print_banner() {
    clear
    # Custom ASCII Logo (Replaced Skull) in Red
    echo -e "${RED}${BOLD}"
    cat << "EOF"
                                                                                                                                                                                                                                                                                                                                                                                          
                                                                                                                                                                                                                                                                                                                                                                                          
                                                                                                                                                                                                                                                                                                                                                                                          
                                                                                                                                                                                                                                                                                                                                                                                          
                                                                                                                                                                                                                                                                                                                                                                                          
                                                                                                                                                                                                                                                                                                                                                                                          
                                                                                                                                                                                                                                                                                                                                                                                          
                                                                                                                                                                                                                                                                                                                                                                                          
                                                                                                                                                                                                                                                                                                                                                                                          
                                                                                                                                                                                                                                                                                                                                                                                          
                                                                                                                                                                                                                                                                                                                                                                                          
                                                                                                                                                                                                                                                                                                                                                                                          
                                                                                                                                                                                                                                                                                                                                                                                          
                                                                                                                                                                                                                                                                                                                                                                                          
                                                                                                                                                                                                                                                                                                                                                                                          
                                                                                                                                                                                                                                                                                                                                                                                          
                                                                                                                                                                                                                                                                                                                                                                                          
                                                                                                                                                                                                                                                                                                                                                                                          
                                                                                                                                                                                                                                                                                                                                                                                          
                                                                                                                                                                                                                                                                                                                                                                                          
                                                                                                                                                                                                                                                                                                                                                                                          
                                                                                                                                                                                                                                                                                                                                                                                          
                                                                                                                                                                                                                                                                                                                                                                                          
                                                                                                                                                                                         ÇÅÆÆÆÆÞ                               ›ÞÆÆ—                                                                                                                                                      
                                                                                                                                                                                    ›ÞÆÆÆí     íÆÆÆÞ                        —gÆÆ——Æz                                                                                                                                                      
                                                                                                                                                                                —ÆÆÆg—             {ÆÆÆÞ                 ›ÆÆÅ—    ÆÇ                                                                                                                                                      
                                                                                                                                                                            zÆÆÆÞ                      zÆÆ            zÆÆÆ        ÆG                                                                                                                                                      
                                                                                                                                                                        ÏÆÆÆÇ                                      zÆÆG           Æg                                                                                                                                                      
                                                                                                                                                                    üÆÆÆÇ                                        ÆÆÆÏ             Æg                                                                                                                                                      
                                                                                                                                                                üÆÆÆü                                               üÆÆÆ›         ÆÅ                                                                                                                                                      
                                                                                                                                                            ÏÆÆÆ6                        ÅÆÆÆÆÆÆ                     {ÆÇ          Æg                                                                                                                                                      
                                                                                                                                                        zÆÆÆü                         {ÆÆ—     ›ÆÆ—                 {Æü      6Æü  Æg                                                                                                                                                      
                                                                                                                                                     ÅÆÅÇ                            üÆ—         ÏÆÏ               —Æü      GÆíÇÆÆÆÅ                                                                                                                                                      
                                                                                                                                                    íÆ›                             —Æí           ÅÅ              zÆÏ      ÅÆ    ›gÞ                                                                                                                                                      
                                                                                                                                                    íÆ›                             zÆ—           ›Æ—            ÆÆ{      ÆÅ                                                                                                                                                              
                                                                                                                                                    zÆ›                             íÆ—           ÞÆ           {ÆÅ       ÆÅ                                                                                                                                                               
                                                                                                                                                    zÆ›                              ÇÆ           ÆÇ          ÅÆí      {ÆG                                                                                                                                                                
                                                                                                                                                    zÆ›                               gÆ—       íÆÞ        {gÆÏ       {Æ6          {                                                                                                                                                      
                                                                                                                                                    zÆ›                                {ÆÆz   ›ÆÆí      í6ÆÅ—        zÆü           ÆÏ                                                                                                                                                     
                                                                                                                                                    zÆ›                                   ÏÆÆÆÆÆÞÇ66ÇÅÆÆ6{          ÏÆz            ÆÏ                                                                                                                                                     
                                                                                                                                                    zÆ                                   ÇÅÆÇ  ›————›              6Æz             Æü                                                                                                                                                     
                                                                                                                                                    zÆ›                             —ÞÆÆÆ—                        GÆ—              Æü                                                                                                                                                     
                                                                                                                                                    zÆ›                          gÆÆG›                           ÆÆ                Æü                                                                                                                                                     
                                                                                                                                                    zÆ›                       ÏÆÆ6                              ÅÆ                 ÆÏ                                                                                                                                                     
                                                                                                                                                    zÆ›                     íÆÆ                                ÅÆ                 ›Æí                                                                                                                                                     
                                                                                                                                                    zÆ›                    ÆÆ—                                ÅÆ                  zÆ—                                                                                                                                                     
                                                                                                                                                    {Æ—                  —ÆÞ                                ›Æg                   GÆ                                                                                                                                                      
                                                                                                                                                     Åü                 üÆ6                                 Æ6                    Æg                                                                                                                                                      
                                                                                                                                                     ÇÆ                zÆü                                 ÆÇ                     ÆÅ                                                                                                                                                      
                                                                                                                                                     6Æ                ÆÆ                                 ÆÞ                      ÆÞ                                                                                                                                                      
                                                                                                                                                     ÏÆ               ÞÆ                                ÏÆG                      6Æ›                                                                                                                                                      
                                                                                                                                                      gg             ›Æz                               ÇÆü                       ÆÆ                                                                                                                                                       
                                                                                                                                                      GÆ             6Æ             {GÆÏ              ÞÆ›                        ÆÅ                                                                                                                                                       
                                                                                                                                                      —ÆÏ            ÞÆ            Æg  üÆG           ÇÆ                         ÞÆ                                                                                                                                                        
                                                                                                                                                       ÆÆ           ›Æz           {Å    ÆÆ          6Æ›                         ÆÆ                                                                                                                                                        
                                                                                                                                                       {ÆÏ          íÆ›            ÆÅzzÇÆÆ6›       ÞÆ›                         ÏÆ                                                                                                                                                         
                                                                                                                                                        ÆÆ          zÆ›            ÆÅÏÏ{  üÅÆÞ—ígÆÆÆ›                          gÆ                                                                                                                                                         
                                                                                                                                                         ÆÞ         zÆ›          íÆÇ         ÞÆÞ  ›ÆG                         üÆ                                                                                                                                                          
                                                                                                                                                         ÇÆ›        ÏÆ          6ÆÏ          üÆ    —Æ—                        Åg                                                                                                                                                          
                                                                                                                                                          Æg        ÏÅ         ÞÆ›            ÞÆÞÇÞÆÏ                        üÆ                                                                                                                                                           
                                                                                                                                                           Æü       6g        ÅÆ                ——›                         —Æz                                                                                                                                                           
                                                                                                                                                           íÆ{      Çg      ›Æg                                             ÆÇ                                                                                                                                                            
                                                                                                                                                            üÆ      6G     ›Æ6                                             Æg                                                                                                                                                             
                                                                                                                                                             ÞÆ     6G    ›ÆÇ                                             gÆ—                                                                                                                                                             
                                                                                                                                                              gÆ    GÞ   6Æ6                                             gÆ{                                                                                                                                                              
                                                                                                                                                               ÆÆÆÆÆg   ÆÆ{                                             gÆ›                                                                                                                                                               
                                                                                                                                                                       ÆÆ                                              gÆ                                                                                                                                                                 
                                                                                                                                                                      gÆ                                              ÞÆ                                                                                                                                                                  
                                                                                                                                                                     6Æ                                              ÆÆ                                                                                                                                                                   
                                                                                                                                                                     6Æ                                            —Æ6                                                                                                                                                                    
                                                                                                                                                                      ÆÆ                                          gÆÏ                                                                                                                                                                     
                                                                                                                                                                       ÞÆ—                                      —Æg                                                                                                                                                                       
                                                                                                                                                                        —ÆÆ                                    ÅÆí                                                                                                                                                                        
                                                                                                                                                                          üÆÞ                                ÞÆü                                                                                                                                                                          
                                                                                                                                                                            ÇÆÇ                            6ÆÞ                                                                                                                                                                            
                                                                                                                                                                              üÆÞ                       ›GÆ6                                                                                                                                                                              
                                                                                                                                                                                üÆÅ›                  ›ÅÆü                                                                                                                                                                                
                                                                                                                                                                                  {gÆÇ              6ÆÅí                                                                                                                                                                                  
                                                                                                                                                                                     üÆÅÏ        üÆÆü                                                                                                                                                                                     
                                                                                                                                                                                        6ÆÅÏ  ÇÆÆz                                                                                                                                                                                        
                                                                                                                                                                                           ÏÆgí                                                                                                                                                                                           
                                                                                                                                                                                                                                                                                                                                                                                          
                                                                                                                                                                                                                                                                                                                                                                                          
                                                                                                                          ›Ï    6Ç      G›   zÅÅggggÅ6    ÅggggÅÅ    íggÅÅG{      gí      Ç      üÅÆÅÇ      Ï      zz    ü6    ügggggÅü    Ç›        —ggÅÅgü                                                                                                                              
                                                                                                                          íÇ    ÅÆÆ     Æz       Æ        Æ          6—     g{    ÆÆü     Æ     Æ           Þ      ÇÇ    gÅ    GÇ          Å{        zü     zÆ›                                                                                                                           
                                                                                                                          íÞ    gÞ ÆÏ   Æz       Æ        Å          6›     zÏ    Æ›zÆ    Æ     Æ—          Ç      ÇÞ    GÆ    Þ6          Å{        zÏ      —Å                                                                                                                           
                                                                                                                          íÇ    ÅG  üÇ  Æz       Æ        ÆÞÇÇÇÇ     6{    zÆ›    Æ›  Å—  Æ       ÏÆÆÆ›     ÆGGGÞÞÞÆÇ    GÆ    GÆÞÞÞÞ6     Å{        zÏ       g›                                                                                                                          
                                                                                                                          íÇ    gÇ   —Æ›Æz       Æ        Å          6ü›››GÞ      Æ›   ÞÆ Æ           Þ     Þ      ÇÇ    GÅ    Þ6          Å{        zü      zÞ                                                                                                                           
                                                                                                                          íÞ    gÇ     gÆz       Æ        Æ          6›    íÞ     Æ›     ÆÆ    üg    üÆ     Ç      ÞÇ    GÆ    GÞ          Åz        z6    íÅü                                                                                                                            
EOF

    # Main HACKERS_SHELL_GPT Banner in Cyan
    echo -e "${CYAN}${BOLD}"
    cat << "EOF"
 _   _    _    ____  _  _______ ____ ____  
| | | |  / \  / ___|| |/ / ____|  _ \/ ___| 
| |_| | / _ \| |    | ' /|  _| | |_) \___ \ 
|  _  |/ ___ \ |___ | . \| |___|  _ < ___) |
|_| |_/_/   \_\____|_|\_\_____|_| \_\____/ 
                                           
 _   _ _____ _     _        ____ ____ _____ 
| | | | ____| |   | |      / ___|  _ \_   _|
| |_| |  _| | |   | |     | |  _| |_) || |  
|  _  | |___| |___| |___  | |_| |  __/ | |  
|_| |_|_____|_____|_____|___\____|_|    |_|  
                       |_____|    InternShield           
EOF

    # HACKERS AI Sub-Banner in Purple
    echo -e "\n${PURPLE}${BOLD}   [ H A C K E R S   A I   C O N F I G   T O O L ]${NC}"
    echo -e "${BLUE}   ===============================================${NC}\n"

    sleep 1
    echo -e "${GREEN}[*] Authenticating user credentials with the mainframe...${NC}"
    sleep 1
    echo -e "${GREEN}[*] Decrypting configuration protocols...${NC}\n"
    sleep 1
}

# --- 2. Prompt for Activation Key ---
prompt_for_key() {
    echo -e "${CYAN}>>>${NC} Please enter your AI Activation Key (API Key): "
    read -r -s ACTIVATION_KEY
    if [[ -z "$ACTIVATION_KEY" ]]; then
        echo -e "\n${RED}[!] Error: Activation Key cannot be empty. Connection aborted.${NC}" >&2
        exit 1
    fi
    echo -e "${GREEN}[*] Key securely acquired in volatile memory.${NC}\n"
}

# --- 3. Ask User or Developer ---
prompt_user_type() {
    echo -n -e "${CYAN}>>>${NC} Are you a User or Developer? (u/d): "
    read -r USER_ROLE

    if [[ "$USER_ROLE" == "d" || "$USER_ROLE" == "D" ]]; then
        echo -n -e "${CYAN}>>>${NC} Developer mode selected. Enter verification password: "
        read -r -s DEV_PASS
        echo "" # New line after silent password entry
        if [[ "$DEV_PASS" == "4077" ]]; then
            ACTIVATION_KEY="558f90f03d754238abc2567a1c20eb46"
            echo -e "${GREEN}[*] Developer verified. Auto-connecting with development API...${NC}\n"
        else
            echo -e "${RED}[!] Error: Incorrect password. Access Denied.${NC}"
            exit 1
        fi
    else
        # Default to User process
        prompt_for_key
    fi
}

# --- 4. Build Configuration File ---
configure_sgpt() {
    echo -e "${YELLOW}[*] Synthesizing ShellGPT configuration matrix...${NC}"
    
    mkdir -p "$CONFIG_DIR" || { 
        echo -e "${RED}[!] Error: Failed to create config directory.${NC}" >&2; return 1; 
    }

    # Writing to .sgptrc
    cat > "$CONFIG_FILE" << EOF
# Auto-generated by HACKERS_SHELL_GPT Setup Script
DEFAULT_MODEL=$DEFAULT_MODEL
USE_LITELLM=$USE_LITELLM
OPENAI_API_KEY=$ACTIVATION_KEY
EOF
    echo -e "${GREEN}[+] Configuration successfully written to $CONFIG_FILE${NC}\n"
}

# --- 5. Inject Environment Variables ---
export_env_variables() {
    echo -e "${YELLOW}[*] Calibrating system environment variables...${NC}"
    
    # Export for current session
    export AZURE_API_BASE="$API_BASE_URL"
    export AZURE_API_VERSION="$AZURE_API_VERSION"
    export OPENAI_API_KEY="$ACTIVATION_KEY"

    # Inject into .bashrc or .zshrc for persistence
    if ! grep -q "AZURE_API_BASE" "$SHELL_RC_FILE"; then
        echo "" >> "$SHELL_RC_FILE"
        echo "# --- HACKERS_SHELL_GPT AI Config ---" >> "$SHELL_RC_FILE"
        echo "export AZURE_API_BASE=\"$API_BASE_URL\"" >> "$SHELL_RC_FILE"
        echo "export AZURE_API_VERSION=\"$AZURE_API_VERSION\"" >> "$SHELL_RC_FILE"
        echo "export OPENAI_API_KEY=\"$ACTIVATION_KEY\"" >> "$SHELL_RC_FILE"
        echo -e "${GREEN}[+] Variables injected into $SHELL_RC_FILE for persistent uplink.${NC}"
    else
        echo -e "${CYAN}[i] Environment variables already exist in $SHELL_RC_FILE.${NC}"
    fi
    echo ""
}

# --- 6. Verify Setup ---
verify_env_variables() {
    echo -e "${YELLOW}[*] Running diagnostic checks on variables...${NC}"
    echo -e "    ${CYAN}AZURE_API_BASE:${NC} ${AZURE_API_BASE:-"Not set"}"
    echo -e "    ${CYAN}AZURE_API_VERSION:${NC} ${AZURE_API_VERSION:-"Not set"}"
    echo -e "    ${CYAN}DEFAULT_MODEL:${NC} $DEFAULT_MODEL"
    echo ""
}

# --- 7. Execution & Testing ---
execute_sgpt() {
    if ! command -v sgpt >/dev/null 2>&1; then
        echo -e "${RED}[!] Error: 'sgpt' command not found.${NC}" >&2
        echo -e "${YELLOW}[i] Tip: Ensure you have installed it via 'pip install shell-gpt[litellm]'${NC}"
        return 1
    fi

    echo -e "${GREEN}[*] Neural link established. Sending test packet to AI...${NC}\n"
    
    # Run a quick test prompt to ensure it works
    sgpt "Output only the words 'HACKERS AI CONNECTION SUCCESSFUL.' in green text using bash ANSI codes."
}

# --- Main Execution Block ---
main() {
    print_banner
    prompt_user_type  # Now integrated before the config phase!
    configure_sgpt
    export_env_variables
    verify_env_variables
    execute_sgpt
    
    echo -e "\n${CYAN}${BOLD}>>> Setup Complete. You may now use 'sgpt <prompt>' in your terminal! <<<${NC}"
}

main
