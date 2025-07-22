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

# Define all installation components in one place
declare -A components
components=(
  [1,name]="Create Directories"
  [1,description]="Creates ~/bin, ~/.ssh, ~/Documents"
  [1,script]="./install_scripts/create_directories.sh"
  [1,install_message]="Creating directories..."
  
  [2,name]="Pixi"
  [2,description]="Python package manager and project management tool"
  [2,script]="./install_scripts/install_pixi-linux.sh"
  [2,install_message]="Installing Pixi..."
  
  [3,name]="Oh My Zsh"
  [3,description]="Enhanced Zsh shell with themes and plugins"
  [3,script]="./install_scripts/install_ohmyzsh.sh"
  [3,install_message]="Installing Oh My Zsh..."
  
  [4,name]="Powerlevel10k"
  [4,description]="Zsh theme with fast prompt and extensive customization"
  [4,script]="./install_scripts/install_powerlevel10k.sh"
  [4,install_message]="Installing Powerlevel10k..."
  
  [5,name]="Dotfiles"
  [5,description]="Copy configuration files to home directory"
  [5,script]="./install_scripts/install_dotfiles.sh"
  [5,install_message]="Installing dotfiles..."
)

# Get the number of components dynamically
get_component_count() {
  local count=0
  for key in "${!components[@]}"; do
    if [[ $key == *",name" ]]; then
      ((count++))
    fi
  done
  echo $count
}

COMPONENT_COUNT=$(get_component_count)

show_menu() {
  echo "======================================"
  echo "   Dotfiles Installation Menu"
  echo "======================================"
  echo
  echo "Select components to install:"
  echo
  
  for i in $(seq 1 $COMPONENT_COUNT); do
    echo "$i. [${selections[$i]}] ${components[$i,name]} - ${components[$i,description]}"
  done
  
  echo
  echo "Commands:"
  echo "  a - Install all components"
  echo "  i - Install selected components"
  echo "  q - Quit without installing"
  echo
  echo "Toggle selection: Enter component number (1-$COMPONENT_COUNT)"
}

# Initialize selections (X = selected, space = unselected)
declare -A selections
for i in $(seq 1 $COMPONENT_COUNT); do
  selections[$i]="X"
done

while true; do
  clear
  show_menu
  echo
  read -p "Choice: " choice
  
  case $choice in
    [1-9]*)
      if [[ $choice -ge 1 && $choice -le $COMPONENT_COUNT ]]; then
        if [[ "${selections[$choice]}" == "X" ]]; then
          selections[$choice]=" "
        else
          selections[$choice]="X"
        fi
      else
        echo "Invalid choice. Press Enter to continue..."
        read
      fi
      ;;
    a|A)
      for i in $(seq 1 $COMPONENT_COUNT); do
        selections[$i]="X"
      done
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

for i in $(seq 1 $COMPONENT_COUNT); do
  if [[ "${selections[$i]}" == "X" ]]; then
    echo "${components[$i,install_message]}"
    execute_script "${components[$i,script]}"
  fi
done

echo
echo "Installation complete!"

