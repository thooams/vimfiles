" -----------------------------------------------
" Plugins Section -------------------------------
" -----------------------------------------------

call plug#begin('~/.config/nvim/plugged')

" Git Helpers
" Use git in vim, :Gedit, :Gsplit, :Gstatus
Plug 'git@github.com:tpope/vim-fugitive.git'
" Show modified lines
Plug 'git@github.com:airblade/vim-gitgutter.git'
" Nerdtree with git
Plug 'git@github.com:Xuyuanp/nerdtree-git-plugin.git'

Plug 'git@github.com:ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'

" Resizing windows
" Plug 'git@github.com:simeji/winresizer.git'

" Color sheme
"Plug 'git@github.com:chriskempson/vim-tomorrow-theme.git'
"Plug 'trusktr/seti.vim'
Plug 'joshdick/onedark.vim'
"Plug 'mhartington/oceanic-next'

" Utils
" Fuzzy search file with crtrl + p
" Plug 'git@github.com:ctrlpvim/ctrlp.vim.git'
" Add end with def method
Plug 'git@github.com:tpope/vim-endwise.git'
" Search with grep
Plug 'git@github.com:mileszs/ack.vim.git'
" Autocomplete line with tab
Plug 'git@github.com:ervandew/supertab.git'
" Remove empty window
Plug 'git@github.com:duff/vim-scratch.git'
" allows you to configure % to match more than just single character
Plug 'git@github.com:tmhedberg/matchit.git'
Plug 'git@github.com:tpope/vim-surround.git'
Plug 'git@github.com:godlygeek/tabular.git'
Plug 'git@github.com:vim-scripts/taglist.vim.git'
Plug 'git@github.com:rorymckinley/vim-symbols-strings.git'
Plug 'git@github.com:scrooloose/nerdtree.git'
Plug 'dense-analysis/ale'
Plug 'git@github.com:scrooloose/nerdcommenter.git'
" Plug 'git@github.com:scrooloose/syntastic.git'
"This plug-in provides automatic closing of quotes, parenthesis, brackets, etc.,
Plug 'git@github.com:Raimondi/delimitMate.git'
Plug 'git@github.com:majutsushi/tagbar.git'
Plug 'git@github.com:vim-scripts/grep.vim.git'
Plug 'git@github.com:jistr/vim-nerdtree-tabs.git'
" Open/close nerdtree node with l and h
Plug 'flw-cn/vim-nerdtree-l-open-h-close'
Plug 'git@github.com:tpope/vim-sensible.git'
Plug 'git@github.com:vim-scripts/tComment.git'
Plug 'git@github.com:tpope/vim-eunuch.git'
Plug 'git@github.com:bling/vim-airline.git'
Plug 'vim-airline/vim-airline-themes'
Plug 'git@github.com:chrisbra/Colorizer.git'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
" optional for icon support
Plug 'kyazdani42/nvim-web-devicons'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'git@github.com:github/copilot.vim'

" cmus remote control
Plug 'azadkuh/vim-cmus'

" Sticky Scroll : https://github.com/nvim-treesitter/nvim-treesitter-context
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'

Plug 'nvim-lua/plenary.nvim'
" telescope.nvim is a highly extendable fuzzy finder over lists. Built on the latest awesome features from neovim core. Telescope is centered around modularity, allowing for easy customization.
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }


call plug#end()

" -----------------------------------------------
" General Section -------------------------------
" -----------------------------------------------

" no vi compatibility
set nocompatible

let mapleader=","

" diplaying file name in title window
set title

" Use Unix as the standard file type
set ffs=unix,dos,mac

" encoding
set encoding=UTF-8
set fileencoding=UTF-8

" Turn off backup and swp files
set nobackup
set nowritebackup
set noswapfile

" Accelerate autocompletion on large projects
" set foldmethod=manual

" don't wrap lines
" set nowrap

" numbering
set number

" desactivate sounds
set visualbell

" Disable flash and beep
set noeb vb t_vb=
au GUIEnter * set vb t_vb=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NeoVIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('nvim')
  set inccommand=split
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NeoVIM ALE configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set this variable to 1 to fix files when you save them.
" let g:ale_fix_on_save = 1
let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_ruby_rubocop_options = '-c rubocop.yml'
let g:ale_completion_enabled = 0
" let g:ale_linters_explicit = 1
" set omnifunc=ale#completion#OmniFunc
set omnifunc=syntaxcomplete#Complete

set completeopt=menu,menuone,preview,noselect,noinsert

