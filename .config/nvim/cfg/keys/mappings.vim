" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Use alt + hjkl to resize windows
noremap <silent> <C-Left>  :vertical resize +2<CR>
noremap <silent> <C-Right> :vertical resize -2<CR>
noremap <silent> <C-Up>    :resize +2<CR>
noremap <silent> <C-Down>  :resize -2<CR>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" handle word deletion
inoremap <C-BS> <C-w>

" Spell-check set to <leader>o, 'o' for 'orthography':
map <leader>o :setlocal spell! spelllang=en_au<CR>

" Toggle between vertical and horizontal split layout
map <leader>th <C-w>t<C-w>H
map <leader>tv <C-w>t<C-w>K
