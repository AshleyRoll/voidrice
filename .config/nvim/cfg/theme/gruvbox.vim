
hi Comment cterm=italic

let g:gruvbox_italic=1
let g:gruvbox_transparent_bg=1
let g:gruvbox_vert_split="bg1"
let g:gruvbox_sign_column="bg1"

syntax on
colorscheme gruvbox

" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif

