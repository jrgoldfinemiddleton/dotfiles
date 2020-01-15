""""""""""""""
""" .vimrc """
""""""""""""""

""" BASIC SETTINGS """

set nocompatible
set modifiable
set nobackup
set autoindent
set autoread
set hidden
set confirm

set encoding=utf-8
set number relativenumber
set cursorline
set nostartofline
set textwidth=0
set breakindent showbreak=..
set display=truncate

" Text search highlighting
set hlsearch

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Command history
set history=1000

" Completion settings
set wildmenu wildmode=longest,list,full

" Indentation baseline
set expandtab           " expand tabs to spaces by default
set tabstop=4           " four spaces per tab
set softtabstop=4       " backspace removes a tab's worth
set shiftwidth=4        " number of spaces for autoindent
set shiftround          " use multiple of shiftwidth with '<' and '>'

" Jump to matching parenthesis/brace for half a second
set showmatch matchtime=5

" Disable bells
set noerrorbells visualbell t_vb=

" Show current command
set showcmd


""" MOUSE SETTINGS """

set mouse=a


""" FILE TYPES """

syntax on
filetype plugin indent on


""" PLUGINS """

" Load plugins using vim-plug
call plug#begin()

Plug 'flazz/vim-colorschemes'

Plug 'pearofducks/ansible-vim'

Plug 'tpope/vim-fugitive'
"Plug 'tpop/vim-obsession'
Plug 'tpope/vim-sensible'
"Plug 'tpope/vim-sleuth'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()


""" FUNCTIONS """

" Switch between showing relative or absolute line numbers
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
    set number
    echo ':set number'
  else
    set relativenumber
    set number
    echo ':set relativenumber'
  endif
endfunc


""" CUSTOM KEYBINDINGS """

" Set spacebar as leader key
let mapleader = "\<space>"

" Forgot to use sudo?
cnoremap w!! %!sudo tee > /dev/null %

" Smash escape
inoremap jk <esc>

" Move across buffers
nnoremap <silent><leader><left> :bprev<cr>
nnoremap <silent><leader><right> :bnext<cr>

" Unhighlight after a text search
nnoremap <silent><leader><space> :nohlsearch<cr>

" Delete the current file and exit buffer (DANGEROUS)
"nnoremap <leader>del :call delete(expand('%')) \| bdelete!<cr>

nmap <silent><leader>n :call NumberToggle()<cr>

" Enable PASTE mode
:map <leader>p :set paste<CR>


""" LANGUAGES """

augroup configgroup
  autocmd!
  " rst
  autocmd BufNewFile,BufRead *.txt setlocal ft=rst
  autocmd FileType rst setlocal wrap nolist expandtab lbr shiftwidth=4 tabstop=4
        \ softtabstop=4 formatoptions+=nqtl
  " markdown
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd FileType markdown setlocal wrap nolist expandtab lbr shiftwidth=4 tabstop=4
        \ softtabstop=4 formatoptions+=nqtl
  " yaml
  autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2
  " shell
  autocmd FileType sh setlocal shiftwidth=2 tabstop=2 softtabstop=2
  " vim
  autocmd FileType vim setlocal shiftwidth=2 tabstop=2 softtabstop=2
  " javascript
  autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 softtabstop=4
  " commit messages
  autocmd Filetype gitcommit setlocal nolist textwidth=72
augroup END


""" COOL TRICKS """

" Automatically source vimrc file after saving it
autocmd bufwritepost .vimrc source $MYVIMRC


""" VISUAL SETTINGS """

set t_Co=256
silent! colorscheme molokai
let g:airline_theme='solarized_flood'
let g:airline_solarized_bg='dark'

" Show trailing whitespace (must be set after colorscheme)
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Use different cursor style in INSERT mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail_improved'

" vim:set ft=vim et sw=2:
