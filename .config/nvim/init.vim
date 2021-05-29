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
" usage: https://github.com/junegunn/vim-plug
"
call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes

" colorscheme
Plug 'morhetz/gruvbox'

" vue file support
Plug 'posva/vim-vue'

" git support
Plug 'tpope/vim-fugitive'

" terraform files
Plug 'hashivim/vim-terraform'

" typescript support
Plug 'leafgarland/typescript-vim'

" status bar
Plug 'vim-airline/vim-airline'

" editorconfig support
Plug 'editorconfig/editorconfig-vim'

" visual file tree
Plug 'scrooloose/nerdtree'

" fuzzy file & buffer switching
Plug 'ctrlpvim/ctrlp.vim'

" surround blocks with things
Plug 'tpope/vim-surround'

" prettier support
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move a line of text using ALT+[jk]
" nmap <M-j> mz:m+<cr>`z
" nmap <M-k> mz:m-2<cr>`z
" vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
" vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" use space as leader key for custom shortcuts
let mapleader="\<space>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" nerdtree plugin keymapping
nmap <leader>n :NERDTreeToggle<cr>
" auto close nerdtree on last file close
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" show dotfiles
let NERDTreeShowHidden=1

" ctrl+p keymapping
" Use a leader instead of the actual named binding
nmap <leader>p :CtrlP<cr>

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>br :CtrlPMRU<cr>
" for ctrlp_nerdtree
let g:ctrlp_nerdtree_show_hidden = 1

" editorconfig don't autowrap
let g:EditorConfig_disable_rules = ['max_line_length']

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

" show open buffers in command line
" let g:airline#extensions#tabline#enabled = 1

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

set autoindent
set backspace=indent,eol,start
set complete-=i

set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
set shiftwidth=2    " Indents will have a width of 4
set softtabstop=4   " Sets the number of columns for a TAB in insert mode
set expandtab       " Expand TABs to spaces
set smarttab        " When in insert on newline, go to first tabstop on TAB
set list            " Visualize tabs

set ai              "Auto indent
set si              "Smart indent
set wrap            "Wrap lines



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

