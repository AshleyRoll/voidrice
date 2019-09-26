"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|

"let mapleader =" "

call plug#begin('~/.vim/plugged')
" Themes
Plug 'itchyny/lightline.vim'

" basic tools
Plug 'vimwiki/vimwiki'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'mboughaba/i3config.vim'

" PlantUML
Plug 'aklt/plantuml-syntax'

call plug#end()

" Some basics:
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number relativenumber
	set nowrap

	set softtabstop=0 noexpandtab
	set shiftwidth=4 tabstop=4
" LightLine (status bar) setup
	set laststatus=2
	set noshowmode
	let g:lightline = {
	      \ 'colorscheme': 'wombat',
	      \ }

" Enable autocompletion:
	set wildmode=longest,list,full
" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Spell-check set to <leader>o, 'o' for 'orthography':
	map <leader>o :setlocal spell! spelllang=en_au<CR>

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults
	set splitbelow splitright

" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
	autocmd VimLeave *.tex !texclear %

" Ensure files are read as what I want:
	let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
	autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
	autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
	autocmd BufRead,BufNewFile *.tex set filetype=tex

" Readmes autowrap text
	autocmd BufRead,BufNewFile *.md set tw=79

" Copy selected text to system clipboard (requires gvim/nvim/vim-x11 installed):
	vnoremap <C-c> "+y
	map <C-p> "+P


" Automatically deletes all trailing whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e

" When shortcut files are updated, renew bash and ranger configs with new material:
	autocmd BufWritePost ~/.bm* !shortcuts

" Run xrdb whenever Xdefaults or Xresources are updated.
	autocmd BufWritePost ~/.Xresources,~/.Xdefaults !xrdb %

" Make command short cuts
" Silent
nnoremap <C-F5> :w<CR> :silent make<CR>:redr!<CR>
inoremap <C-F5> <Esc>:w<CR>:silent make<CR>:redr!<CR>
vnoremap <C-F5> :<C-U>:w<CR>:silent make<CR>:redr!<CR>
" Not Silent
nnoremap <F5> :w<CR> :make<CR>
inoremap <F5> <Esc>:w<CR>:make<CR>
vnoremap <F5> :<C-U>:w<CR>:make<CR>



