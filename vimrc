" ---------- generic ---------
filetype plugin indent on
syntax on

" ----------- sets -----------
set autoindent smartindent
set autoread
set backspace=indent,eol,start
set belloff=all
set cmdheight=2
set colorcolumn=80
set completeopt=menuone,noinsert,noselect
set cursorline
set encoding=utf-8
set gdefault
set hidden
set ignorecase smartcase
set incsearch hlsearch
set laststatus=2
set listchars=tab:⇀\ ,trail:␠
set matchpairs+=<:>
set nobackup
set nocompatible
set noerrorbells
set nofoldenable
set noshowmode
set noswapfile
set number relativenumber
set ruler
set scrolloff=5
set shell=bash\ -i " instant_markdown
set shortmess+=c
set showmatch
set signcolumn=yes
set splitbelow
set splitright
set switchbuf=useopen,usetab
set title
set titlestring='Powerslave'
set undodir=~/.vim/undodir
set undofile
set whichwrap=b,s,h,l,<,>,[,]
set wildignore+=*.o,*.obj,.git,tmp/**,public/uploads/**,node_modules/**
set wildmenu
set wildmode=longest,list,full

" Copy/Paste Vim Tmux
set clipboard=unnamed
xnoremap p pgvy
" Delete visual selection and paste default register
vnoremap <leader>p "_dP
" Yank entire buffer with gy
nmap gy :%y+<cr>
" Make Y behave like other capital commands.
nnoremap Y y$

" Paste using Paste Mode
" Keeps indentation from source.
" ---------------
function! PasteWithPasteMode()
  if &paste
    normal p
  else
    " Enable paste mode and paste the text, then disable paste mode.
    set paste
    normal p
    set nopaste
  endif
endfunction

command! PasteWithPasteMode call PasteWithPasteMode()
nmap <silent> <leader>p :PasteWithPasteMode<CR>

" Ruby Styleguide
set shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" ----------- lets -----------
let mapleader = ","
let localleader = '\'

" ---------- env vars --------
let $RTP=split(&runtimepath, ',')[0]
let $RC="$HOME/.vimrc"

" ----------- plug -----------
" :PlugInstall, :PlugUpdate, :PlugClean
if empty(glob("~/.vim/autoload/plug.vim"))
  execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif
call plug#begin('~/.vim/plugged')

" ---------- plugins ---------
Plug 'AndrewRadev/switch.vim'
Plug 'axelf4/vim-strip-trailing-whitespace'
Plug 'Yggdroot/indentLine'
Plug 'edkolev/tmuxline.vim'
Plug 'freitass/todo.txt-vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'jgdavey/tslime.vim'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'mbbill/undotree'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'timcmartin/vim-afterglow'
Plug 'tpope/vim-git'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-airline/vim-airline'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'vimwiki/vimwiki'
" https://thoughtbot.com/blog/modern-typescript-and-react-development-in-vim
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Initialize plugin system
call plug#end()

" ------- plugin mapping ------
" AndrewRadev/switch.vim
let g:switch_mapping = "-"

" Yggdroot/indentLine
let g:indentLine_color_term = 239
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" junegunn/vim-easy-align
au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>
au FileType md vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>

" mbbill/undotree
nnoremap <leader>u :UndotreeShow<CR>

" neoclide/coc.nvim
let g:coc_global_extensions = ['coc-json', 'coc-solargraph', 'coc-tsserver']
nnoremap <silent> K :call CocAction('doHover')<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>
nmap <leader>do <Plug>(coc-codeaction)
nmap <leader>rn <Plug>(coc-rename)
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" jgdavey/tslime.vim
let g:rspec_command = 'call Send_to_Tmux("bundle exec rspec {spec}\n")'
map <leader>t :call RunCurrentSpecFile()<CR>
map <leader>s :call RunNearestSpec()<CR>
map <leader>l :call RunLastSpec()<CR>
map <leader>as :call RunAllSpecs()<CR>

" scrooloose/nerdcommenter
nmap \\ <plug>NERDCommenterToggle<CR>
vmap \\ <plug>NERDCommenterToggle<CR>
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDDefaultAlign = 'left'

" scrooloose/nerdtree
map <silent> <leader>f :NERDTree<CR>:wincmd l<CR>:NERDTreeFind<CR>
map <leader>dc :NERDTreeTabsClose<cr>
map <leader>do :NERDTree<cr>
nnoremap <silent><C-n> :NERDTreeTabsToggle<cr>
vnoremap <silent><C-n> :NERDTreeTabsToggle<cr>
let NERDChristmasTree = 1
let NERDTreeHighlightCursorline = 1
let NERDTreeShowBookmarks = 1
let g:NERDTreeBookmarksFile = $HOME . '/Dotfiles/NERDTreeBookmarks'
let NERDTreeShowHidden = 1
let NERDTreeHijackNetrw = 1
let NERDTreeIgnore=['\.$', '\~$']
let g:NERDTreeWinSize = 40

" suan/vim-instant-markdown
let g:instant_markdown_autostart=0
nmap \md :InstantMarkdownPreview<CR>
nmap \ms :InstantMarkdownStop<CR>

" junegunn/fzf
nnoremap <C-p> :Files<cr>
nnoremap <C-g> :Rg<cr>

let $FZF_DEFAULT_OPTS='--reverse'
let $FZF_DEFAULT_COMMAND='rg --files'

let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" timcmartin/vim-afterglow
let g:afterglow_inherit_background=1
colorscheme afterglow
set background=dark
set t_Co=256

" tpope/vim-fugitive
nnoremap <leader>gs :G<CR>
nnoremap <leader>gb :GBranches<CR>
nnoremap <leader>gj :diffget //3<CR>
nnoremap <leader>gf :diffget //2<CR>

" vim-airline/vim-airline
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#ctrlspace#enabled=1
let g:airline#extensions#tmuxline#enabled=1
let g:airline#extensions#coc#enabled=1
let airline#extensions#tabline#disable_refresh=0
" timcmartin/vim-afterglow
let g:airline_theme='afterglow'

" vim-ctrlspace/vim-ctrlspace
let s:vimfiles = '~/.vim'
if has('mac') || has('gui_macvim')
  let s:os = 'darwin'
else
  " elseif has('gui_gtk2') || has('gui_gtk3')
  let s:os = 'linux'
endif

let g:CtrlSpaceFileEngine = s:vimfiles . '/plugged/vim-ctrlspace' . '/bin/file_engine_' . s:os . '_amd64'
let g:CtrlSpaceStatuslineFunction = "airline#extensions#ctrlspace#statusline()"
let g:CtrlSpaceUseTabline = 1
map <C-space> :CtrlSpace
hi link CtrlSpaceNormal   PMenu
hi link CtrlSpaceSelected PMenuSel
hi link CtrlSpaceSearch   Search
hi link CtrlSpaceStatus   StatusLine
hi link CtrlSpaceSearch   IncSearch

if executable("ag")
  let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif

let g:CtrlSpaceIgnoredFiles = '\v(tmp|temp|node_modules)[\/]'

" vimwiki/vimwiki
" AWS
let vimwiki_aws = {}
let vimwiki_aws.path = '~/Dropbox/vimwiki/aws/'
let vimwiki_aws.path_html = ''
let vimwiki_aws.syntax = 'default'
let vimwiki_aws.ext = '.wiki'
let vimwiki_aws.name = 'aws'

" Getty
let vimwiki_getty = {}
let vimwiki_getty.path = '~/Dropbox/vimwiki/getty/'
let vimwiki_getty.path_html = ''
let vimwiki_getty.syntax = 'default'
let vimwiki_getty.ext = '.wiki'
let vimwiki_getty.name = 'Getty'

" Cabin
let vimwiki_cabin = {}
let vimwiki_cabin.path = '~/Dropbox/vimwiki/cabin/'
let vimwiki_cabin.path_html = ''
let vimwiki_cabin.syntax = 'default'
let vimwiki_cabin.ext = '.wiki'
let vimwiki_cabin.name = 'Cabin'

" Dev
let vimwiki_dev = {}
let vimwiki_dev.path = '~/Dropbox/vimwiki/dev/'
let vimwiki_dev.path_html = ''
let vimwiki_dev.syntax = 'default'
let vimwiki_dev.ext = '.wiki'
let vimwiki_dev.name = 'Dev'

" Guitar
let vimwiki_guitar = {}
let vimwiki_guitar.path = '~/Dropbox/vimwiki/guitarrig/'
let vimwiki_guitar.path_html = ''
let vimwiki_guitar.syntax = 'default'
let vimwiki_guitar.ext = '.wiki'
let vimwiki_guitar.name = 'GuitarRig'

" House
let vimwiki_house = {}
let vimwiki_house.path = '~/Dropbox/vimwiki/house/'
let vimwiki_house.path_html = ''
let vimwiki_house.syntax = 'default'
let vimwiki_house.ext = '.wiki'
let vimwiki_house.name = 'House'

" Personal
let vimwiki_personal = {}
let vimwiki_personal.path = '~/Dropbox/vimwiki/personal/'
let vimwiki_personal.path_html = ''
let vimwiki_personal.syntax = 'default'
let vimwiki_personal.ext = '.wiki'
let vimwiki_personal.name = 'Personal'

" Recipes
let vimwiki_recipes = {}
let vimwiki_recipes.path = '~/Dropbox/vimwiki/recipes/'
let vimwiki_recipes.path_html = ''
let vimwiki_recipes.syntax = 'default'
let vimwiki_recipes.ext = '.wiki'
let vimwiki_recipes.name = 'Recipes'

" Temp
let vimwiki_temp = {}
let vimwiki_temp.path = '~/Dropbox/vimwiki/temp/'
let vimwiki_temp.path_html = ''
let vimwiki_temp.syntax = 'default'
let vimwiki_temp.ext = '.wiki'
let vimwiki_temp.name = 'Temp'

" Travel
let vimwiki_travel = {}
let vimwiki_travel.path = '~/Dropbox/vimwiki/travel/'
let vimwiki_travel.path_html = ''
let vimwiki_travel.syntax = 'default'
let vimwiki_travel.ext = '.wiki'
let vimwiki_travel.name = 'Travel'

" Express
let vimwiki_express = {}
let vimwiki_express.path = '~/Dropbox/vimwiki/express/'
let vimwiki_express.path_html = ''
let vimwiki_express.syntax = 'markdown'
let vimwiki_express.ext = '.md'
let vimwiki_express.name = 'Express'

let g:vimwiki_list = [vimwiki_aws, vimwiki_getty, vimwiki_cabin, vimwiki_dev, vimwiki_guitar, vimwiki_house, vimwiki_personal, vimwiki_recipes, vimwiki_temp, vimwiki_travel, vimwiki_express]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:vimwiki_hl_headers = 1
let g:vimwiki_nested_syntaxes = {'python':'python', 'c++':'cpp', 'ruby':'ruby', 'cmd':'sh'}
let g:automatic_nested_syntaxes = 1

if has ('autocmd')
 augroup Vimwiki
    autocmd!
    au BufRead,BufNewFile,BufNew,BufEnter *.wiki set filetype=vimwiki
    au FileType vimwiki map <leader>d :VimwikiMakeDiaryNote
    au BufNew,BufEnter *.wiki,*.md execute "silent! CocDisable"
    au BufLeave *.wiki,*.md execute "silent! CocEnable"
  augroup END
endif

" ---- convenience mapping ----
" Date & Time
nnoremap <F5> "=strftime("%b %d, %Y")<CR>P
inoremap <F5> <C-R>=strftime("%b %d, %Y")<CR>

" Escape
inoremap jj <Esc>
" Semicolon
map ; :
noremap ;; ;

" Gitbook formatting convenience
" Format txt
nnoremap <Leader>txt :set ft=txt<CR>
" Format md
nnoremap <Leader>md :set ft=markdown<CR>

" Jumping to end / beginning of lines
noremap H ^
noremap L $

" Last cursor position
if has("autocmd")
  augroup Cursor_Position
    autocmd!
    autocmd BufReadPost *
      \ if line("'\"") > 1 && line ("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif
  augroup END
endif

" ---- Managing Tabs & Navigation ----
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tn  :tabnext<CR>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>
" Easier split navigation
" Use ctrl-[hjkl] to select the active split!
" Use ctrl-w[hjkl] to select the active split!
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>

" Relative Filename
nnoremap <Leader>fn :let @+ = expand("%")<CR>

" Ruby
" Look for Todos
noremap <Leader>tt :noautocmd vimgrep /TODO/j **/*.rb<CR>:cw<CR>
" Insert puts caller
nnoremap <leader>wtf oputs "#{'@' * 100}\n #{caller_locations(1,1)[0].label} \n#{'@' * 100}"<esc>
" Switch from ruby 1.8 hash to ruby 1.9 hash
map <silent> <leader>rh :%s/:\(\w*\)\s*=>\s*\(\w*\)/\1: \2/g<CR>

" Sass highlighting for slim files
autocmd BufNewFile,BufRead *.slim set ft=sass

" Search
" remove highlight from search matches
nmap <silent><leader>/ :nohlsearch<CR>
" Search for highlighted text with //
vnoremap // y/<C-R>"<CR>
" Highlight search word under cursor without jumping to next
nnoremap <leader>h *<C-O>

" todo.txt - make it easy
nnoremap <leader>te :vsplit $HOME/Dropbox/Apps/Todotxt+/todo.txt<cr>

" Untitled Documents
if has("autocmd")
  autocmd FocusLost silent! :wa
endif

" vimrc
" make it easy to source and load vimrc
nnoremap <leader>ve :vsplit $MYVIMRC<cr>
" Source vim configuration file whenever it is saved
if has ('autocmd')
 augroup Reload_Vimrc
    autocmd!
    autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw |  AirlineRefresh
  augroup END
endif

