" :PlugInstall, :PlugUpdate, :PlugClean
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif
call plug#begin('~/.vim/plugged')

" ---------- plugins ---------
Plug 'mileszs/ack.vim'
Plug 'rking/ag.vim'
Plug 'dense-analysis/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/calendar-vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'gregsexton/gitv'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mortice/pbcopy.vim'
Plug 'bbatsov/rubocop'
Plug 'AndrewRadev/switch.vim'
Plug 'scrooloose/syntastic'
Plug 'godlygeek/tabular'
Plug 'majutsushi/tagbar'
Plug 'edkolev/tmuxline.vim'
Plug 'freitass/todo.txt-vim'
Plug 'csexton/trailertrash.vim'
Plug 'jgdavey/tslime.vim'
Plug 'tpope/vim-abolish'
Plug 'danilo-augusto/vim-afterglow'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'paranoida/vim-airlineish'
Plug 'burnettk/vim-angular'
Plug 'jgdavey/vim-blockle'
Plug 'duff/vim-bufonly'
Plug 'tpope/vim-bundler'
Plug 'alvan/vim-closetag'
Plug 'timcmartin/vim-colorschemes'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-dotenv'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-haml'
Plug 'aquach/vim-http-client'
Plug 'w0ng/vim-hybrid'
Plug 'wgibbs/vim-irblack'
Plug 'Quramy/vim-js-pretty-template'
Plug 'leshill/vim-json'
Plug 'plasticboy/vim-markdown'
Plug 'andymass/vim-matchup'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-projectionist'
Plug 'therubymug/vim-pyte'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-rails'
Plug 'jgdavey/vim-railscasts'
Plug 'tpope/vim-rake'
Plug 'clarke/vim-renumber'
Plug 'tpope/vim-repeat'
Plug 'thoughtbot/vim-rspec'
Plug 'vim-ruby/vim-ruby'
Plug 'ecomba/vim-ruby-refactoring'
Plug 'mhinz/vim-signify'
Plug 'slim-template/vim-slim'
Plug 'adamlowe/vim-slurper'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'skalnik/vim-vroom'
Plug 'posva/vim-vue'
Plug 'wesQ3/vim-windowswap'
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

let g:coc_global_extensions = ['coc-json', 'coc-solargraph', 'coc-tsserver']

autocmd BufNew,BufEnter *.wiki,*.md execute "silent! CocDisable"
autocmd BufLeave *.wiki,*.md execute "silent! CocEnable"

" General behavior
behave xterm
set nocompatible
set encoding=utf-8
scriptencoding utf-8

" IndentLine Plugin Color
let g:indentLine_color_term = 239

" Set mapleader
let mapleader = ","
let g:mapleader = ","
let localleader = '\'

" Let's make escape better, together.
inoremap jj <Esc>

" Delete visual selection and paste default register
vnoremap <leader>p "_dP

" HTTP_CLIENT
let g:http_client_bind_hotkey = 1

" Convenience mapping of semicolon
map ; :
noremap ;; ;

" TODO - I don't know what this does yet
nnoremap <leader>css :g#\({\n\)\@<=#.,/}/sort<cr>

" Highlight search word under cursor without jumping to next
nnoremap <leader>h *<C-O>

" Appearanace and colour
syntax on
colorscheme molokai_tim
set background=dark
set t_Co=256
filetype plugin indent on
filetype plugin on

" Transparent Linux Background // needs to go after colorscheme
" hi Normal guibg=NONE ctermbg=NONE
" hi NonText guibg=NONE ctermbg=NONE
" Make line numbers red
" hi LineNr term=bold cterm=NONE ctermfg=DarkRed ctermbg=NONE gui=NONE guifg=DarkRed guibg=NONE
" remove underline from line numbers and current line yellow
" hi CursorLineNr term=bold cterm=bold ctermfg=11 gui=bold

if $TERM == '^\%(screen\|xterm-color\)$' && t_Co == 8
  set t_Co=256
endif

" Status Line
set laststatus=2   " Always show the statusline
set noshowmode
let g:airline_powerline_fonts = 1
" Last used buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'afterglow'

