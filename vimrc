" enable secure project specific .vimrc
set exrc
set secure

" set indentation
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

" enable line numbering
set number

" other options
set textwidth=0


" enable syntax highlight
syntax on

" buffer switch aliases
map <F2> :ls<CR>
map <F3> :bprevious<CR>
map <F4> :bnext<CR>

set shiftround      " use multiple of shiftwidth when indenting with '<' and '>'
 
set showcmd         " Show (partial) command in status line.

set number          " Show line numbers.

set showmatch       " When a bracket is inserted, briefly jump to the matching
                    " one. The jump is only done if the match can be seen on the
                    " screen. The time to show the match can be set with
                    " 'matchtime'.
set matchtime=3
 
set hlsearch        " When there is a previous search pattern, highlight all
                    " its matches.
 
set incsearch       " While typing a search command, show immediately where the
                    " so far typed pattern matches.
 
set ignorecase      " Ignore case in search patterns.
 
set smartcase       " Override the 'ignorecase' option if the search pattern
                    " contains upper case characters.
 
set backspace=2     " Influences the working of <BS>, <Del>, CTRL-W
                    " and CTRL-U in Insert mode. This is a list of items,
                    " separated by commas. Each item allows a way to backspace
                    " over something.
 
set autoindent      " Copy indent from current line when starting a new line
                    " (typing <CR> in Insert mode or when using the "o" or "O"
                    " command).
 
set formatoptions=c,q,r,t " This is a sequence of letters which describes how
                    " automatic formatting is to be done.
                    "
                    " letter    meaning when present in 'formatoptions'
                    " ------    ---------------------------------------
                    " c         Auto-wrap comments using textwidth, inserting
                    "           the current comment leader automatically.
                    " q         Allow formatting of comments with "gq".
                    " r         Automatically insert the current comment leader
                    "           after hitting <Enter> in Insert mode. 
                    " t         Auto-wrap text using textwidth (does not apply
                    "           to comments)
 
set noruler           " Show the line and column number of the cursor position,
                    " separated by a comma.
set laststatus=2


set background=dark " When set to "dark", Vim will try to use colors that look
                    " good on a dark background. When set to "light", Vim will
                    " try to use colors that look good on a light background.
                    " Any other value is illegal.
 
set mouse=a         " Enable the use of the mouse.

set wildmenu        " Enable autocompletion menu for vim commands.

set novisualbell    " Disable audible bell

set hidden          " Buffers behaviour resembles tabs in other editors"

set foldmethod=syntax "folds functions based on syntax
set foldlevelstart=99 "turns off folding by default



" backup to ~/.tmp 
set backup 
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set backupskip=/tmp/*,/private/tmp/* 
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set writebackup


" AIRLINE

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
" let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:syntastic_c_check_header = 1
let g:syntastic_cpp_check_header = 1

let delimitMate_expand_space = 1
let delimitMate_expand_cr = 1

let g:solarized_termcolors=256

colorscheme evening
if has( 'gui_running' ) 
    set guioptions=i
    set guifont=Inconsolata-g\ for\ Powerline\ 10
    set guifont=Inconsolata\ 10.5
else
    let g:Powerline_symbols = 'unicode'
endif

filetype plugin indent on
syntax on

map <F9> :w<CR>:!make run<CR>
map <silent> <S-Insert> "+p
imap <silent> <S-Insert> <Esc>"+pa

execute pathogen#infect()

set conceallevel=2
set concealcursor=vin
let g:clang_snippets=1
let g:clang_conceal_snippets=1
let g:clang_snippets_engine='clang_complete'

" Complete options (disable preview scratch window, longest removed to aways show menu)
set completeopt=menu,menuone

" Limit popup menu height
set pumheight=20

let loaded_minibufexplorer = 1

set t_Co=256

let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11'
