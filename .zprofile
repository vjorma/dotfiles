###############################################################################
#                                                                             #
# .zprofile                                                                   #
# Ville Jorma <vjorma@gmail.com> 2026                                         #
#                                        <https://github.com/vjorma/dotfiles> #
#                                                                             #
# .zprofile is read once at every login ie. when macOS login window launches  #
# user session through launchd OR                                             #
# zsh is started with parameter -l OR when su - or sudo -i is used            #
#                                                                             #
###############################################################################

echo "ZPROFILE RAN at $(date)" > $HOME/logs/zprofile.log

# PATH must be set here insted of .zshrc or Apple's /usr/libexec/path_helper
# called from /etc/zprofile will override it.
#
export PATH=$HOME/macports/bin:$HOME/opt/bin:/usr/local/bin:$PATH
