execute pathogen#infect('~/.vimbundles/{}')

if exists('g:loaded_pathogen')
  call pathogen#helptags()
endif

" General behavior
behave xterm
set nocompatible

" IndentLine Plugin Color
let g:indentLine_color_term = 239

" Set mapleader
let mapleader = ","
let g:mapleader = ","
let localleader = '\'

" Let's make escape better, together.
inoremap jj <Esc>

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
set t_Co=256
set background=dark
colorscheme jellybeans-joel
" colorscheme Jellybeans
" colorscheme molokai
" colorscheme grb256
" colorscheme railscasts
" colorscheme railscasts2
" colorscheme darkburn
" colorscheme twilight256
filetype plugin indent on
filetype plugin on

if $TERM == '^\%(screen\|xterm-color\)$' && t_Co == 8
  set t_Co=256
endif

set laststatus=2   " Always show the statusline
set noshowmode
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'airlineish'

" Make Vim awesomer
set autoindent
set backupdir=~/.vimbackupdir,~/tmp,~/,.
set directory=~/.vimbackupdir,~/tmp,~/,.
" set dictionary="/usr/dict/words"
set expandtab
set guifont=Monaco:h16
set guioptions-=T guioptions-=e guioptions-=L guioptions-=r
set listchars=tab:⇀\ ,trail:␠
set matchpairs+=<:>
set modeline
set modelines=5
set number
" Make line numbers red
highlight LineNr term=bold cterm=NONE ctermfg=DarkRed ctermbg=NONE gui=NONE guifg=DarkRed guibg=NONE
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
set encoding=utf-8
" allow cursor keys to move from line to line when going from left to right,
" regardless of whether in or not in insert mode
set whichwrap=b,s,h,l,<,>,[,]
" allow backspace to delete characters before the cursor
" the 3 options tell vim to delete white space at start of the line,
" a line break, and the character before where Insert mode started
set backspace=indent,eol,start
set mouse=a " sometimes you want a mouse
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

au! BufRead,BufNewFile *.rb
au! BufRead,BufNewFile *.xml
au BufNewFile,BufRead *.scss set filetype=sass

" TODO - Not using this
" CocoaPods
" au BufNewFile,BufRead Podfile,*.podspec      set filetype=ruby

augroup vimrc
  autocmd!
  autocmd GuiEnter * set columns=120 lines=70 number
augroup END

" Clean up XML files (visual mode)
vmap <silent> <leader>x :!tidy -qi -raw -xml<CR>:se filetype=xml<CR>

" run selection in bash
vmap <leader>rs :!bash <CR>

" Ctags make the world a better place
" Based on code from https://github.com/spicycode/Vimlander-2-The-Quickening
" Add RebuildTagsFile function/command
function! s:RebuildTagsFile()
  silent !ctags -R --exclude=coverage --exclude=files --exclude=log --exclude=tmp --exclude=vendor *
endfunction
command! -nargs=0 RebuildTagsFile call s:RebuildTagsFile()

set tags=./tags;
map <Leader>rt :RebuildTagsFile<cr>

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
let g:NERDTreeBookmarksFile = '/Users/timcmartin/Dotfiles/NERDTreeBookmarks'
" Show hidden files
let NERDTreeShowHidden = 0
" Don't hijack NETRW
" let NERDTreeHijackNetrw = 0
let NERDTreeHijackNetrw = 1
let NERDTreeIgnore=['\.$', '\~$']
" NERDTree Window size
" let g:NERDTreeWinSize = 40

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

" Copy current Vim paste register to clipboard
map <F2> :PBCopy<cr>
" Toggle between paste and nopaste, shows which one is active
map <F3> :set paste!\|set paste?<cr>

set clipboard=unnamed
xnoremap p pgvy

" sudo save with w!!
cmap w!! w !sudo tee % >/dev/null

" comment
nmap \\ <plug>NERDCommenterToggle<CR>
vmap \\ <plug>NERDCommenterToggle<CR>

