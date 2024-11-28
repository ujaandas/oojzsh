if [ "$ENABLE_TOOLS" = "true" ]; then
  for tool in $ZSH_CONFIG_DIR/tools/*.zsh; do
    source "$tool"
  done
fi