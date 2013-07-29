"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:pathogen_disabled = ['javascript']

" pathogen initialization
call pathogen#infect()

" Mapping bépo
" source ~/Apps/vimfiles/.vimrc.bepo

" no vi compatibility
set nocompatible

" bépo -> qwerty ergonomie
source ~/Apps/vimfiles/.vimrc.bepo

" filetype detection an syntax highlighting
filetype plugin indent on
syntax on

" Use Unix as the standard file type
set ffs=unix,dos,mac

" encoding
set encoding=utf-8
set fileencoding=utf-8

" Turn off backup and swp files
set nobackup
set nowritebackup
set noswapfile

" Accelerate autocompletion on large projects
set foldmethod=manual
" don't wrap lines
set nowrap

" numbering
set number

" Allow undoing after quitting
set undodir=~/.vim/undodir
set undofile
set undolevels=1000

" desactivate sounds
set visualbell

" add powerline display
" let g:Powerline_symbols = 'fancy'

" Disable flash and beep
set noeb vb t_vb=



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

" Paste mode
set pastetoggle=<F2>

" Enable mouse scrolling
set mouse=a
set ttymouse=xterm

" Make searches case-sensitive only if they contain upper-case characters
set ignorecase
set smartcase

" better terminal experience
set ttyfast

" start scroll 3 lines before the top (or bottom)
set scrolloff=3

" Change cursor shape in insert mode in iTerm2
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

set backspace=2
set backspace=indent,eol,start

" Switch from last two buffers
" nnoremap <leader><leader> <c-^>
" Activate ruby code folding
set foldmethod=syntax
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

" Faster scrolling
set showcmd
set lazyredraw

" Hide mouse when typing
set mousehide

" Allow the cursor to go in to "invalid" places
set virtualedit=all


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" configure tabs
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs

" invisibles
set list                          " Show invisible characters
set listchars=""                  " Reset the listchars
set listchars+=tab:\|\            " a tab should display as ' ', trailing whitespace as '.'
set listchars+=trail:·            " show trailing spaces as middle dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the scree

" Indentation
set autoindent
set smartindent
set backspace=2
set backspace=indent,eol,start

" Text width to 80 characters
set textwidth=80

"Automate tabularization of cucumber features
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

" map tab
noremap è' :tabnew<CR>
noremap èx :tabclose<CR>
noremap èr :tabnext<CR>
noremap èc :tabprevious<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" configure search
set gdefault
set incsearch
set showmatch
set hlsearch

" Search word under cursor in current dir
:let Grep_Skip_Dirs = '.git tmp public/system doc .yardoc log'
:let Grep_Skip_Files = '*.bak *~ tags Session.vim'
nnoremap <C-f> :Rgrep<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tomorrow theme
color Tomorrow-Night
set t_Co=256

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" highlight current line
set cursorline

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Remove arrow to learn vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Normal mode
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" Insert mode
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerdtree configuration
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
noremap <f5> :NERDTreeToggle<CR>

" TagList configuration
if system("uname") == "Darwin\n"
  let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
else
  let Tlist_Ctags_Cmd = "/usr/bin/ctags"
endif
set tags=tag
let Tlist_WinWidth = 50
noremap <f6> :TlistToggle<cr>
let Tlist_Process_File_Always = 1

" Ctrlp configuration
let g:ctrlp_map = '<c-p>'                      " keyboard shortcur
let g:ctrlp_working_path_mode = 2              " set the working dir at  the nearest ancestor that contains .git
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*.so/*,*/doc/* " ignore some files
"let g:ctrlp_custom_ignore = '\v[\/](\.(git|hg|svn)|doc)$'
let g:ctrlp_custom_ignore = '.git\|hg\|svn\|doc'
"let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files'] " use git to list files (faster)
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files | grep -v doc'] " use git to list files (faster) except => doc
set wildignorecase

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Cucumber align
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

if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif


" Tabularize
let mapleader=','
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