" Make Vim awesomer
set autoindent
set backupdir=~/.vimbackupdir,~/tmp,~/,.
set directory=~/.vimbackupdir,~/tmp,~/,.
set expandtab
set guifont=Monaco:h16
set guioptions-=T guioptions-=e guioptions-=L guioptions-=r
set listchars=tab:⇀\ ,trail:␠
set matchpairs+=<:>
set modeline
set modelines=5
set number
set wrap
set linebreak
set ruler
set shell=bash
set shiftwidth=2
set showmatch
set sts=2
set tabstop=2
set tildeop
set visualbell
set wildmenu
set wildmode=longest,list,full
set wildignore+=*.o,*.obj,.git,tmp/**,public/uploads/**
set autoread " auto read file if it has changed outside of vim
set cmdheight=2    " Make the command area two lines high
" allow cursor keys to move from line to line when going from left to right,
" regardless of whether in or not in insert mode
set whichwrap=b,s,h,l,<,>,[,]
" allow backspace to delete characters before the cursor
" the 3 options tell vim to delete white space at start of the line,
" a line break, and the character before where Insert mode started
set backspace=indent,eol,start
" set mouse=a " sometimes you want a mouse
set nofoldenable " I rarely use folds
set title          " Set the title of the window in the terminal to the file
set titlestring='Powerslave'
if exists('+colorcolumn')
  set colorcolumn=80 " Color the 80th column differently as a wrapping guide.
endif
set cursorline    " Supposed to Show a line under the cursor line
                  " Instead makes the line number coloured
set scrolloff=3   " Keep three lines below the last line when scrolling

" Persistent Undo
if has('persistent_undo')
  set undodir=~/.vimbackupdir/.undo
  set undofile
endif

" File type highlighting
au! BufRead,BufNewFile *.rb
au! BufRead,BufNewFile *.xml
au BufNewFile,BufRead *.scss set filetype=sass
" autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
" au! BufNewFile,BufRead *.md

augroup vimrc
  autocmd!
  autocmd GuiEnter * set columns=120 lines=70 number
augroup END

" Clean up XML files (visual mode)
vmap <silent> <leader>x :!tidy -qi -raw -xml<CR>:se filetype=xml<CR>

" run selection in bash
vmap <leader>rs :!bash <CR>

" Run rake from Rails files
autocmd User Rails nnoremap <buffer> <D-r> :<C-U>Rake<CR>
autocmd User Rails nnoremap <buffer> <D-R> :<C-U>.Rake<CR>

" NERDTree
" find the current file
map <silent> <leader>f :NERDTree<CR>:wincmd l<CR>:NERDTreeFind<CR>
map <leader>dc :NERDTreeTabsClose<cr>
map <leader>do :NERDTree<cr>
" Autoload NERDTree
" let g:nerdtree_tabs_open_on_console_startup = 1
nnoremap <silent><c-n> :NERDTreeTabsToggle<cr>
vnoremap <silent><c-n> :NERDTreeTabsToggle<cr>
" Enable nice colors
let NERDChristmasTree = 1
" Make it easy to see where we are
let NERDTreeHighlightCursorline = 1
" Make bookmarks visible
let NERDTreeShowBookmarks = 1
let g:NERDTreeBookmarksFile = $HOME . '/Dotfiles/NERDTreeBookmarks'
" Show hidden files
let NERDTreeShowHidden = 0
" Don't hijack NETRW
" let NERDTreeHijackNetrw = 0
let NERDTreeHijackNetrw = 1
let NERDTreeIgnore=['\.$', '\~$']
" NERDTree Window size
let g:NERDTreeWinSize = 40

" clear search
nmap <silent> ,/ :nohlsearch<CR>

" Searching Stuff
" I prever very magic (\v) search behavior
nnoremap / /\v
vnoremap / /\v
set hlsearch "set hl search
set incsearch "set incsearch
set ignorecase "set ignore case for search
set smartcase "be case sensitive if search has cap letter
set gdefault " /g flag on :s substitutions to replace all matches in a line:
nnoremap <leader><space> :noh<cr>  " remove highlight from search matches

" Search for highlighted text with //
vnoremap // y/<C-R>"<CR>

" Copy current Vim paste register to clipboard
map <F2> :PBCopy<cr>
" Toggle between paste and nopaste, shows which one is active
map <F3> :set paste!\|set paste?<cr>

set clipboard=unnamed
xnoremap p pgvy

" sudo save with w!!
cmap w!! w !sudo tee % >/dev/null

" NERDcommenter
nmap \\ <plug>NERDCommenterToggle<CR>
vmap \\ <plug>NERDCommenterToggle<CR>
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDDefaultAlign = 'left'

" Fugitive remaps
nmap <leader>gs :G<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>

" fzf
set rtp+=/usr/local/opt/fzf
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
nnoremap <c-p> :FZF<cr>
augroup fzf
  autocmd!
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
nnoremap <leader>gb :GBranches<CR>

" Gutentags
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = ['package.json', '.git']
let g:gutentags_cache_dir = expand('~/.cache/vim/ctags/')
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 1
let g:gutentags_ctags_extra_args = [ '--tag-relative=yes', '--fields=+ailmnS' ]
let g:gutentags_ctags_exclude = [ '.git', '.svg', '.hg', '/tests/', '/spec/', 'build', 'dist', 'sites//files/', 'bin', 'node_modules', 'bower_components', 'cache', 'compiled', 'docs', 'example', 'bundle', 'vendor', '.md', '-lock.json', '.lock', 'bundle.js', 'build.js', '.rc', '.json', '.min.', '.map', '.bak', '.zip', '.pyc', '.class', '.sln', '.Master', '.csproj', '.tmp', '.csproj.user', '.cache', '.pdb', 'tags', 'cscope.', '.css', '.less', '.scss', '.exe', '.dll', '.mp3', '.ogg', '.flac', '.swp', '.swo', '.bmp', '.gif', '.ico', '.jpg', '.png', '.rar', '.zip', '.tar', '.tar.gz', '.tar.xz', '.tar.bz2', '.pdf', '.doc', '.docx', '.ppt', '.pptx' ]
command! -nargs=0 GutentagsClearCache call system('rm ' . g:gutentags_cache_dir . '/*')

" Configure FZF to find ctags
" https://github.com/junegunn/fzf/wiki/Examples-(vim)#jump-to-tags
function! s:tags_sink(line)
  let parts = split(a:line, '\t\zs')
  let excmd = matchstr(parts[2:], '^.*\ze;"\t')
  execute 'silent e' parts[1][:-2]
  let [magic, &magic] = [&magic, 0]
  execute excmd
  let &magic = magic
endfunction
function! s:tags()
  if empty(tagfiles())
    echohl WarningMsg
    echom 'Preparing tags'
    echohl None
    call system('ctags -R --exclude=.git --exclude=node_modules --html-kinds=-ij')
  endif

  call fzf#run({
  \ 'source':  'cat '.join(map(tagfiles(), 'fnamemodify(v:val, ":S")')).
  \            '| grep -v -a ^!',
  \ 'options': '+m -d "\t" --with-nth 1,4.. -n 1 --tiebreak=index',
  \ 'down':    '40%',
  \ 'sink':    function('s:tags_sink')})
endfunction
command! Tags call s:tags()
" This screws up 'back' functionality when following tags
" nnoremap <C-t> :Tags<CR>
" nmap <C-t> :Tags<CR>

" Open tag in new window
" nnoremap <silent><Leader><C-]> <C-w><C-]><C-w>T
nnoremap <C-]> <C-w><C-]><C-w>T

" Map arrows to visual line movement
noremap <buffer> <silent> <Up> gk
noremap <buffer> <silent> <Down> gj
noremap  <buffer> <silent> <Home> g<Home>
noremap  <buffer> <silent> <End> g<End>

" -------------------------------------
"  Managing Tabs & Navigation
" -------------------------------------
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
" Temporarily disabling - double t issues
" nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<CR>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

" Easier split navigation
" Use ctrl-[hjkl] to select the active split!
" Use ctrl-w[hjkl] to select the active split!
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>

" window behavior
set splitbelow  " Open new horizontal split windows below current
set splitright  " Open new vertical split windows to the right
set switchbuf=useopen,usetab ",split  " Don't change current buffer on quickfix
set winminheight=1  " 1 height windows

" Switch from ruby 1.8 hash to ruby 1.9 hash
map <silent> <leader>rh :%s/:\(\w*\)\s*=>\s*\(\w*\)/\1: \2/g<CR>

" Vim-Rspec and Tslime
" let g:tslime_always_current_session = 1
" let g:tslime_always_current_window = 1
let g:rspec_command = 'call Send_to_Tmux("bundle exec rspec {spec}\n")'
map <leader>t :call RunCurrentSpecFile()<CR>
map <leader>s :call RunNearestSpec()<CR>
map <leader>l :call RunLastSpec()<CR>
map <leader>as :call RunAllSpecs()<CR>

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
      spec_buffer = b.sub('/app/', '/spec/')
      spec_buffer.sub!('/lib/', '/spec/lib/')
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
" command! -nargs=0 MakeRspecFileIfMissing call MakeRspecFileIfMissing()
map <leader>grs :call MakeRspecFileIfMissing()<CR>

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

" Fixes common typos
command! W w
command! Q q
map <F1> <Esc>
imap <F1> <Esc>
" Crazy flying pinky
cnoremap w' w<CR>

" Yank entire buffer with gy
nmap gy :%y+<cr>

" Make Y behave like other capital commands.
" Hat-tip http://vimbits.com/bits/11
nnoremap Y y$

" Jump to beginning and end of lines easier. From http://vimbits.com/bits/16
noremap H ^
noremap L $

" make it easy to source and load vimrc
:nnoremap <leader>ve :vsplit $MYVIMRC<cr>
" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost $HOME/.vimrc source $HOME/.vimrc
endif

" Trim command to remove random whitespace.
command! -bar -range=% Trim :<line1>,<line2>s/\s\+$//e

" Turn the current split into a new tab
function! SplitToTab()
  :tab split
  :normal! gT
  :q
  :normal! gt
endfunction
command! -nargs=0 SplitToTab call SplitToTab()

" I don't need time that often, but when I do I hate having to remember how to
command! InsertTime :normal a<c-r>=strftime('%F %H:%M:%S.0 %z')<cr>

" Syntastic.  Awesome syntax error checking for js, ruby, etc...
" let g:syntastic_enable_signs=1 "show markers next to each error/warning
" let g:syntastic_auto_loc_list=0 "don't pop up the Errors list automatically
" let g:syntastic_mode_map = { 'mode': 'active',
"                            \ 'active_filetypes': [],
"                            \ 'passive_filetypes': ['scss'] }
" let g:syntastic_javascript_checkers = ['eslint']
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_enable_signs=1 "show markers next to each error/warning
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_loc_list_height = 5
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 1
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_error_symbol = '❌'
" let g:syntastic_style_error_symbol = '⁉️'
" let g:syntastic_warning_symbol = '⚠️'
" let g:syntastic_style_warning_symbol = '💩'
" highlight link SyntasticErrorSign SignColumn
" highlight link SyntasticWarningSign SignColumn
" highlight link SyntasticStyleErrorSign SignColumn
" highlight link SyntasticStyleWarningSign SignColumn

" vimwiki
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

" SixSafety
let vimwiki_sixsafety = {}
let vimwiki_sixsafety.path = '~/Dropbox/vimwiki/sixsafety/'
let vimwiki_sixsafety.path_html = ''
let vimwiki_sixsafety.syntax = 'default'
let vimwiki_sixsafety.ext = '.wiki'
let vimwiki_sixsafety.name = 'SixSafety'

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

let g:vimwiki_list = [vimwiki_aws, vimwiki_getty, vimwiki_cabin, vimwiki_dev, vimwiki_guitar, vimwiki_house, vimwiki_personal, vimwiki_recipes, vimwiki_sixsafety, vimwiki_temp, vimwiki_travel, vimwiki_express]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

let g:vimwiki_hl_headers = 1
let g:vimwiki_nested_syntaxes = {'python':'python', 'c++':'cpp', 'ruby':'ruby', 'cmd':'sh'}
let g:automatic_nested_syntaxes = 1
au BufRead,BufNewFile *.wiki set filetype=vimwiki
:autocmd FileType vimwiki map <leader>d :VimwikiMakeDiaryNote

" Calendar
function! ToggleCalendar()
  execute ":Calendar"
  if exists("g:calendar_open")
    if g:calendar_open == 1
      execute "q"
      unlet g:calendar_open
    else
      g:calendar_open = 1
    end
  else
    let g:calendar_open = 1
  end
endfunction
:autocmd FileType vimwiki map <leader>c :call ToggleCalendar()

" More Autocommands
if has("autocmd")
  " No more complaining about untitled documents
  autocmd FocusLost silent! :wa

  " When editing a file, always jump to the last cursor position.
  " This must be after the uncompress commands.
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line ("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif

  " Fix trailing whitespace in my most used programming langauges
  " Preferred Trimming
  autocmd BufWritePre *.py,*.coffee,*.rb,*.feature,*.slim,*.md,*.wiki silent! :StripTrailingWhiteSpace
  " Non-unisporkal stripping
  " autocmd BufWritePre *.py,*.feature,*.md,*.wiki silent! :StripTrailingWhiteSpace
endif

" Strip Trailing White Space
" ---------------
" From http://vimbits.com/bits/377
" Preserves/Saves the state, executes a command, and returns to the saved state
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

"strip all trailing white space
command! StripTrailingWhiteSpace :call Preserve("%s/\\s\\+$//e")<CR>
command! Trim :call Preserve("%s/\\s\\+$//e")<CR>

" Paste using Paste Mode
" Keeps indentation in source.
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

" yank/paste to/from clipboard
noremap <silent> <leader>y "*y
noremap <silent> <leader>Y "*Y
noremap <silent> <leader>p "*p
noremap <silent> <leader>P "*P

" paste without yanking replaced text in visual mode
vnoremap <silent> p "_dP
vnoremap <silent> P "_dp

" sass highlighting for slim files
" -----------------
autocmd BufNewFile,BufRead *.slim set ft=sass

" HTML highlighting for smarty templates
" -----------------
au BufRead,BufNewFile *.tpl set filetype=smarty
" ES6 Javascript Highlighting
autocmd BufRead,BufNewFile *.es6 setfiletype javascript

" Close Open Buffers
function! Wipeout()
  " list of *all* buffer numbers
  let l:buffers = range(1, bufnr('$'))

  " what tab page are we in?
  let l:currentTab = tabpagenr()
  try
    " go through all tab pages
    let l:tab = 0
    while l:tab < tabpagenr('$')
      let l:tab += 1

      " go through all windows
      let l:win = 0
      while l:win < winnr('$')
        let l:win += 1
        " whatever buffer is in this window in this tab, remove it from
        " l:buffers list
        let l:thisbuf = winbufnr(l:win)
        call remove(l:buffers, index(l:buffers, l:thisbuf))
      endwhile
    endwhile

    " if there are any buffers left, delete them
    if len(l:buffers)
      execute 'bwipeout' join(l:buffers)
    endif
  finally
    " go back to our original tab page
    execute 'tabnext' l:currentTab
  endtry
endfunction

" Tagbar
nmap  <F8> :TagbarToggle<CR>

let g:tagbar_type_typescript = {
  \ 'ctagstype': 'typescript',
  \ 'kinds': [
    \ 'c:classes',
    \ 'n:modules',
    \ 'f:functions',
    \ 'v:variables',
    \ 'v:varlambdas',
    \ 'm:members',
    \ 'i:interfaces',
    \ 'e:enums',
  \ ]
\ }

let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }

if executable('ripper-tags')
  let g:tagbar_type_ruby = {
      \ 'kinds'      : ['m:modules',
                      \ 'c:classes',
                      \ 'C:constants',
                      \ 'F:singleton methods',
                      \ 'f:methods',
                      \ 'a:aliases'],
      \ 'kind2scope' : { 'c' : 'class',
                       \ 'm' : 'class' },
      \ 'scope2kind' : { 'class' : 'c' },
      \ 'ctagsbin'   : 'ripper-tags',
      \ 'ctagsargs'  : ['-f', '-']
      \ }
endif

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

noremap <Leader>tt :noautocmd vimgrep /TODO/j **/*.rb<CR>:cw<CR>

