" Init pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

" Set leader key to comma
let mapleader = ","

" Fuzzy Finder shortcuts
nmap ,f :FufFileWithCurrentBufferDir<CR>
nmap ,b :FufBuffer<CR>
nmap ,t :FufTaggedFile<CR>

" Command-T remap
nnoremap <Leader>c :CommandT<CR>

" Default encoding
set encoding=utf-8
" Allow hiding non-saved buffers
set hidden

" Whitespace
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab

" Syntax and file types
filetype plugin indent on
set cindent
syntax on

" Apperance
if has('gui_running')
    colorscheme molokai
else
    set t_Co=256
    colorscheme molokai
endif 
" Line numbering
set nu
" Remove toolbar
set guioptions-=T
set guifont=Inconsolata\ Medium\ 11
set mouse=a
set scrolloff=3

" Sane backup settings, so files aren't scattered around 
" directories
set backup 
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set backupskip=/tmp/*,/private/tmp/* 
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set writebackup

" WINDOW SETTINGS
" Movement between split windows
noremap <C-k> <C-w><Up>
noremap <C-j> <C-w><Down>
noremap <C-l> <C-w><Right>
noremap <C-h> <C-w><Left>

" Switch between window splits using big J or K and expand the split to its
" " full size.
" " Move vertically in the window through the horizontal splits...
noremap <C-J> <C-w>j<C-w>_
noremap <C-K> <C-w>k<C-w>_

" " Move horizontally in the window through the vertical splits...
noremap <C-H> <C-w>h<C-w>\|
noremap <C-L> <C-w>l<C-w>\|

" Switch to next/previous buffer
map <C-Tab> :bnext<CR>
map <C-S-Tab> :bprevious<CR>

" Window shortcuts
" close
map <Leader>wq <C-w>q
" make splits equal
map <Leader>we <C-W>=
" blow out this split vertically
map <Leader>wf <C-W>_

" TASKLIST
map <Leader>l <Plug>TaskList

" miniBufExplorer settings
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1 

""""""""""""""""""""""""""""""""""
" LANGUAGE OPTIONS
""""""""""""""""""""""""""""""""""
" all hilights on 
let python_highlight_all = 1
let g:pymode_folding = 0

map <S-Tab> :bnext<cr>
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

map <F2> :NERDTreeToggle<CR>
if has("statusline")
     set statusline=%<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
 endif

let g:UltiSnipsUsePythonVersion = 2

autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
