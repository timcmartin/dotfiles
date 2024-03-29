""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Generic Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on
syntax on

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
set ignorecase
set smartcase
set incsearch hlsearch
set laststatus=2
set listchars=tab:⇀\ ,trail:␠
set linebreak
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
" instant_markdown
" set shell=bash\ -i
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
" set wildignore+=*.o,*.obj,.git,tmp/**,public/uploads/**,node_modules/**,config/locales/**
set wildmenu
set wildmode=longest,list,full
set wrap

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffers: Clear all but current
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! BufOnly execute '%bdelete|edit #|normal `"'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Copy/Paste Vim Tmux
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ruby Styleguide
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set shiftwidth=2 tabstop=2 softtabstop=2 expandtab

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leaders
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","
let localleader = '\'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Env Vars
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let $RTP=split(&runtimepath, ',')[0]
let $RC="$HOME/.vimrc"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :PlugInstall, :PlugUpdate, :PlugClean
if empty(glob("~/.vim/autoload/plug.vim"))
  execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif
call plug#begin('~/.vim/plugged')

" ---------- plugins ---------
Plug 'AndrewRadev/switch.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Yggdroot/indentLine'
Plug 'axelf4/vim-strip-trailing-whitespace'
Plug 'clarke/vim-renumber'
Plug 'edkolev/tmuxline.vim'
Plug 'freitass/todo.txt-vim'
Plug 'gcmt/taboo.vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'jgdavey/tslime.vim'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-signify'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sk1418/Join'
Plug 'stsewd/fzf-checkout.vim'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'thoughtbot/vim-rspec'
Plug 'timcmartin/vim-afterglow'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-ruby/vim-ruby'
Plug 'vimwiki/vimwiki'
Plug 'hashivim/vim-terraform'
Plug 'vim-test/vim-test'
Plug 'github/copilot.vim'
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Mappings and Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AndrewRadev/switch.vim
let g:switch_mapping = "-"

" Yggdroot/indentLine
let g:indentLine_color_term = 239
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" mbbill/undotree
nnoremap <leader>u :UndotreeShow<CR>

" junegunn/vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" mhinz/vim-signify
" Default maps in effect
" ]c   Jump to the next hunk.
" [c   Jump to the previous hunk.
" ]C   Jump to the last hunk.
" [C   Jump to the first hunk.
nnoremap ]d :SignifyHunkDiff<CR>
nnoremap ]D :SignifyHunkUndo<CR>

" https://thoughtbot.com/blog/modern-typescript-and-react-development-in-vim
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" neoclide/coc.nvim
let g:coc_global_extensions = ['coc-json', 'coc-tsserver', 'coc-yaml', 'coc-css', 'coc-html', 'coc-eslint', 'coc-styled-components']

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

