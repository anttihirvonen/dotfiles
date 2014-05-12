""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load plugins using Pathogen
""""""""""""""""""""""""""""""""""""""""""""""""""""
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()


""""""""""""""""""""""""""""""""""""""""""""""""""""
" General settings
""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set leader key to comma
let mapleader = ","

" Default encoding
set encoding=utf-8

" Sane backup settings, so files aren't scattered around 
" directories
set backup 
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set backupskip=/tmp/*,/private/tmp/* 
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set writebackup

" Add the virtualenv's site-packages to vim path
if has('python')
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""
" User interface
""""""""""""""""""""""""""""""""""""""""""""""""""""
" Apperance
if has('gui_running')
    set background=dark
    colorscheme solarized
else
    set t_Co=256
    set background=dark
    colorscheme solarized
endif 

" Line numbering on
set nu
" Remove toolbar
set guioptions-=T
" set guifont=Inconsolata\ Medium\ 11
set mouse=a
set scrolloff=3

if has("statusline")
     set statusline=%<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
endif

" Allow hiding non-saved buffers
set hidden

" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.class

" Always show status line
set laststatus=2


""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indenting
""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab
" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
" be smart about tabs
set smarttab

" Syntax and file types
filetype plugin indent on
set cindent
syntax on


""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keymaps
""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tasklist
map <Leader>l <Plug>TaskList

" Ctrl-p remap to (,c)
nnoremap <Leader>c :CtrlP<CR>
" Ctrl-p local to current file directory (,cl)
nnoremap <Leader>c, :CtrlP %:p:h<CR>

" NERDTree open
map <F2> :NERDTreeToggle<CR>

" Change VIM's working directory to same as current file (,cd)
" nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>
" Open file relative to current directory
nnoremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
" Open file relative to current directory in split
nnoremap <Leader>s :split <C-R>=expand("%:p:h") . "/" <CR>
" Close buffer
nnoremap <Leader>d :bd<Return>

" Prevent imaps.vim (in vim-latex) mapping <C-j>
nnoremap <SID>I_won’t_ever_type_this <Plug>IMAP_JumpForward

" Autocompletion
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

""""""""""""""""""""""""""""""""""""""""""""""""""""
" Window management / movement / buffers / editing
""""""""""""""""""""""""""""""""""""""""""""""""""""
" map jj to ESC
inoremap jj <ESC>

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Movement between split windows
noremap <C-k> <C-w><Up>
noremap <C-j> <C-w><Down>
noremap <C-l> <C-w><Right>
noremap <C-h> <C-w><Left>

" Switch between window splits using shift-j or shift-k and expand the split to its
" " full size.
" " Move vertically in the window through the horizontal splits...
" noremap <C-J> <C-w>j<C-w>_
" noremap <C-K> <C-w>k<C-w>_

" " Move horizontally in the window through the vertical splits...
" noremap <C-H> <C-w>h<C-w>\|
" noremap <C-L> <C-w>l<C-w>\|

" Switch to next/previous buffer
map <C-n> :bnext<CR>
map <C-p> :bprevious<CR>

" Window shortcuts
" close
map <Leader>wq <C-w>q
" make splits equal
map <Leader>we <C-W>=
" blow out this split vertically
map <Leader>wf <C-W>_

""""""""""""""""""""""""""""""""""
" Language / misc plugin options
""""""""""""""""""""""""""""""""""
" Set different tab settings for javascript / html / handlebars files
autocmd FileType html set ft=htmldjango
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType handlebars setlocal shiftwidth=2 tabstop=2
au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endif 

" PYTHON
" all hilights on 
let python_highlight_all = 1
" no folding
let g:pymode_folding = 0
" no code completion from Rope (replaced
" by YouCompleteMe)
let g:pymode_rope_completion = 0
" Disable pymode's linting (use Syntastic)
" and ROPE (use jedi-vim)
let g:pymode_lint = 0
let g:pymode_rope = 0

" Force UltiSnip to use Python 2.* (otherwise it flips out,
" because Python version checking is buggy)
let g:UltiSnipsUsePythonVersion = 2

" More sane HTML indentation configuration
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" Syntastic settings
" Active mode by default
" disable html active checking, it's slow
let g:syntastic_mode_map = { 'mode': 'active',
            \ 'passive_filetypes': ['html'] }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
" Save classpath to .syntastic_javac_config
let g:syntastic_java_javac_config_file_enabled = 1

" miniBufExplorer settings
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1 

" Ctrlp settings
" Don't mess my buffer change mapping,
" so map ctrlp to <c-b>
let g:ctrlp_map = '<c-b>'

" jedi-vim
let g:jedi#use_tabs_not_buffers = 0
