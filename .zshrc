###############################################################################
#                                                                             #
# .zhrc                                                                       #
# Ville Jorma <vjorma@gmail.com> 2026                                         #
#                                        <https://github.com/vjorma/dotfiles> #
#                                                                             #
# Set the environment for interactive shells.                                 #
# login shell: .zshenv → .zprofile → .zshrc → .zlogin → .zlogout              #
# non-login:   .zshenv → .zshrc → .zlogin → .zlogout                          #
#                                                                             #
# Uncomment zmodload at top and zprof at bottom to find out what's causing    #
# delays in shell startup.                                                    #
#                                                                             #
###############################################################################

# zmodload zsh/zprof

# alias vi='$HOME/opt/neovim/bin/nvim'

# Notify if some config files are out of sync with git
#
changed=$(dot diff --name-only)
[[ -n $changed ]] && echo "⚠️  dotfiles changed: ${changed//$'\n'/ }"

# Check SSH certificate validity and issue new certificate if needed
#
CERT=~/.ssh/certs/ed25519_fsdev_26-cert.pub
if [[ ! -f $CERT ]] || ! ssh-keygen -L -f "$CERT" >/dev/null 2>&1; then
    issue-fsdev-cert.sh
fi


setopt prompt_subst

# Shorten $PWD to max 40 chars, keeping start and end.
# Middle is replaced with a colored ellipsis.
shorten_path() {
  local max=40
  local p="${PWD/#$HOME/~}"   # Replace $HOME with ~
  local len=${#${(%)p}}

  if (( len <= max )); then
    print -r -- "$p"
    return
  fi

  local keep=$(( (max - 1) / 2 ))   # chars to keep on each side
  local start=${p[1,keep]}
  local end=${p[-keep,-1]}

  print -r -- "${start}%F{red}…%f${end}"
}


# Exit code of last run program. Green if 0, Red if != 0
# hostname
# space
# ~ if home directory, otherwise full path of cwd shortened to < 40 chars,
# 	truncated from middle.
# colored % if normal user, # if root
# space
# 
PS1='%(?.%F{green}.)%?%f%m %F{red}$(shorten_path)%f%F{cyan}%#%f '


# Shell command history settings. Do not export.
#
HISTFILE=~/.zsh_history
# 50 thousand lines in memory
#
HISTSIZE=50000
# 1 million lines in disk
#
SAVEHIST=1000000
setopt INC_APPEND_HISTORY        # Write to file immediately
setopt SHARE_HISTORY             # Share history
setopt EXTENDED_HISTORY          # Save timestamps


alias ccc="cc -Wall -Wextra -Werror"
alias cccg="cc -Wall -Wextra -Werror -O0 -g"
alias cccgs="cc -Wall -Wextra -Werror -fsanitize=address -fno-omit-frame-pointer -O0 -g"
alias cccgg="cc -Wall -Wextra -Werror -Wconversion -O0 -g"
alias cccggs="cc -Wall -Wextra -Werror -Wconversion -O0 -g -fsanitize=address -fno-omit-frame-pointer"
alias normi="norminette -R CheckForbiddenSourceHeader"
alias grep="grep --color"
export MAIL="vjorma@gmail.com"


# TODO
# source /tmp/zsh-syntax-highlighting/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/Users/niwa/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# zprof