let g:coc_disable_transparent_cursor = 1
let g:coc_start_at_startup = v:false
" Start COC in select projects automatically
autocmd BufRead,BufNewFile $HOME/src/getty/unisporkal/misc_admin/* :CocStart
autocmd BufRead,BufNewFile $HOME/src/getty/unisporkal/packages/customer-notifications/* :CocStart
autocmd BufRead,BufNewFile $HOME/src/getty/learning/ts/* :CocStart

nnoremap <silent> K :call CocAction('doHover')<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>
nmap <leader>do <Plug>(coc-codeaction)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>cd :CocDisable<CR>
nmap <leader>ce :CocEnable<CR>
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <C-x><C-z> coc#pum#visible() ? coc#pum#stop() : "\<C-x>\<C-z>"
" remap for complete to use tab and <cr>
inoremap <silent><expr> <TAB>
    \ coc#pum#visible() ? coc#pum#next(1):
    \ <SID>check_back_space() ? "\<Tab>" :
    \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()

" hi CocSearch ctermfg=12 guifg=#18A3FF
" hi CocMenuSel ctermbg=109 guibg=#13354A

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Prettier Range Format
vmap <localleader>f  <Plug>(coc-format-selected)
nmap <localleader>f  <Plug>(coc-format-selected)

" jgdavey/tslime.vim
let g:rspec_command = 'call Send_to_Tmux("bundle exec rspec {spec}\n")'
nnoremap <leader>us :unlet g:tslime<CR>

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
" TODO: Using CTRL-N
" map <leader>do :NERDTree<cr>
nnoremap <silent><C-n> :NERDTreeTabsToggle<cr>
vnoremap <silent><C-n> :NERDTreeTabsToggle<cr>
" Refresh NERDTree to CWD
nnoremap <leader>r :NERDTreeCWD<CR>
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
nnoremap <C-b> :Buffers<cr>
nnoremap <C-c> :Cg<cr>
" Don't look in filename
command! -bang -nargs=* Cg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

let $FZF_DEFAULT_OPTS='--reverse --multi'
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

" stsewd/fzf-checkout.vim
nnoremap <leader>gb :GBranches<CR>

" timcmartin/vim-afterglow
let g:afterglow_inherit_background=1
colorscheme afterglow
set background=dark
set t_Co=256

" thoughtbot/vim-rspec
map <leader>t :call RunCurrentSpecFile()<CR>
map <leader>s :call RunNearestSpec()<CR>
map <leader>l :call RunLastSpec()<CR>
map <leader>as :call RunAllSpecs()<CR>

" tpope/vim-fugitive
nnoremap <leader>gs :G<CR>
nnoremap <leader>gj :diffget //3<CR>
nnoremap <leader>gf :diffget //2<CR>

" tpope/vim-obsession
nnoremap <localleader>s :Obsess<CR>
nnoremap <localleader>sd :Obsess!<CR>

" vim-airline/vim-airline
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#obsession#enabled=1
" if enabled (1) overwrites tmux-theme
let g:airline#extensions#tmuxline#enabled=0
let g:airline#extensions#coc#enabled=1
let airline#extensions#tabline#disable_refresh=0
let g:airline_skip_empty_sections = 1
" timcmartin/vim-afterglow
let g:airline_theme='afterglow'

" vim-ruby/vim-ruby
 packadd! matchit

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
let g:vimwiki_nested_syntaxes = {'python':'python', 'c++':'cpp', 'ruby':'ruby', 'cmd':'sh', 'bash':'sh', 'slim':'sass'}
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

" vim-test
let test#strategy = "tslime"
let g:test#javascript#runner = 'jest'
map <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
" Jest Test file if missing (see function below)
map <leader>jt :call MakeJestFileIfMissing()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make Jest Test file if Missing
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! MakeJestFileIfMissing()
ruby << EOF
  class MakesJestFileIfMissing
    def self.for(buffer)
      test_file = test_for_buffer(buffer)
      component = testify(buffer).sub!('.test.jsx','')
      boilerplate_file = '/Users/tmartin/Dotfiles/vim/boilerplate/jest_test.txt'

      if already_exists?(test_file)
        puts "Jest Test already exists"
        return
      end

      boilerplate_input = File.open(boilerplate_file)  
      boilerplate_code = boilerplate_input.read()

      File.open(test_file, File::WRONLY|File::CREAT|File::EXCL) do |file|
        file.write(boilerplate_code.gsub('#{component}', component))
      end
      
    end

    private

    def self.jest_file?(file)
      file.match(/.*test.jsx$/)
    end

    def self.already_exists?(b)
      File.exists?(b)
    end

    def self.test_for_buffer(b)
      jest_buffer = b.sub!('.jsx', '.test.jsx')
      return jest_buffer
    end

    def self.testify(b)
      File.basename(b)
    end
  end

  buffer = VIM::Buffer.current.name
  MakesJestFileIfMissing.for(buffer)
EOF
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Convenience Mapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctags
" Set f6 to generate tags
nnoremap <F6> :!ctags -R<CR>
" Ctags search
set tags=./.tags;$HOME
" Navigation
" Ctrl+] - go to definition
" Ctrl+T - Jump back from the definition.
" Ctrl+W Ctrl+] - Open the definition in a horizontal split
" Ctrl+\ - Open the definition in a new tab
" Alt+] - Open the definition in a vertical split
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

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
nnoremap <leader>txt :set ft=txt<CR>
" Format md
nnoremap <leader>md :set ft=markdown<CR>

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
nmap <silent> <C-l> :wincmd l<CR>

" Relative Filename
nnoremap <leader>fn :let @+ = expand("%")<CR>

" Ruby
" Look for Todos
noremap <leader>tt :noautocmd vimgrep /TODO/j **/*.rb<CR>:cw<CR>
" Insert puts caller
nnoremap <leader>wtf oputs "#{'@' * 100}\n #{caller_locations(1,1)[0].label} \n#{'@' * 100}"<esc>
" Insert binding pry
nnoremap <leader>bp Obinding.pry <esc>
" Insert require pry
nnoremap <leader>rp Orequire 'pry'<esc>
" Switch from ruby 1.8 hash to ruby 1.9 hash
map <silent> <leader>rh :%s/:\(\w*\)\s*=>\s*\(\w*\)/\1: \2/g<CR>
" Rspec file if missing (see function below)
map <leader>grs :call MakeRspecFileIfMissing()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make Rspec file if Missing
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! MakeRspecFileIfMissing()
ruby << EOF
  class MakesRspecFileIfMissing
    def self.for(buffer)
      if spec_file?(buffer) || already_exists?(spec_for_buffer(buffer))
        puts "Spec already exists"
        return
      end

      system 'mkdir', '-p', directory_for_spec(buffer)
      File.open(spec_for_buffer(buffer), File::WRONLY|File::CREAT|File::EXCL) do |file|
      file.write "require 'spec_helper'"
    end
  end

  private
  def self.spec_file?(file)
    file.match(/.*_spec.rb$/)
  end

  def self.already_exists?(b)
    File.exists?(b)
  end

  def self.spec_for_buffer(b)
    spec_buffer = b.sub('/app/', '/spec/app/')
    spec_buffer.sub!('/lib/', '/spec/lib/')
    spec_buffer.sub!('/rule/', '/spec/rule/')
    spec_buffer.sub!('/chain/', '/spec/chain/')
    spec_buffer.sub!('/priority/', '/spec/priority/')
    spec_buffer.sub!('.rb', '_spec.rb')
    return spec_buffer
  end

  def self.directory_for_spec(b)
    File.dirname(self.spec_for_buffer(b))
  end
  end
  buffer = VIM::Buffer.current.name
  MakesRspecFileIfMissing.for(buffer)
