###############################################################################
#                                                                             #
# .zhenv                                                                      #
# Ville Jorma <vjorma@gmail.com> 2026                                         #
#                                        <https://github.com/vjorma/dotfiles> #
#                                                                             #
# .zshenv is read for every Zsh instance, including background scripts and    #
# non-interactive tasks.                                                      #
#                                                                             #
# Never have any commands that produce text output (like echo) here,          #
# as this can break background processes like scp or rsync.                   #
#                                                                             #
###############################################################################

# This disables Apple's own zshrc_Apple_Terminal script. Shell history will be
# managed by zsh itself. Must be in .zshenv instead of .zshrc or .zprofile so
# that it's read before shell initializes.
#
export SHELL_SESSIONS_DISABLE=1

# PATH must be set here insted of .zshrc or Apple's /usr/libexec/path_helper
# called from /etc/zprofile will override it. Also, on macOS it can't be set
# in .zprofile because launchd after graphical login does not read it.
# Using zsh's native path array with unique (-U) to avoid PATH dublication
# across nested shells.
typeset -U path
path=("$HOME/macports/bin" "$HOME/opt/bin" /usr/local/bin $path)
