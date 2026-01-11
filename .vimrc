"##############################################################################
"                                                                             #
" .vimrc                                                                      #
" Ville Jorma <vjorma@gmail.com> 2026                                         #
"                                        <https://github.com/vjorma/dotfiles> #
"                                                                             #
"##############################################################################

" Mouse selection handled by treminal emulator but wheel scrolling by VIM
"
set mouse=
set ttymouse=sgr

" Ctr-C yanks selection when Vim is in visual mode
"
vmap <C-C> "+y

" Set leader key (prefix of user-defined shortcuts) to , because \ is difficult
" to type with a Finnish keyboard
"
let mapleader = ","

" Line numbers off by default
" ,l toggles displaying of absolute line numbers
"
set nonumber
nnoremap <leader>l :set number!<CR>

" ,L toggles displaying of hybrid line numbers (absolute line number on current line)
"
nnoremap <leader>L :call ToggleHybridNumbers()<CR>

function! ToggleHybridNumbers()
  if &number || &relativenumber
    set nonumber norelativenumber
  else
    set number relativenumber
  endif
endfunction

syntax on

" Enable filetype detection
"
filetype on

" Load filetype-specific plugins
"
filetype plugin on

" Enable filetype-specific indentation rules
"
filetype indent on

" Show unfinished commands on right of status bar
"
set showcmd

" Set global defaults for indentation width and how tsb character is displayed
" filetype detection will override theese
" "
set shiftwidth=4
set tabstop=4

"##############################################################################
"#
"#  codedark colorscheme configuration

" Enable the modern variant of the codedark colorscheme
"
let g:codedark_modern = 1

" Load the codedark colorscheme (VS Code Dark+ inspired)
colorscheme codedark

" Set vim-airline's theme to match codedark
let g:airline_theme = 'codedark'

" NOTE:
" The codedark colorscheme files are located in
" $HOME/.vim/pack/themes/start/vim-code-dark/colors/codedark.vim
" ---------------------------------------------------------------------------

" Settings for 42 C header
"
let g:user42 = 'vjorma'
let g:mail42 = 'vjorma@gmail.com'
