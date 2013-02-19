set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'itspriddle/vim-jquery'
Bundle 'bronson/vim-visual-star-search'
Bundle 'vim-scripts/Align'
Bundle 'vim-scripts/phpfolding.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'vim-scripts/taglist.vim'
"FuzzyFinder requirement
Bundle 'vim-scripts/L9' 
Bundle 'vim-scripts/matchit.zip'
Bundle 'vim-scripts/AutoComplPop'
Bundle 'vim-scripts/Lucius'
Bundle 'stephpy/vim-php-cs-fixer'
Bundle 'rocdose/easybuffer.vim'

colorscheme lucius
set relativenumber
set cursorline      " highlight current line
set laststatus=2    " always show the statusline
syntax enable       " enable syntax hl
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
set cindent
set showmatch       " set show matching parenthesis
set hlsearch        " highlight search terms
set incsearch       " incremental search

let mapleader = ","
let g:mapleader = ","
filetype plugin on  
filetype indent on

"" plugins
"ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim
"opens new tab
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }

"nerdtree
map <leader>n :NERDTreeToggle<CR>
"ack
map <leader>k :Ack
"taglist
map <leader>ll :TlistToggle<CR>
let Tlist_Use_Right_Window = 1
"xdebug
let g:debuggerMaxDepth = 2
"fuzzyfinder
map <leader>f :EasyBuffer<CR>



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

imap <D-V> ^O"+p"

" php-cs-fixer
let g:php_cs_fixer_path                   = "/usr/local/bin/php-cs-fixer"
let g:php_cs_fixer_level                  = "all"                   
let g:php_cs_fixer_config                 = "default"               
let g:php_cs_fixer_php_path               = "php"                   
let g:php_cs_fixer_fixers_list            = ""                      
let g:php_cs_fixer_enable_default_mapping = 1
let g:php_cs_fixer_dry_run                = 0
let g:php_cs_fixer_verbose                = 0

" replaces arrows with pluses in nerdtree
let g:NERDTreeDirArrows=0

" increases nerdtree sidebar size
let g:NERDTreeWinSize=40

" makes backspace work
set backspace=indent,eol,start

" excludes symfony1 cache dir
let g:ctrlp_custom_ignore = '\v[\/]src/cache$'

" template files
" highlight template file keywords
function! LoadTemplate()
    silent! 0r ~/.vim/template/template.%:e
    syn match Todo "%\u\+%" containedIn=ALL
endfunction
autocmd! BufNewFile * call LoadTemplate()
