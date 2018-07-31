"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: 
"   Steven Aanen
"
"   Many things stolen from:
"     https://github.com/amix/vimrc
"     https://github.com/tpope/vim-sensible
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins (vim-plug)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes

" colorscheme
Plug 'morhetz/gruvbox'

" vue file support
Plug 'posva/vim-vue'

" git support
Plug 'tpope/vim-fugitive'

" status bar
Plug 'vim-airline/vim-airline'

call plug#end()

" usage: https://github.com/junegunn/vim-plug

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => System basics
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf8

" auto reload file when changed from outside; undo with `u`
set autoread

if &history < 1000
  set history=1000
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Searching
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set x lines to the cursor - when moving vertically using j/k
set scrolloff=3
set display+=lastline

set number

" Height of the command bar
" set cmdheight=2

set ruler


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable true colors in iTerm (not just 256)
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

colorscheme gruvbox
set background=dark


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('autocmd')
  filetype plugin indent on
endif

" Use spaces instead of tabs
" set expandtab

set autoindent
set backspace=indent,eol,start
set smarttab
set complete-=i

" 1 tab == 4 spaces
set shiftwidth=2
set tabstop=2

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move a line of text using ALT+[jk]
" nmap <M-j> mz:m+<cr>`z
" nmap <M-k> mz:m-2<cr>`z
" vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
" vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Disable arrow keys (for faster learning)
no <down> <Nop>
no <left> <Nop>
no <right> <Nop>
no <up> <Nop>
ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