let g:ale_completion_symbols = {'text': '', 'method': '', 'function': '', 'constructor': '', 'field': '', 'variable': '', 'class': '', 'interface': '', 'module': '', 'property': '', 'unit': 'unit', 'value': 'val', 'enum': '', 'keyword': 'keyword', 'snippet': '', 'color': 'color', 'file': '', 'reference': 'ref', 'folder': '', 'enum member': '', 'constant': '', 'struct': '', 'event': 'event', 'operator': '', 'type_parameter': 'type param', '<default>': 'v'}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Always show status
set laststatus=2

" Remove trailing spaces
autocmd BufWritePre * :%s/\s\+$//e

" Better interface when using c(hange) macros
set cpoptions=B$

" Enable mouse scrolling
set mouse=a
"set ttymouse=xterm

" Make searches case-sensitive only if they contain upper-case characters
set noignorecase
set smartcase

" better terminal experience
set ttyfast

" start scroll 3 lines before the top (or bottom)
set scrolloff=3

" Faster scrolling
set showcmd
set lazyredraw

" Hide mouse when typing
set mousehide

" Allow the cursor to go in to 'invalid' places
set virtualedit=all

" set clipboard
set clipboard+=unnamedplus
" let g:loaded_clipboard_provider = 1

" Add spell orthographe
map <F9> :setlocal spell! spelllang=en<CR>


" Icons
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:WebDevIconsNerdTreeGitPluginForceVAlign=0
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:webdevicons_enable_ctrlp = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_airline_tabline = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" configure tabs
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set smarttab

" invisibles
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<,space:␣

" Indentation
set autoindent
set smartindent
set backspace=2
set backspace=indent,eol,start

" Text width to 80 characters
set textwidth=80

" Wrap/break line
set colorcolumn=+1
highlight ColorColumn ctermbg=lightgrey guibg=lightgrey

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Coc - Make your Vim/Neovim as smart as VSCode.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Better display for messages
" set cmdheight=2
"
" " You will have bad experience for diagnostic messages when it's default 4000.
" set updatetime=300
"
" " don't give |ins-completion-menu| messages.
" set shortmess+=c
"
" " always show signcolumns
" set signcolumn=yes
"
" " Use tab for trigger completion with characters ahead and navigate.
" " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
" " inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
"
" " Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()
"
" " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" " Coc only does snippet and additional edit on confirm.
" "inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" " Or use `complete_info` if your vim support it, like:
" " inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
"
" " Use `[g` and `]g` to navigate diagnostics
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)
"
" " Remap keys for gotos
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
"
" " Use K to show documentation in preview window
" nnoremap <silent> K :call <SID>show_documentation()<CR>
"
" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction
"
" " Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')
"
" " Remap for rename current word
" nmap <leader>rn <Plug>(coc-rename)
"
" " Remap for format selected region
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)
"
" augroup mygroup
"   autocmd!
"   " Setup formatexpr specified filetype(s).
"   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"   " Update signature help on jump placeholder
"   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end
"
" " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)
"
" " Remap for do codeAction of current line
" nmap <leader>ac  <Plug>(coc-codeaction)
" " Fix autofix problem of current line
" nmap <leader>qf  <Plug>(coc-fix-current)
"
" " Create mappings for function text object, requires document symbols feature of languageserver.
" xmap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap if <Plug>(coc-funcobj-i)
" omap af <Plug>(coc-funcobj-a)
"
" " Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" nmap <silent> <C-d> <Plug>(coc-range-select)
" xmap <silent> <C-d> <Plug>(coc-range-select)
"
" " Use `:Format` to format current buffer
" command! -nargs=0 Format :call CocAction('format')
"
" " Use `:Fold` to fold current buffer
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)
"
" " use `:OR` for organize import of current buffer
" command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
"
" " Add status line support, for integration with other plugin, checkout `:h coc-status`
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"
" " Using CocList
" " Show all diagnostics
" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" " Show commands
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerdcomment - Comment functions so powerful—no comment necessary.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" configure search
set gdefault
set incsearch
set showmatch
set hlsearch

" Search word under cursor in current dir
:let Grep_Skip_Dirs = '.git tmp public doc .yardoc log coverage storage node_modules vendor'
:let Grep_Skip_Files = '*.bak *~ tags Session.vim *.pdf *.log'
nnoremap <C-f> :Rgrep<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tomorrow theme
" color Tomorrow-Night
" set t_Co=256
colorscheme onedark

"" For oceanic Theme
"colorscheme OceanicNext
"let g:oceanic_next_terminal_bold = 1
"let g:oceanic_next_terminal_italic = 1
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