" Silver Searcher and Control P
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor

  nnoremap <leader>a :Ag

  " Use the Silver Searcher
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:20,results:20'
  let g:ctrlp_tabpage_position = 'ac'
  let g:ctrlp_map = '<c-p>'
  let g:ctrlp_cmd = 'CtrlP'
  let g:ctrlp_working_path_mode = 'ra'
  " Ensure max height isn't too large. (for performance)
  let g:ctrlp_max_height = 20

  map <leader>gn :CtrlP<cr>
  map <leader>gv :CtrlP app/views<cr>
  map <leader>gc :CtrlP app/controllers<cr>
  map <leader>gm :CtrlP app/models<cr>
  map <leader>gh :CtrlP app/helpers<cr>
  map <leader>gd :CtrlP app/decorators<cr>
  map <leader>gi :CtrlP app/infrastructure<cr>
  map <leader>gl :CtrlP lib<cr>
  map <leader>gp :CtrlP public<cr>
  map <leader>gs :CtrlP public/stylesheets<cr>
  nnoremap <leader>. :CtrlPTag<cr>

  " shortcut for a new tab and Ag
  nmap <leader>n :call NewTabAndAg()<cr>
  function! NewTabAndAg()
    :tabnew
    :Ag
  endfunction
endif

" rails specific mappings
map <leader>gr :topleft :split config/routes.rb<cr>
map <leader>gg :topleft 100 :split Gemfile<cr>

" switch between last two files
nnoremap <leader><leader> <c-^>

" bubble text
map <C-J> ddp
map <C-K> ddkP

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
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<CR>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

" Easier split navigation
" Use ctrl-[hjkl] to select the active split!
" Use ctrl-w[hjkl] to select the active split!
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
" This is overwritten by hashrocket
" nmap <silent> <C-l> :wincmd l<CR>
" nmap <silent> <C-Z> :retab<CR> :Trim<CR>

" window behavior
set splitbelow  " Open new horizontal split windows below current
set splitright  " Open new vertical split windows to the right
set switchbuf=useopen,usetab ",split  " Don't change current buffer on quickfix
set winminheight=1  " 1 height windows

" Switch from ruby 1.8 hash to ruby 1.9 hash
map <silent> <leader>rh :%s/:\(\w*\)\s*=>\s*\(\w*\)/\1: \2/g<CR>

" let g:rspec_command = 'call Send_to_Tmux("zeus rspec {spec}\n")'
" let g:rspec_command = 'call Send_to_Tmux("be zeus rspec {spec}\n")'
let g:rspec_command = 'call Send_to_Tmux("be rspec {spec}\n")'
map <leader>s :call RunCurrentSpecFile()<CR>
" map <leader>s :call RunNearestSpec()<CR>
map <leader>l :call RunLastSpec()<CR>
map <leader>as :call RunAllSpecs()<CR>

" Run Go tests
nmap <leader>g :Tmux go test<CR>

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

" Make line completion easier.
" imap <C-l> <C-x><C-l>

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
" command! -bar -range=% Trim :<line1>,<line2>s/\s\+$//e

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
let g:syntastic_enable_signs=1 "show markers next to each error/warning
let g:syntastic_auto_loc_list=0 "don't pop up the Errors list automatically
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': ['scss'] }

" vimwiki
let g:vimwiki_list = [ {'path': '~/Dropbox/vimwiki/recipes'}, {'path': '~/Dropbox/vimwiki/dev'}, {'path': '~/Dropbox/vimwiki/guitarrig'}, {'path': '~/Dropbox/vimwiki/personal'}, {'path': '~/Dropbox/vimwiki/house'}, {'path': '~/Dropbox/vimwiki/cabin'}, {'path': '~/Dropbox/vimwiki/getty'}, {'path': '~/Dropbox/vimwiki/travel'}, {'path': '~/Dropbox/vimwiki/work'}, {'path': '~/Dropbox/SixSafety/vimwiki/', 'ext': '.md'}]
let g:vimwiki_hl_headers = 1
let g:vimwiki_nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'ruby': 'rb', 'cmd': 'sh'}

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
  autocmd BufWritePre *.py,*.coffee,*.rb,*.feature,*.slim,*.md,*.wiki silent! :StripTrailingWhiteSpace
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

" Write Buffer
" Writes the current buffer unless we're the in QuickFix mode.
" ---------------
" function WriteBuffer()
  " if &filetype == "qf"
    " execute "normal! \<enter>"
  " else
    " :write
  " endif
" endfunction

" noremap <silent> <enter> :call WriteBuffer()<CR>

" sass highlighting for slim files
" -----------------
autocmd BufNewFile,BufRead *.slim set ft=sass

" HTML highlighting for smarty templates
" -----------------
au BufRead,BufNewFile *.tpl set filetype=smarty 

" Tagbar
nmap  <F8> :TagbarToggle<CR>

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

noremap <Leader>t :noautocmd vimgrep /TODO/j **/*.rb<CR>:cw<CR>

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
