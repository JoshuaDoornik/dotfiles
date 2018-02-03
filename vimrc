"" Plug plugins
" [PlugInstall] [PlugClean]
call plug#begin('~/.vim/plugged')

if executable('fzf')
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
else
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'FelikZ/ctrlp-py-matcher'
endif
call plug#end()

set tabstop=4 shiftwidth=4 expandtab
autocmd FileType markdown setlocal spell spelllang=en_us
execute pathogen#infect()

if executable('fzf')
    nnoremap <C-p> :FZF -m<cr>

    if executable('ag')
        let $FZF_DEFAULT_COMMAND = 'ag -l --hidden -U -g "" --ignore ".git"'
    endif
else
    " CtrlP
    let g:ctrlp_cmd = 'CtrlP'
    let g:ctrlp_working_path_mode = 'ra'

    " CtrlP perfomance improvements are awesome
    let g:ctrlp_match_func = {'match': 'pymatcher#PyMatch'}
    let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
    let g:ctrlp_clear_cache_on_exit = 0
    " Use ag over grep
    if executable("ag")
        set grepprg=ag\ --nogroup\ --nocolor
        let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    endif
endif
