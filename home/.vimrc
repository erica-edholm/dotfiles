set runtimepath+=~/.vim_runtime
set guifont=Font\ Awesome\ 13

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

silent! iunmap
silent! iunmap ä
silent! iunmap ö
let g:AutoPairsShortcutFastWrap=''

try
source ~/.vim_runtime/my_configs.vim
catch
endtry
