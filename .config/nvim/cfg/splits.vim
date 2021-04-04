"-------------------------------------------------------------------
" Splits
"-------------------------------------------------------------------
" Splits open at the bottom and right, which is non-retarded, unlike vim defaults
set splitbelow splitright

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Make adjusting split sizes easier
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Toggle between vertical and horizontal split layout
map <leader>th <C-w>t<C-w>H
map <leader>tk <C-w>t<C-w>K

" Remove the pipes from the seperator on splits
set fillchars+=vert:\ 

