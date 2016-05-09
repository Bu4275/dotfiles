
"  _____            _                                      _   
" | ____|_ ____   _(_)_ __ ___  _ __  _ __ ___   ___ _ __ | |_ 
" |  _| | '_ \ \ / / | '__/ _ \| '_ \| '_ ` _ \ / _ \ '_ \| __|
" | |___| | | \ V /| | | | (_) | | | | | | | | |  __/ | | | |_ 
" |_____|_| |_|\_/ |_|_|  \___/|_| |_|_| |_| |_|\___|_| |_|\__|
" Ascii Font: Ogre

if has('vim_starting')
    set nocompatible
    if has('win32')
        set runtimepath+=%UserProfile%\vimfiles/bundle/neobundle.vim/
    else
        set runtimepath+=~/.vim/bundle/neobundle.vim/
    endif
endif

let NeoBundle_readme=expand('~/.vim/bundle/neobundle.vim/README.md')
if !filereadable(NeoBundle_readme)
    echo "Installing NeoBundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" File Management
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'jistr/vim-nerdtree-tabs' "Dependencies: apt-get install ctags

" Syntax
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'hdima/python-syntax'
NeoBundle 'jgb/django.vim'

" Programing
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'ervandew/supertab'
NeoBundle 'vim-scripts/python_match.vim'
NeoBundle 'davidhalter/jedi-vim' "python complete

NeoBundle "flazz/vim-colorschemes"
NeoBundle 'tomasr/molokai'

filetype plugin indent on     " Required!
call neobundle#end()
NeoBundleCheck


"    __                         _   
"   / /  __ _ _   _  ___  _   _| |_ 
"  / /  / _` | | | |/ _ \| | | | __|
" / /__| (_| | |_| | (_) | |_| | |_ 
" \____/\__,_|\__, |\___/ \__,_|\__|
"             |___/                       

set number
set laststatus=2
set wildmenu
set scrolloff=5

" Tab options
set shiftwidth=4  
set softtabstop=4
set expandtab
set tabstop=4  

" Color
syntax on
set bg=dark
set t_Co=256
colorscheme obsidian
"let g:rehash256 = 1
"color molokai

" Searching
set hlsearch
set incsearch
set smartcase

" Config
set nobackup
set noswapfile
set nowritebackup

" Status bar
set ls=2
set statusline=%<%f\ %m%=\ %h%r\ %-19([%p%%]\ %3l,%02c%03V%)%y
highlight StatusLine term=bold,reverse cterm=bold,reverse

"    _           _                                 _ 
"   /_\   _   _ | |_   ___     ___  _ __ ___    __| |
"  //_\\ | | | || __| / _ \   / __|| '_ ` _ \  / _` |
" /  _  \| |_| || |_ | (_) | | (__ | | | | | || (_| |
" \_/ \_/ \__,_| \__| \___/   \___||_| |_| |_| \__,_|                                                   

" File Type
autocmd FileType python setlocal et sta sw=4 sts=4 cc=80 completeopt-=preview
autocmd FileType ruby setlocal noet sta sw=4 sts=4
autocmd FileType html setlocal et sw=2 sts=2
autocmd FileType css setlocal et sw=2 sts=2
autocmd FileType scss setlocal et sw=2 sts=2

" File header
autocmd BufNewFile *.py 0put =\"#!/usr/bin/python\<nl>\"|$
autocmd BufNewFile *.py 1put =\"# -*- coding: utf-8 -*-\<nl>\"|$

" Execution
autocmd filetype c          nnoremap <leader>r :w <bar> exec '!gcc '.shellescape('%').' -O2 && ./a.out'<CR>
autocmd filetype shell      nnoremap <leader>r :w <bar> exec '!bash '.shellescape('%') <CR>
autocmd filetype python     nnoremap <leader>r :w <bar> exec '!python2 '.shellescape('%')<CR>

augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

"  _  __                                        _             
" | |/ /___ _   _   _ __ ___   __ _ _ __  _ __ (_)_ __   __ _ 
" | ' // _ \ | | | | '_ ` _ \ / _` | '_ \| '_ \| | '_ \ / _` |
" | . \  __/ |_| | | | | | | | (_| | |_) | |_) | | | | | (_| |
" |_|\_\___|\__, | |_| |_| |_|\__,_| .__/| .__/|_|_| |_|\__, |
"           |___/                  |_|   |_|            |___/ 

"shortcut
set path=.,**
nmap <C-k> :tabn<CR>
nmap <C-j> :tabp<CR>
nmap <C-o> :tabe ./<CR>
nmap gb :ls<CR>:b<Space>
nmap gn :bn<CR>
nmap gp :bp<CR>

" Easier window navigation
map <C-h> <C-w>h
map <C-l> <C-w>l

" list cursor word in current file, <leader> default is "\"
nmap <leader>lv :lv /<c-r>=expand("<cword>")<cr>/ %<cr>:lw<cr> 

" copy-paste mode change
nmap <F3> :set nonu<CR>:set paste<CR>:IndentLinesToggle<CR>
nmap <F4> :set nu<CR>:set nopaste<CR>:IndentLinesToggle<CR>

" highlight current line, type 'l to jump it
:nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>
" \c will togle highlighting on and off
:nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

"  ____                  _ _                 _   
" | __ ) _   _ _ __   __| | | ___   ___  ___| |_ 
" |  _ \| | | | '_ \ / _` | |/ _ \ / __|/ _ \ __|
" | |_) | |_| | | | | (_| | |  __/ \__ \  __/ |_ 
" |____/ \__,_|_| |_|\__,_|_|\___| |___/\___|\__|

" NERDTree
map <F5> :silent!<Space>NERDTreeToggle<CR>
let g:nerdtree_tabs_open_on_console_startup=0

" SuperTab
let g:SuperTabDefaultCompletionType = "<c-n>"

