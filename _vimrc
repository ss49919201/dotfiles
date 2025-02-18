" Syntax highlight
syntax enable
" tab width
set tabstop=4
" save undo
set undodir=~/.vim/undo-dir
set undofile
" Continue indentation of previous line at line break
set autoindent
" Highlight current line
set cursorline
" Display cursor
set ruler
" Display line number
set number
" Cursor movement to straddle lines
set whichwrap=b,s,h,l,<,>,~,[,]
" Highlight search result
set hlsearch
" Unhighlight by pressing ESC repeatedly
nmap <Esc><Esc> :nohlsearch<CR><Esc>
" Copy yank to clipboard
set clipboard=unnamed
" Emphasis on full-width spaces
hi DoubleByteSpace term=underline ctermbg=blue guibg=darkgray
match DoubleByteSpace /　/
