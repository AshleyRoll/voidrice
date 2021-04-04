"-------------------------------------------------------------------
" File type configuration
"-------------------------------------------------------------------
" Ensure files are read as what I want:
let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
autocmd BufRead,BufNewFile *.tex set filetype=tex

" Readmes autowrap text
autocmd BufRead,BufNewFile *.md set tw=79


" Automatically deletes all trailing whitespace on save.
" except any buffer we set the b:noStripWhitespace flag

fun! StripTrailingWhitespace()
    " Only strip if the b:noStripWhitespace variable isn't set
    if exists('b:noStripWhitespace') && b:noStripWhitespace == 1
        return
    endif
    %s/\s\+$//e
endfun


autocmd BufWritePre * call StripTrailingWhitespace()
" override for some file types
autocmd BufRead,BufNewfile ~/.config/nvim/**/*.vim let b:noStripWhitespace=1

" automatically rebuild and restart dwmblocks on edit
autocmd BufWritePost ~/.local/src/dwmblocks/config.h !cd ~/.local/src/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid dwmblocks & }



