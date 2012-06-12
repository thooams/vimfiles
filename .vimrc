let g:pathogen_disabled = ['javascript']

" pathogen initialization
call pathogen#infect()

" no vi compatibility
set nocompatible

" remap leader key
let mapleader=","

" filetype detection an syntax highlighting
filetype plugin indent on
syntax on

" encoding
set encoding=utf-8

" Turn off backup and swp files
set nobackup
set nowritebackup
set noswapfile

" molokai theme for macvim and vim
" color molokai
color Tomorrow-Night
set t_Co=256

" Indentation
set autoindent
set smartindent

" don't wrap lines
set nowrap

" numbering
set number

" Allow undoing after quitting
set undodir=~/.vim/undodir
set undofile
set undolevels=1000


" highlight current line
set cursorline

" autocomplete menu in commands
set wildmenu
set wildmode=list:longest

" Always show status
set laststatus=2

" Remove trailing spaces
autocmd BufWritePre * :%s/\s\+$//e

" allow backgrounding buffer without saving them
set hidden

" Better interface when using c(hange) macros
set cpoptions=B$

" configure tabs
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs

" invisibles
set list                          " Show invisible characters
set listchars=""
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:·            " show trailing spaces as middle dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the scree

" configure ctrlp
let g:ctrlp_map = '<c-p>'                      " keyboard shortcur
let g:ctrlp_working_path_mode = 2              " set the working dir at  the nearest ancestor that contains .git
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*.so " ignore some files
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files'] " use git to list files (faster)
" Make it easier to complete buffers, open files, etc...

" Desactivate Ex-mode
map Q <Nop>

" Don't use thats nasty arrows
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap j gj
nnoremap k gk

inoremap jj <ESC>

" better navigation in splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Make searches case-sensitive only if they contain upper-case characters
set ignorecase
set smartcase

" desactivate sounds
set visualbell

" better terminal experience
set ttyfast

" start scroll 3 lines before the top (or bottom)
set scrolloff=3

" configure search
nnoremap / /\v
vnoremap / /\v
set gdefault
set incsearch
set showmatch
set hlsearch

" Change cursor shape in insert mode in iTerm2
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Hammer configuration
map <leader>c :Hammer<CR>

set backspace=2
set backspace=indent,eol,start

" Switch from last two buffers
nnoremap <leader><leader> <c-^>

" Activate ruby code folding
set foldmethod=syntax
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

" Accelerate autocompletion on large projects
set foldmethod=manual

" Faster scrolling
set ttyfast
set showcmd
set lazyredraw

" Hide mouse when typing
set mousehide

" Allow the cursor to go in to "invalid" places
set virtualedit=all

" Text width to 80 characters
set textwidth=80

" Use the bufkill plugin to eliminate a buffer but keep the window layout
nmap ,bd :BD<cr>

"Automate tabularization of cucumber features
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" TagList configuration
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50
map <F4> :TlistToggle<cr>
let Tlist_Process_File_Always = 1

" Paste mode
set pastetoggle=<F2>

" :W write the file as :w
command! W :w

" Enable mouse scrolling
set mouse=a
set ttymouse=xterm

" nerd tree at start
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <F2> :NERDTreeToggle<CR>


