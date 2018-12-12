syntax on
set encoding=utf-8
set background=dark
set ruler                     " show the line number on the bar
set more                      " use more prompt
set autoread                  " watch for file changes
set number                    " line numbers
set hidden
set backspace=2               " Make backspace work normally
set noautowrite               " don't automagically write on :next
set showmode
set showcmd
set nocompatible              " vim, not vi
set autoindent smartindent    " auto/smart indent
set smarttab                  " tab and backspace are smart
set shiftwidth=4
set softtabstop=4
set expandtab                 " Spaces, not tabs
set scrolloff=5               " keep at least 5 lines above/below
set sidescrolloff=5           " keep at least 5 lines left/right
set history=200
set backspace=indent,eol,start
set linebreak
set undolevels=1000           " 1000 undos
set updatecount=100           " switch every 100 chars
set complete=.,w,b,u,U,t,i,d  " do lots of scanning on tab completion
set ttyfast                   " we have a fast terminal
set noerrorbells              " No error bells please
set shell=bash
set fileformats=unix
set ff=unix
filetype on                   " Enable filetype detection
filetype indent on            " Enable filetype-specific indenting
filetype plugin on            " Enable filetype-specific plugins
set wildmode=longest:full
set wildmenu                  " menu has tab completion
set laststatus=2
set cursorline                " Highlights current line
hi CursorLine term=none cterm=none ctermbg=DarkGray

" Colors column 80
set cc=80
:hi ColorColumn ctermbg=blue guibg=blue

" Highlights trailing whitespace
:highlight ExtraWhitespace ctermbg=red guibg=red
call matchadd('ExtraWhitespace', '\s\+$')
" Highlights tabs
:highlight Tabs ctermbg=yellow guibg=yellow
call matchadd('Tabs', '\t')
" Highlights all over 80
highlight OverLength ctermbg=blue guibg=blue
call matchadd('OverLength', '\%>80v.\+')

"  searching
set incsearch                 " incremental search
set ignorecase                " search ignoring case
set hlsearch                  " highlight the search
set showmatch                 " show matching bracket
set diffopt=filler,iwhite     " ignore all whitespace and sync

" Press f2 to paste without indent
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" For js lint highlighting
let $JS_CMD='node'
" For powerline bar
let g:Powerline_symbols = 'fancy'

" Runs flake8 on write
autocmd BufWritePost *.py call Flake8()

" Uses tornado template
autocmd BufNewFile,BufRead *.template setfiletype html.tornadotmpl

" Use a custom yaml colorer to avoid slow one
au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/syntax/yaml.vim
