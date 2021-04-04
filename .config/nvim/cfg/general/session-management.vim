" -------------------------------------------------------------------
" Configure Session Management
" -------------------------------------------------------------------
" Basic configuration
let g:session_directory='~/.config/nvim/sessions'
let g:session_autosave='yes'        " autosave the session on exit
let g:session_autoload='yes'        " autoload the default session if no files are provided
let g:session_autosave_periodic=5   " autosave sessions every x minutes
let g:session_verbose_messages=0    " don't tell me how to disable load / save prompts

" Session contents
set sessionoptions-=help            " Don't persist open help windows
set sessionoptions-=buffers         " Don't persist hidden and unloaded buffers
let g:session_persist_font=0        " Don't persist fonts
let g:session_persist_colors=0      " Don't persist colours (allow theme to manage)

