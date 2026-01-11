###############################################################################
#                                                                             #
# .zhrc                                                                       #
# Ville Jorma <vjorma@gmail.com> 2026                                         #
#                                        <https://github.com/vjorma/dotfiles> #
#                                                                             #
# Set the environment for interavtive shells. Loaded after .zprofile          #
# Order: .zshenv → .zprofile → .zshrc → .zlogin → .zlogout                    #
#                                                                             #
#                                                                             #
# Uncomment zmodload at top and zprof at bottom to find out what's # causing  #
# delays in shell startup.                                                    #
#                                                                             #
###############################################################################

# zmodload zsh/zprof

# Notify if some config files are out of sync with git
#
alias dot='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
if ! dot diff --quiet; then
	echo "⚠️  dotfiles changed: $(dot diff --name-only | tr '\n' ' ')"
fi

# alias vi='$HOME/opt/neovim/bin/nvim'

# Check SSH certificate validity and issue new certificate if needed
#
CERT=~/.ssh/certs/ed25519_fsdev_26-cert.pub
if ! ssh-keygen -L -f "$CERT" >/dev/null 2>&1; then
    issue-fsdev-cert
fi

export GREP_OPTIONS="--color"
export MAIL="vjorma@gmail.com"

# Exit code of last run program. Green if 0, Red if != 0
# hostname
# space
# ~ if home directory, otherwise full path of cwd
# % if normal user, # if root
# space
# 
PS1='%(?.%F{green}.%F{red})%?%f%m %~%# '

# Shell command history settings. Do not export.
#
HISTFILE=~/.zsh_history
# 50 thousand lines in memory
HISTSIZE=50000
# 1 million lines in disk
SAVEHIST=1000000
setopt INC_APPEND_HISTORY        # Write to file immediately
setopt SHARE_HISTORY             # Share history
setopt EXTENDED_HISTORY          # Save timestamps

# alias vi="~/opt/neovim/bin/nvim"
alias ccc="cc -Wall -Wextra -Werror"
alias cccg="cc -Wall -Wextra -Werror -O0 -g"
alias cccgs="cc -Wall -Wextra -Werror -fsanitize=address -fno-omit-frame-pointer -O0 -g"
alias cccgg="cc -Wall -Wextra -Werror -Wconversion -O0 -g"
alias cccggs="cc -Wall -Wextra -Werror -Wconversion -O0 -g -fsanitize=address -fno-omit-frame-pointer"
alias normi="norminette -R CheckForbiddenSourceHeader"
# TODO
# source /tmp/zsh-syntax-highlighting/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zprof
