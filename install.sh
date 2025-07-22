#!/usr/bin/env bash
# Linux installation script with interactive component selection.

set -eou pipefail

execute_script()
{
  SCRIPT=$1
  chmod +x "$SCRIPT"
  "$SCRIPT"
  chmod -x "$SCRIPT"
}

show_menu() {
  echo "======================================"
  echo "   Dotfiles Installation Menu"
  echo "======================================"
  echo
  echo "Select components to install:"
  echo
  echo "1. [${selections[1]}] Create Directories - Creates ~/bin, ~/.ssh, ~/Documents"
  echo "2. [${selections[2]}] Pixi - Python package manager and project management tool"
  echo "3. [${selections[3]}] Oh My Zsh - Enhanced Zsh shell with themes and plugins"
  echo "4. [${selections[4]}] Dotfiles - Copy configuration files to home directory"
  echo
  echo "Commands:"
  echo "  a - Install all components"
  echo "  i - Install selected components"
  echo "  q - Quit without installing"
  echo
  echo "Toggle selection: Enter component number (1-4)"
}

# Initialize selections (X = selected, space = unselected)
declare -A selections
selections[1]="X"
selections[2]="X" 
selections[3]="X"
selections[4]="X"

while true; do
  clear
  show_menu
  echo
  read -p "Choice: " choice
  
  case $choice in
    1|2|3|4)
      if [[ "${selections[$choice]}" == "X" ]]; then
        selections[$choice]=" "
      else
        selections[$choice]="X"
      fi
      ;;
    a|A)
      selections[1]="X"
      selections[2]="X"
      selections[3]="X"
      selections[4]="X"
      ;;
    i|I)
      break
      ;;
    q|Q)
      echo "Installation cancelled."
      exit 0
      ;;
    *)
      echo "Invalid choice. Press Enter to continue..."
      read
      ;;
  esac
done

clear
echo "Installing selected components..."
echo

if [[ "${selections[1]}" == "X" ]]; then
  echo "Creating directories..."
  execute_script ./install_scripts/create_directories.sh
fi

if [[ "${selections[2]}" == "X" ]]; then
  echo "Installing Pixi..."
  execute_script ./install_scripts/install_pixi-linux.sh
fi

if [[ "${selections[3]}" == "X" ]]; then
  echo "Installing Oh My Zsh..."
  execute_script ./install_scripts/install_ohmyzsh.sh
fi

if [[ "${selections[4]}" == "X" ]]; then
  echo "Installing dotfiles..."
  execute_script ./install_scripts/install_dotfiles.sh
fi

echo
echo "Installation complete!"

