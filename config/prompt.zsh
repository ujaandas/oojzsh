autoload -Uz vcs_info
precmd() { vcs_info }

# Default icons
DEFAULT_PROMPT_ICON=""
DEFAULT_DIR_ICON=""
DEFAULT_GIT_ICON=""

# Load selected theme
source "$ZSH_DIR/config/themes/$SELECTED_THEME.zsh"

# Set icons (use theme-specific if defined, otherwise use defaults)
PROMPT_ICON=${theme[prompt_icon]:-$DEFAULT_PROMPT_ICON}
DIR_ICON=${theme[dir_icon]:-$DEFAULT_DIR_ICON}
GIT_ICON=${theme[git_icon]:-$DEFAULT_GIT_ICON}

zstyle ':vcs_info:git:*' formats '%b'

# Define prompt segments
prompt_dir() {
    echo "%F{${theme[dir_fg]}}${DIR_ICON} %~%f"
}

prompt_git() {
    if [ -n "$vcs_info_msg_0_" ]; then
        echo "%F{${theme[git_fg]}}${GIT_ICON} ${vcs_info_msg_0_}%f"
    fi
}

prompt_symbol() {
    echo "%F{${theme[prompt_fg]}}${PROMPT_ICON}%f"
}

# Build the prompt
build_prompt() {
    PROMPT="$(prompt_dir) $(prompt_git)
$(prompt_symbol) "
}

# Set up the prompt
precmd_functions+=(build_prompt)