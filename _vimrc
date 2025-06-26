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
" Change cursor
if has('vim_starting')
    let &t_SI .= "\e[6 q"
    let &t_EI .= "\e[2 q"
    let &t_SR .= "\e[4 q"
endif

" vim-plug
call plug#begin()
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
call plug#end()
