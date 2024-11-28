#!/bin/sh

# Default .zshrc file in the current directory
DEFAULT_ZSHRC="$(pwd)/.zshrc"

read -p "Do you want your .zshrc somewhere other than ~/.zshrc? (y/n): " CUSTOM_TARGET_ANS

if [ "$CUSTOM_TARGET_ANS" = "y" ]; then
  read -p "Please provide the full path to your target .zshrc location: " CUSTOM_TARGET
  ln -s "$DEFAULT_ZSHRC" "$CUSTOM_TARGET"
else
  ln -s "$DEFAULT_ZSHRC" ~/.zshrc
fi

if [ $? -eq 0 ]; then
  echo "Symlink created for .zshrc."
else 
  echo "Symlink creation failed."
fi