" Windowswap
let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <silent> <leader>yw :call WindowSwap#MarkWindowSwap()<CR>
nnoremap <silent> <leader>pw :call WindowSwap#DoWindowSwap()<CR>
nnoremap <silent> <leader>wm :call WindowSwap#EasyWindowSwap()<CR>

" Switch
let g:switch_mapping = "-"

" Date & Time
:nnoremap <F5> "=strftime("%b %d, %Y")<CR>P
:inoremap <F5> <C-R>=strftime("%b %d, %Y")<CR>

" Relative Filename
nnoremap <Leader>fn :let @+ = expand("%")<CR>

" Format txt
nnoremap <Leader>txt :set ft=txt<CR>

" Format md
nnoremap <Leader>md :set ft=markdown<CR>

" Typescript for Angular
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" Closetags
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" Auto-pairs
au Filetype vimwiki let b:autopairs_loaded=1
au Filetype ruby let b:autopairs_loaded=1

" Javascript.vim
let g:used_javascript_libs = 'jquery, angularjs, angularui, angularuirouter, jasmine'

" Instant Markdown
let g:instant_markdown_autostart=0
nmap \md :InstantMarkdownPreview<CR>

" Insert puts caller
nnoremap <leader>wtf oputs "#" * 90<c-m>puts caller<c-m>puts "#" * 90<esc>

" Ale
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_linters = {'javascript': ['prettier', 'jscs'], 'ruby': ['rubocop']}
" let g:ale_linters = {'javascript': ['prettier', 'jscs']}
let g:ale_linters_explicit = 1
let g:ale_fixers = {'javascript': ['prettier', 'jscs']}
let g:ale_fix_on_save = 0
" Temp disable for js
" let g:ale_pattern_options = { '\.js$': {'ale_enabled': 0}}
let g:airline#extensions#ale#enabled = 1
highlight clear ALEErrorSign
highlight clear ALEWarningSign
map <leader>at :ALEToggle<CR>
nmap <silent> <leader>aj :ALENext<cr>
nmap <silent> <leader>ak :ALEPrevious<cr>

" Ctrlp
if executable("ag")
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Align GitHub-flavored Markdown tables
au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter> 
au FileType md vmap <Leader><Bslash> :EasyAlign*<Bar><Enter> 

" COC stuff
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
