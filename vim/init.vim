"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable compatibility with vi which can cause unexpected issues
set nocompatible

" Set the commands to save in history default number is 20
set history=500

" Enable type file detection so Vim can try to detect the type of file
filetype on

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to autoread when a file is changed from the outside
set autoread
au FocusGained,BufEnter * silent! checktime"

let mapleader=" "

" Enable mouse in all modes
set mouse=a

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set termguicolors

" Add numbers to the file.
set number

" Set offset lines
set scrolloff=7

" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on wildmenu (command line completion)
set wildmenu

" Ignore certain files in wildmenu
set wildignore=*.o,*~,*.pyc,*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
if has("win16") || has("win32")
	set wildignore+=.git\*,.hg\*,.svn\*
else
	set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" When searching try to be smart about cases
set ignorecase
set smartcase

" While searching through a file incrementally highlight matching characters as you type
set incsearch
set hlsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching words during a search
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" Highlight line and column underneath the cursor
set cursorline
set cursorcolumn

" Show partial command you type in the last line of the screen
set showcmd

" Show the mode you are on the last line.
set showmode

" Setting the split window to open as in a WM - qtile
set splitbelow splitright

" No annoying sound on errors
set noerrorbells
set novisualbell
set tm=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn syntax highlighting on.
syntax on

" Set regular expression engine automatically
set regexpengine=0

" Color scheme
try
    colorscheme slate
catch
endtry

set background=dark

" Setting the displayed encoding and the encoidng writte to the file UTF-8
set encoding=utf-8
set fileencoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use spaces instead of tabs
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

" If the current file type is HTML, set indentation to 2 spaces
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab

" Linebreak on 500 characters
set lbr
set tw=500

" Auto indent
set ai
" Smart indent
set si
" Wrap lines
set wrap

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Always show the status line
set laststatus=2

set statusline=
set statusline+=%7*\[%n]                                  "buffernr
set statusline+=%1*\ %<%F\                                "File+path
set statusline+=%2*\ %y\                                  "FileType
set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..) 
set statusline+=%5*\ %{&spelllang}\ %{HighlightSearch()}\  "Spellanguage & Highlight on?
set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
set statusline+=%9*\ col:%03c\                            "Colnr
set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.

hi User1 guifg=#ffdad8  guibg=#880c0e
hi User2 guifg=#000000  guibg=#F4905C
hi User3 guifg=#292b00  guibg=#f4f597
hi User4 guifg=#112605  guibg=#aefe7B
hi User5 guifg=#051d00  guibg=#7dcc7d
hi User7 guifg=#ffffff  guibg=#880c0e gui=bold
hi User8 guifg=#ffffff  guibg=#5b7fbb
hi User9 guifg=#ffffff  guibg=#810085
hi User0 guifg=#ffffff  guibg=#094afe

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" leader + s(plit) + x -> Split y axis (horizontally)
" leader + s(plit) + y -> Split x axis (vertically)
map <leader>y :split<space>
map <leader>x :vsplit<space>

" ctrl + j -> Navigate window down
" ctrl + k -> Navigate window up
" ctrl + h -> Navigate window left
" ctrl + l -> Navigate window right
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" ctrl + i -> Increase current window height
" ctrl + o -> Decrease current window height
" ctrl + u -> Increase current window width
" ctrl + p -> Decrease current window width
noremap <c-i> <c-w>+
noremap <c-o> <c-w>-
noremap <c-u> <c-w>>
noremap <c-p> <c-w><

" leader + c(reate) + t(ab) -> Open/Create file in new tab
nnoremap <leader>ct :tabedit<space>

" leader + b(uffer) + d(delete) -> Close current buffer
" leader + b(uffer) + A(ll) -> Close all buffers
map <leader>bd :Bclose<cr>:tabclose<cr>gT
map <leader>bA :bufdo bd<cr>

" leader + b(uffer) + j -> Next buffer
" leader + b(uffer) + k -> Previous buffer
map <leader>bj :bnext<cr>
map <leader>bk :bprevious<cr>

" leader + t(ab) + n(ew) -> Open new tab
" leader + t(ab) + o(open) -> Close all other tabs
" leader + t(ab) + c(close) -> Close current tab
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>

" alt + h -> Navigate previous tab
" alt + l -> Navigate next tab
map <a-h> :tabprevious<cr>
map <a-l> :tabnext<cr>

" leader + t(ab) + l(ast) -> Toggle between current tab and last accessed tab
let g:lasttab = 1
nmap <leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" leader + c(hange) + d(irectory) -> Change CWD of the directory of the opened buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" leader + A(ll) -> Select all text
nnoremap <leader>A ggVG

" j + k -> Esc
inoremap jk <esc>

" leader + e(xplore) -> Open a file explorer
" leader + o(open) -> Open a file from the explorer
map <leader>e :Lex<CR>
map <leader>o :Explore<CR>

" leader + r(replace) + w(ord) -> Replace all occurences of a word
nnoremap <leader>rw :%s/\<<c-r><c-w>\>//g<left><left>

" leader + r(egisters) -> View registers
nnoremap <leader>r <cmd>registers<CR>

" Moving lines in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '>-2<CR>gv=gv

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! HighlightSearch()
  if &hls
    return 'H'
  else
    return ''
  endif
endfunction
