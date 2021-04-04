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
Plug 'morhetz/gruvbox'

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
Plug 'kosayoda/nvim-lightbulb'

call plug#end()


source ~/.config/nvim/cfg/general/settings.vim
source ~/.config/nvim/cfg/general/session-management.vim
source ~/.config/nvim/cfg/general/file-types.vim

source ~/.config/nvim/cfg/keys/mappings.vim

source ~/.config/nvim/cfg/theme/gruvbox.vim
source ~/.config/nvim/cfg/theme/crystaline-theme.vim


source ~/.config/nvim/cfg/lsp/config.vim
luafile ~/.config/nvim/cfg/lsp/lightbulb.lua
luafile ~/.config/nvim/cfg/lsp/language-servers.lua

luafile ~/.config/nvim/cfg/completion/compe-config.lua


