filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'bronson/vim-visual-star-search'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'vim-scripts/Lucius'
Plugin 'jnurmine/Zenburn'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tell-k/vim-autoflake'

call vundle#end()

set encoding=utf-8
setglobal fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,latin1

"colorscheme lucius
set relativenumber
set cursorline      " highlight current line
set laststatus=2    " always show the statusline
set background=dark
set t_Co=256        " colors!
set mouse=a         " enable mouse
set noswapfile      " no .swp files
set autoread        " detect whether a file has been changed from the outside
set expandtab
set shiftwidth=4    " 4 space shift
set tabstop=4       " 4 space tab
set smarttab
set linebreak       " break long lines
set textwidth=500
set showmatch       " set show matching parenthesis
set hlsearch        " highlight search terms
set incsearch       " incremental search
set softtabstop=4
set autoindent
syntax enable       " enable syntax hl
colors zenburn

let mapleader = ","
let g:mapleader = ","
filetype plugin on

"" plugins
"ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim

"nerdtree
map <leader>n :NERDTreeToggle<CR>
"ack
map <leader>k :Ack!

"" movements
" move a line
nnoremap <C-j> :m+<CR>==
nnoremap <C-k> :m-2<CR>==
inoremap <C-j> <Esc>:m+<CR>==gi
inoremap <C-k> <Esc>:m-2<CR>==gi
vnoremap <C-j> :m'>+<CR>gv=gv
vnoremap <C-k> :m-2<CR>gv=gv

"Tab navigation
map <C-l> :tabnext<CR>
map <C-h> :tabprev<CR>
map <leader>b :tabnew<CR>
map <leader>q :tabclose<CR>

" php-cs-fixer
let g:php_cs_fixer_path                   = "/usr/local/bin/php-cs-fixer"
let g:php_cs_fixer_level                  = "all"                   
let g:php_cs_fixer_config                 = "default"               
let g:php_cs_fixer_php_path               = "php"                   
let g:php_cs_fixer_fixers_list            = ""                      
let g:php_cs_fixer_enable_default_mapping = 1
let g:php_cs_fixer_dry_run                = 0
let g:php_cs_fixer_verbose                = 0
nnoremap <silent><leader>cx :call PhpCsFixerFixFile()<CR>

" replaces arrows with pluses in nerdtree
let g:NERDTreeDirArrows=0

" increases nerdtree sidebar size
let g:NERDTreeWinSize=40

" makes backspace work
set backspace=indent,eol,start

" excludes cache/vendor directories
let g:ctrlp_custom_ignore = '\v[\/]src/cache|src/app/cache|vendors|node_modules|bower_components|__pycache__|\.pyc$'
let g:ctrlp_working_path_mode = ''

" vim-fugitive vertical diff
set diffopt+=vertical

" ipdb shortcut
ab ipdb import ipdb;ipdb.set_trace() # DEBUG
ab pdb import pdb;pdb.set_trace() # DEBUG

let NERDTreeIgnore = ['__pycache__', '\.pyc$']

" Parenthesis highlight
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

vnoremap <Leader>a y:Ack <C-r>=fnameescape(@")<CR>

" python folding
let g:SimpylFold_docstring_preview = 1
autocmd FileType python setlocal foldmethod=indent et cinwords=def,class

" autoflake
let g:autoflake_remove_unused_variables=1
let g:autoflake_remove_all_unused_imports=1
let g:autoflake_disable_show_diff=1
