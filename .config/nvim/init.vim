"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|


if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
" Themes
Plug 'rbong/vim-crystalline'

" basic tools
Plug 'vimwiki/vimwiki'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

" PlantUML
"Plug 'aklt/plantuml-syntax'

" Session Manager
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

" Code Completion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

call plug#end()


source ~/.config/nvim/cfg/basics.vim
source ~/.config/nvim/cfg/file-types.vim
source ~/.config/nvim/cfg/code-completion.vim
source ~/.config/nvim/cfg/crystaline-theme.vim
source ~/.config/nvim/cfg/splits.vim
source ~/.config/nvim/cfg/session-management.vim

