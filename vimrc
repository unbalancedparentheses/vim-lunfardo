" try not to put any lines in your vimrc that you don't understand

" call plug plugin manager
call plug#begin('~/.vim/plugged')

" basic settings
"---------------

" gvim without unnecessary things
if has('gui_running')
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar
endif

scriptencoding utf-8

" disable strange vi defaults
set nocompatible

" for regular expressions turn magic on
set magic

" search as characters are entered
set incsearch
" highlight matches
set hlsearch

" cursor can be positioned where there is no actual character
set virtualedit=onemore

set history=1000
" allow buffer switching without saving
set hidden

" automatically enable mouse usage
set mouse=a
" hide the mouse cursor while typing
set mousehide

" yank and paste with the system clipboard
set clipboard=unnamedplus

set tabpagemax=50

set more

" no backups, please
set nobackup
" only in case you don't want a backup file while editing
set nowritebackup
" no swap files
set noswapfile

" if a pattern contains an uppercase letter, it is case sensitive,
" otherwise, it is not
set ignorecase
set infercase
set smartcase

" good defaults
Plug 'tpope/vim-sensible'

" bindings
"---------

" leader
set notimeout
set ttimeout
set ttimeoutlen=10

" space is the new leader
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

" save file
nnoremap <Leader>w :w<CR>

" quit
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :q!<CR>

" save and quit
nnoremap <Leader>x :x<CR>

" type commands more easily
" ',' can be typed directly without shift
noremap , :

" exit insert mode with jk
inoremap jk <esc>
inoremap kj <esc>

" pairs of handy bracket mappings
Plug 'tpope/vim-unimpaired'

set pastetoggle=<F2>

" move lines up and down
nmap <c-up> [e
nmap <c-down> ]e
vmap <c-down> ]egv
vmap <c-up> [egv

" indent or unindent selected lines with tab
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" readline key bindings
Plug 'tpope/vim-rsi'

" provides a much simpler way to use some motions
Plug 'Lokaltog/vim-easymotion'

" get to any word on a line in two or three keystrokes
" with mainly f{char} (which moves your cursor to {char})
Plug 'unblevable/quick-scope'

" smooth scroll
Plug 'terryma/vim-smooth-scroll'
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 8)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 8)<CR>

" window management
Plug 'zhaocai/GoldenView.Vim'

" editor
"-------

" enable repeating supported plugin maps with .
Plug 'tpope/vim-repeat'

" always autosave everything
:au FocusLost * silent! wa
set autowrite

" autoread file on change
set autoread

" make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" backspace for dummies
set backspace=indent,eol,start

" editorconfig define and maintain consistent coding styles between different editors and IDEs
Plug 'editorconfig/editorconfig-vim'

" relative or absolute line numbering depending on the mode
Plug 'myusuf3/numbers.vim'

" fancy start screen
Plug 'mhinz/vim-startify'
let g:startify_session_dir = "~/.vim/sessions"
let g:startify_change_to_vcs_root = 1
let g:startify_show_sessions = 1
nnoremap <F1> :Startify<cr>

" fuzzy file, buffer, mru, tag, etc finder
Plug 'kien/ctrlp.vim'
let g:ctrlp_map = '<Leader>p'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\.git$\|\.hg$\|\.svn$',
      \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

if executable('ag')
  let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
  let g:ctrlp_use_caching = 0
elseif executable('ack')
  let s:ctrlp_fallback = 'ack %s --nocolor -f'
else
  let s:ctrlp_fallback = 'find %s -type f'
endif

" yank and commands history thanks to ctrlp
Plug 'sgur/ctrlp-extensions.vim'
nnoremap <leader>y :CtrlPYankring<cr>
nnoremap <leader>c :CtrlPCmdline<cr>

" show the list of buffers in the command bar
Plug 'bling/vim-bufferline'

" list, select and switch between buffers
Plug 'jeetsukumaran/vim-buffergator'

" search using ag, ack or grep
Plug 'wincent/ferret'

" tree explorer
Plug 'scrooloose/nerdtree'
nnoremap <Leader>e :NERDTreeToggle<CR>

" shell inside vim
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'Shougo/vimshell.vim'
nnoremap <Leader>S :VimShell<CR>

" highlight unwanted whitespace
Plug 'ntpeters/vim-better-whitespace'
" strip all trailing whitespace everytime you save the file for all file types
autocmd BufWritePre * StripWhitespace
let g:better_whitespace_filetypes_blacklist = []

" v to expand the visual selection and C-v to shrink it.
Plug 'terryma/vim-expand-region'
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" sublime style multiple selections for vim
Plug 'terryma/vim-multiple-cursors'
let g:multi_cursor_next_key='<C-d>'

" display your undo history in a graph
Plug 'mbbill/undotree'
nnoremap <Leader>u :UndotreeToggle<cr>

if has('persistent_undo')
  " where to save undo histories
  set undodir=~/.vim/undo
  " so is persistent undo
  set undofile
  " maximum number of changes that can be undone
  set undolevels=1000
  " maximum number lines to save for undo on a buffer reload
  set undoreload=10000
endif

" comment and uncomment
Plug 'tpope/vim-commentary'

" kick off builds and test suites using one of several asynchronous adapters
Plug 'tpope/vim-dispatch'

" sugar for the UNIX shell commands that need it the most
Plug 'tpope/vim-eunuch'

" plugin for focussing on a selected region
Plug 'chrisbra/NrrwRgn'

" vim alignment plugin
Plug 'junegunn/vim-easy-align'
" start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" start search for visual mode
Plug 'thinca/vim-visualstar'

" quotes, brackets, parens, etc
"---------------------

" colors for paris of {}, (), []
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

" extended % matching for HTML, LaTeX, and many other languages
Plug 'tmhedberg/matchit'

" quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

" insert or delete brackets, parens, quotes in pair
Plug 'jiangmiao/auto-pairs'

" automatically inserts one extra level of indentation in some cases, and works for C-like files.
set autoindent

" load filetype-specific indent files and
" also enable language-dependent indenting
if has('autocmd')
  filetype plugin indent on
endif

" disable folding
set nofoldenable

" automatically adjusts shiftwidth and expandtab heuristically based on the current file
Plug 'tpope/vim-sleuth'

" display the indention levels with thin vertical lines
Plug 'Yggdroot/indentLine'

if has("patch-7.4-338")
  set breakindent
  set showbreak=↪
endif

"  user interface
"----------------

" redraw only when we need to
set lazyredraw
" fast terminal
set ttyfast
" show command in bottom bar
set showcmd
" highlight current line
set cursorline
" show matching brackets when text indicator is over them
set showmatch
" how many tenths of a second to blink when matching brackets
set matchtime=2

" visual autocomplete for command menu
set wildmenu
" bash tab style completion is awesome
set wildmode=list:longest,full
" tab completion key
set wildchar=<tab>

" disables beep and flash
" vim needs to have visualbell set
" and what to do when flashing, t_vb config, set to empty
set noerrorbells
set visualbell
set t_vb=

if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

" ignore whitespace changes
set diffopt+=iwhite

" always show status bar
set laststatus=2
" lean and mean status/tabline for vim that's light as air
Plug  'bling/vim-airline'

" source control management
"--------------------------

" vim git interface
Plug 'tpope/vim-fugitive'
nmap <leader>gb :Gblame<CR>
nmap <leader>gs :Gstatus<CR>')
nmap <leader>gd :Gdiff<CR>
nmap <leader>gl :Glog<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Git push<CR>

" gitk for vim
Plug 'gregsexton/gitv'
nmap <leader>gv :Gitv<CR>

" git diff in each line
Plug 'airblade/vim-gitgutter'

" vim mercurial interface
if executable('hg')
  Plug 'ludovicchabant/vim-lawrencium'
endif

" gist
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'

" languages
"-----------

" enable syntax processing
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" check for errors
Plug 'scrooloose/syntastic'
if exists(":SyntasticInfo")
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
  let g:syntastic_error_symbol = "✗"
  let g:syntastic_warning_symbol = "⚠"
endif
nnoremap <F3> <ESC>:SyntasticCheck<CR>:Errors<CR>

Plug 'Chiel92/vim-autoformat'
nnoremap <F4> :Autoformat<CR>

if executable("ctags")
  Plug 'xolox/vim-misc'
  Plug 'xolox/vim-easytags'
  let g:easytags_file = '~/.vim/tags'
  nnoremap <F5> :UpdateTags<CR>

  Plug 'majutsushi/tagbar'
  nmap <F6> :TagbarToggle<CR>
endif

" helps to end certain structures automatically
Plug 'tpope/vim-endwise'

" C, C++
if executable('clang')
  " async clang completion
  Plug 'osyo-manga/vim-marching'
  " syntax highlighting for C++ (including C++11/14)
  Plug 'octol/vim-cpp-enhanced-highlight'
endif

" go
Plug 'fatih/vim-go'
" format with goimports instead of gofmt
let g:go_fmt_command = "goimports"

" erlang
Plug 'jimenezrick/vimerl'

" python
Plug 'davidhalter/jedi-vim'

" ruby
Plug 'vim-ruby/vim-ruby'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-rails'

" json
Plug 'elzr/vim-json'

" markdown
Plug 'plasticboy/vim-markdown'

" html

" omnicomplete and syntax
Plug 'othree/html5.vim'

" a parser for a condensed HTML format
Plug 'rstacruz/sparkup'

" highlights the matching HTML tag when the cursor is positioned on a tag
Plug 'gregsexton/MatchTag'

" javascript
Plug 'pangloss/vim-javascript'

" autocomplete
"-------------

if has('lua') && has("patch-7.3-885")
  Plug 'Shougo/neocomplete.vim'
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#data_directory = '~/.vim/cache/plugins/neocomplete'
else
  Plug 'Shougo/neocomplcache.vim'
  let g:neocomplcache_enable_at_startup = 1
  let g:neocomplcache_temporary_dir = '~/.vim/cache/plugins/neocomplcache'
  let g:neocomplcache_enable_fuzzy_completion = 1
endif

" snippets
"---------

if has('python')
  " track the engine
  Plug 'SirVer/ultisnips'
  " trigger configuration
  let g:UltiSnipsExpandTrigger="<C-k>"
  let g:UltiSnipsJumpForwardTrigger="<tab>"
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

  " if you want :UltiSnipsEdit to split your window
  let g:UltiSnipsEditSplit="vertical"
else
  Plug 'Shougo/neosnippet.vim'
  " enable snipMate compatibility feature
  let g:neosnippet#enable_snipmate_compatibility = 1
  imap <C-k> <Plug>(neosnippet_expand_or_jump)
  smap <C-k> <Plug>(neosnippet_expand_or_jump)
  xmap <C-k> <Plug>(neosnippet_expand_target)

  " neosnippet snippets
  Plug 'Shougo/neosnippet-snippets'
endif

" snippets files for various programming languages
Plug 'honza/vim-snippets'

" perform all your vim insert mode completions with tab
Plug 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]

" colorschemes
"-------------

Plug 'christophermca/meta5'
Plug 'sjl/badwolf'
Plug 'tomasr/molokai'
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/tomorrow-theme', {'rtp': 'vim'}
Plug 'notpratheek/vim-luna'
Plug 'NLKNguyen/papercolor-theme'

call plug#end()

set background=dark
set t_Co=256
silent! colorscheme PaperColor