EOF
endfunction

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

" gcmt/taboo.vim
nnoremap <localleader>tn :TabooRename
set sessionoptions+=tabpages,globals

" Untitled Documents
if has("autocmd")
  autocmd FocusLost silent! :wa
endif

" The Silver Searcher
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif

" Insert javascriptreact
map <leader>jsr :call JSR()<CR>

function! JSR()
  r ~/.vim/boilerplate/javascriptreact.txt
endfunction

" Look for todos in jsx files
noremap <leader>jstt :noautocmd vimgrep /TODO/j **/*.jsx<CR>:cw<CR>

" vimrc
" make it easy to source and load vimrc
let $TIMVIMRC = $HOME."/.vimrc"
nnoremap <leader>ve :vsplit $TIMVIMRC<cr>
" Source vim configuration file whenever it is saved
if has ('autocmd')
 augroup Reload_Vimrc
    autocmd!
    autocmd! BufWritePost $TIMVIMRC source % | echom "Reloaded " . $TIMVIMRC | redraw |  AirlineRefresh
  augroup END
endif

" hosts
" make it easy to view hosts file - cannot edit
nnoremap <leader>he :vsplit /etc/hosts<cr>

" viminfo - don't need
:set viminfo=

" Load session if it exists
function! LoadSession()
  let b:sessionfile = "Session.vim"
  if (filereadable(b:sessionfile))
    exe 'source ' b:sessionfile
  else
    echo "No session loaded."
  endif
endfunction

if has ('autocmd')
 augroup Source_Session
    autocmd!
    au VimEnter * nested :call LoadSession()
  augroup END
endif