if has("termguicolors")     " set true colors
    set t_8f=\[[38;2;%lu;%lu;%lum
    set t_8b=\[[48;2;%lu;%lu;%lum
    set termguicolors
endif

" syntax enable
" set background=dark
" colorscheme solarized
" let g:solarized_termcolors=256

" Font gui
set guifont=Hack\ Nerd\ Font\ Regular:h16


" Colorize css hexa colors
let g:colorizer_auto_color = 1
let g:colorizer_auto_filetype='css,html,sass,scss'

" Custom Airline Theme
let g:airline_powerline_fonts=1
" let g:airline_theme='base16_default'
let g:airline_theme='onedark'
"let g:airline_theme='oceanicnext'
" testing rounded separators (extra-powerline-symbols):
let g:airline_left_sep = "\uE0C6"
let g:airline_right_sep = "\uE0C7"

" set the CN (column number) symbol:
let g:airline_section_z = airline#section#create(["\uE0A1" . '%{line(".")}' . "\uE0A3" . '%{col(".")}'])
let g:airline#extensions#tabline#enabled = 0
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

let g:indentLine_enabled = v:true
let b:indentLine_enabled = v:true


" highlight current line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Remove arrow to learn vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Normal mode
" nnoremap <up> <nop>
" nnoremap <down> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>
"
" " Insert mode
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Map alt touch for HJKL direction for bépo compatibility
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" noremap ᵉ h
" noremap ß j
" noremap ˘ k
" noremap ~ l
"
"
" inoremap þ <C-o>h
" inoremap ß <C-o>j
" inoremap ® <C-o>k
" inoremap ~ <C-o>l
"
" noremap Þ <C-w>h
" noremap ẞ <C-w>j
" noremap ™ <C-w>k
" noremap ™ <C-w>l
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerdtree configuration
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
noremap <f5> :NERDTreeToggle<CR>

" have tree in all tabs
let g:nerdtree_tabs_open_on_console_startup=1
let NERDTreeIgnore = ['\.DS_Store$']

" TagList configuration
if system("uname") == "Darwin\n"
  let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
else
  let Tlist_Ctags_Cmd = "/usr/bin/ctags"
endif
set tags+=./.git/tags,./tags
let Tlist_WinWidth = 50
noremap <f6> :TlistToggle<cr>
let Tlist_Process_File_Always = 1
let Tlist_Use_Right_Window = 1

" Ctrlp configuration
" let g:ctrlp_map = '<c-p>'                      " keyboard shortcur
" let g:ctrlp_working_path_mode = 2              " set the working dir at  the nearest ancestor that contains .git
" set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*.so/*,*/doc/*,*/node_modules/*,*/tmp/*,*/vendor/*,*.jpg,*.png,*.gif,*.ico,*.jpeg " ignore some files
" "let g:ctrlp_custom_ignore = '\v[\/](\.(git|hg|svn|jpg|gif|png|jpeg|ico)|(doc))$'
" "let g:ctrlp_custom_ignore = '.git\|hg\|svn\|doc|'
" "let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files'] " use git to list files (faster)
" " let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files | grep -v doc'] " use git to list files (faster) except => doc

if exists("&wildignorecase")
  set wildignorecase
endif


" VimResizer
let g:winresizer_enable = 1
let g:winresizer_keycode_left = 99
let g:winresizer_keycode_right = 114
let g:winresizer_keycode_up = 115
let g:winresizer_keycode_down = 116

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions

" Reload .vimrc
set autoread

" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.config/nvim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
  let myUndoDir = expand(vimDir . '/undodir')
  " Create dirs
  call system('mkdir ' . vimDir)
  call system('mkdir ' . myUndoDir)
  let &undodir = myUndoDir
  set undofile
endif

let g:NERDTreeMapOpenDirNode = '®'
let g:NERDTreeMapCloseDirNode = '©'


" To Make a safe markdown
augroup Markdown
  autocmd!
  autocmd FileType markdown set wrap
augroup END


" " " Begin For solargraph
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
" " End For solargraph

" Remove number with terminal
augroup neovim_terminal
  autocmd!

  " Enter Terminal-mode (insert) automatically
  autocmd TermOpen * startinsert

  " Disables number lines on terminal buffers
  autocmd TermOpen * :set nonumber norelativenumber
augroup END


" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fl <cmd>Telescope live_grep<cr>
nnoremap <leader>fg <cmd>Telescope git_files<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" nnoremap <c-p> <cmd>Telescope git_files<cr>

let g:LanguageClient_autoStop = 0
let g:LanguageClient_serverCommands = {
    \ 'ruby': ['tcp://localhost:7658']
    \ }

" nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

autocmd FileType ruby setlocal omnifunc=LanguageClient#complete


noremap Zz <c-w>_ \| <c-w>\|
noremap Zo <c-w>=
