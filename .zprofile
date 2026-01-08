###############################################################################
#                                                                             #
# .zprofile                                                                   #
# Ville Jorma <vjorma@gmail.com> 2026                                         #
#                                        <https://github.com/vjorma/dotfiles> #
#                                                                             #
###############################################################################
# .zprofile is read once at every login.

# PATH must be set here insted of .zshrc or Apple's
# /usr/libexec/path_helper called from /etc/zprofile
# will override it.
export PATH=$HOME/opt/bin:$HOME/macports/bin:/usr/local/bin:$PATH
