"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|

"let mapleader =" "

call plug#begin('~/.vim/plugged')
" Themes
Plug 'rbong/vim-crystalline'

" basic tools
Plug 'vimwiki/vimwiki'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'mboughaba/i3config.vim'

" PlantUML
Plug 'aklt/plantuml-syntax'

" Session Manager
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

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

	set background=dark

" statusline, tablin, bufferline setup
	set laststatus=2
	set noshowmode
	set showtabline=2
	set guioptions-=e

" -------------------------------------------------------------------
" Crystaline Theme setup
" -------------------------------------------------------------------
function! StatusLine(current, width)
  let l:s = ''

  if a:current
    let l:s .= crystalline#mode() . crystalline#right_mode_sep('')
  else
    let l:s .= '%#CrystallineInactive#'
  endif
  let l:s .= ' %f%h%w%m%r '
  if a:current
    let l:s .= crystalline#right_sep('', 'Fill') . ' %{fugitive#head()}'
  endif

  let l:s .= '%='
  if a:current
    let l:s .= crystalline#left_sep('', 'Fill') . ' %{&paste ?"PASTE ":""}%{&spell?"SPELL ":""}'
    let l:s .= crystalline#left_mode_sep('')
  endif
  if a:width > 80
    let l:s .= ' %{&ft}[%{&fenc!=#""?&fenc:&enc}][%{&ff}] %l/%L %c%V %P '
  else
    let l:s .= ' '
  endif

  return l:s
endfunction

function! TabLine()
  let l:vimlabel = has('nvim') ?  ' NVIM ' : ' VIM '
  return crystalline#bufferline(2, len(l:vimlabel), 1) . '%=%#CrystallineTab# ' . l:vimlabel
endfunction

let g:crystalline_enable_sep = 1
let g:crystalline_statusline_fn = 'StatusLine'
let g:crystalline_tabline_fn = 'TabLine'
let g:crystalline_theme = 'gruvbox'


" Configure swap files to go to ~/.vim/tmp
	set directory^=~/.vim/tmp//


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
	set clipboard=unnamed


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

" -------------------------------------------------------------------
" Configure Session Management
" -------------------------------------------------------------------
	" Basic configuration
	let g:session_directory='~/.vim/sessions'
	let g:session_autosave='yes'		" autosave the session on exit
	let g:session_autoload='yes'		" autoload the default session if no files are provided
	let g:session_autosave_periodic=5	" autosave sessions every x minutes
	let g:session_verbose_messages=0	" don't tell me how to disable load / save prompts

	" Session contents
	set sessionoptions-=help			" Don't persist open help windows
	set sessionoptions-=buffers			" Don't persist hidden and unloaded buffers
	let g:session_persist_font=0		" Don't persist fonts
	let g:session_persist_colors=0		" Don't persist colours (allow theme to manage)


