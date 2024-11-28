if [ "$ENABLE_PKGS" = "true" ]; then
  for pkg in $ZSH_DIR/config/pkgs/*.zsh; do
    source "$pkg"
  done
fi