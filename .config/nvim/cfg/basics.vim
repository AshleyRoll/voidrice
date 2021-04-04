" Some basics:
 set nocompatible
 filetype plugin on
 syntax on
 set encoding=utf-8
 set number relativenumber
 set nowrap

 set softtabstop=0 expandtab
 set shiftwidth=4 tabstop=4

 set background=dark

" statusline, tablin, bufferline setup
 set laststatus=2
 set noshowmode
 set showtabline=2
 set guioptions-=e

 set hidden
 set updatetime=300
 set shortmess+=c

" Configure swap files to go to ~/.config/nvim/tmp
set directory^=~/.config/nvim/tmp//

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Spell-check set to <leader>o, 'o' for 'orthography':
map <leader>o :setlocal spell! spelllang=en_au<CR>

" -------------------------------------------------------------------
" Configure some other key mapping
" -------------------------------------------------------------------
" Copy selected text to system clipboard (requires gvim/nvim/vim-x11 installed):
vnoremap <C-c> "+y
map <C-p> "+P
set clipboard=unnamed

" Map Ctrl-Backspace to delete the previous word in insert mode.
set backspace=indent,eol,start

inoremap <C-BS> <C-w>

