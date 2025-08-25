# ──────────────────────────────────────────────
# Powerlevel10k instant prompt (оставить в начале)
# ──────────────────────────────────────────────
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ──────────────────────────────────────────────
# Zinit plugin manager
# ──────────────────────────────────────────────
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
  print -P "%F{33} %F{220}Installing Zinit…%f"
  mkdir -p "$HOME/.local/share/zinit" && chmod g-rwX "$HOME/.local/share/zinit"
  git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
    print -P "%F{34}Installation successful.%f" || print -P "%F{160}Clone failed.%f"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# ──────────────────────────────────────────────
# Plugins
# ──────────────────────────────────────────────
autoload -Uz compinit
compinit

# Подсказки без истории (как в fish)
ZSH_AUTOSUGGEST_STRATEGY=(completion)

zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit ice depth=1
zinit light romkatv/powerlevel10k
zinit light Aloxaf/fzf-tab
zinit light hlissner/zsh-autopair

# ──────────────────────────────────────────────
# Powerlevel10k prompt
# ──────────────────────────────────────────────
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ──────────────────────────────────────────────
# History settings
# ──────────────────────────────────────────────
HISTSIZE=10000
SAVEHIST=$HISTSIZE
HISTFILE=~/.zsh_history

unsetopt SHARE_HISTORY          # не делиться историей между сессиями
setopt appendhistory            # сохранять историю между сессиями
setopt hist_ignore_all_dups     # не добавлять дубликаты
setopt hist_save_no_dups        # не сохранять дубликаты
setopt hist_ignore_space        # не сохранять команды, начинающиеся с пробела

# ──────────────────────────────────────────────
# Zsh options
# ──────────────────────────────────────────────
source <(fzf --zsh)
setopt autocd
setopt interactivecomments
setopt magicequalsubst
setopt nonomatch
setopt notify
setopt numericglobsort
setopt promptsubst
setopt NO_MENU_COMPLETE

# ──────────────────────────────────────────────
# Environment
# ──────────────────────────────────────────────
export TERMINAL=ghostty
export BROWSER=firefox

alias fif='file=$(fzf --preview "ls -l {} && echo && bat --color=always {}") && [ -n "$file" ] && nvim "$file"'

alias fof='file=$(fzf) && [ -n "$file" ] && bat --style=plain --paging=never --color=always "$file" | fzf --ansi | wl-copy'


# ──────────────────────────────────────────────
# Key bindings
# ──────────────────────────────────────────────
#bindkey '\e[1;5C' forward-word       # Ctrl + →
#bindkey '\e[1;5D' backward-word      # Ctrl + ←
#
bindkey "^[[1;5D" backward-word      # Ctrl+←
bindkey "^[[1;5C" forward-word 
bindkey '\e[1;5A' up-line-or-history
bindkey '\e[1;5B' down-line-or-history
bindkey '^[[H' beginning-of-line     # Home
bindkey '^[[F' end-of-line           # End
bindkey '^U' backward-kill-line
bindkey '^K' kill-line
bindkey -e

WORDCHARS=${WORDCHARS//[\/._~=:-]/}


bindkey "^[[3;5~" kill-word           # Ctrl+Delete
bindkey "^H" backward-kill-word      # Ctrl+Backspace (или Backspace)

autoload -U select-word-style
select-word-style bash

### End of Zinit's installer chunk
#
#
