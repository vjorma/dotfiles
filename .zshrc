# Uncomment zmodload at top and zprof at bottom to find out what's 
# causing delays in shell startup
#
# zmodload zsh/zprof

# Check SSH certificate validity and issue new certificate if needed
#
CERT=~/.ssh/certs/ed25519_fsdev_26-cert.pub
if ! ssh-keygen -L -f "$CERT" >/dev/null 2>&1; then
    issue-fsdev-cert
fi

#export USER="vjorma"
#FIXME Printed black on black:
#export CLICOLOR=""
export GREP_OPTIONS="--color"
export MAIL="vjorma@gmail.com"
## incompatible with brew
PS1='%(?.%F{green}.%F{red})%?%f%m %~%# '

# bindkey '\t\t' autosuggest-accept

# Shell command history settings. Do not export.
#
HISTFILE=~/.zsh_history
# 50 thousand lines in memory
HISTSIZE=50000
# 1 million lines in disk
SAVEHIST=1000000
setopt INC_APPEND_HISTORY        # Write to file immediately
setopt SHARE_HISTORY             # Share history
setopt HIST_IGNORE_ALL_DUPS      # Don't record same command twice
setopt EXTENDED_HISTORY          # Save timestamps

alias vi="~/opt/neovim/bin/nvim"
alias ccc="cc -Wall -Wextra -Werror"
alias cccg="cc -Wall -Wextra -Werror -O0 -g"
alias cccgs="cc -Wall -Wextra -Werror -fsanitize=address -fno-omit-frame-pointer -O0 -g"
alias cccgg="cc -Wall -Wextra -Werror -Wconversion -O0 -g"
alias cccggs="cc -Wall -Wextra -Werror -Wconversion -O0 -g -fsanitize=address -fno-omit-frame-pointer"
alias normi="norminette -R CheckForbiddenSourceHeader"
alias l="cd proj/libft"
alias francinette=/Users/niwa/francinette/tester.sh

alias paco=/Users/niwa/francinette/tester.sh
# TODO
# source /tmp/zsh-syntax-highlighting/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

## export NVM_DIR="$HOME/.nvm"
## [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
## [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
alias dot='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
dot status
# zprof
