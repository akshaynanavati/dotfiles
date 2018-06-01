"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"       Akshay Nanavati
"
" Source:
"       https://github.com/akshaynanavati/dotfiles/blob/master/vimrc
"
" Based on:
"       Amir Salihefendic's (http://amix.dk - amix@amix.dk) vimrc version 5.0 found at
"       http://amix.dk/blog/post/19691#The-ultimate-Vim-configuration-on-Github
"
" Sections:
"    -> Plugins [PLGN]
"    -> General [GNRL]
"    -> VIM user interface [VUI]
"    -> Colors and Fonts [CAF]
"    -> Files and backups [FAB]
"    -> Text, tab and indent related [TTIR]
"    -> Visual mode related [VMR]
"    -> Moving around, tabs and buffers [MATB]
"    -> Status line [STATL]
"    -> Editing mappings [EDMP]
"    -> vimgrep searching and cope displaying [VSCD]
"    -> Spell checking [SPLC]
"    -> Misc [MISC]
"    -> Helper functions [HLFN]
"    -> Language Specific [LASP]
"    -> Linters [LNTR]
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins [PLGN]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

set rtp+=~/.fzf
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'w0rp/ale'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
let NERDTreeIgnore = ['\.pyc$', '\.o$']
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'sheerun/vim-polyglot'
Plug 'w0ng/vim-hybrid'
Plug 'majutsushi/tagbar'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'akshaynanavati/a.vim'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General [GNRL]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off

" Sets how many lines of history VIM has to remember
set history=1000

" Enable filetype plugins
filetype plugin on
" filetype indent on
filetype on

" Set to auto read when a file is changed from the outside
set autoread
set autowriteall

let mapleader = ' '
let g:mapleader = ' '

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface [VUI]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler
set number
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" put $ at end of line
set list
set listchars=eol:$,tab:\|~

" cursorline only in active buffer
set cursorline
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

imap jk <esc>

nnoremap <leader><leader> :only<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts [CAF]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting

set t_Co=256
let g:hybrid_custom_term_colors = 1
colorscheme hybrid

syntax enable
set background=dark

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Make other lines light gray
highlight LineNr ctermfg=lightgray

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related [TTIR]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=0

set ai "Auto indent
set wrap "Wrap lines

""""""""""""""""""""""""""""""
" => Visual mode related [VMR]
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" Binding ctrl+cc / ctrl+vv for osx clipboard
vmap <C-c><C-c> y:call system("pbcopy", getreg("\""))<CR>

vnoremap < <gv
vnoremap > >gv

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers [MATB]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
set splitbelow
set splitright

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
set swb=useopen
nnoremap <leader>b :Buffers<CR>

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

nnoremap <C-p> :Files<CR>

map <C-n> :NERDTreeToggle<CR>
map <leader>n :NERDTreeFind<CR>
nmap <leader>t :TagbarToggle<CR>

nmap <leader>] :YcmCompleter GoToDefinitionElseDeclaration<CR>

function! YcmGoToVertical()
  execute 'vs'
  execute 'YcmCompleter GoToDefinitionElseDeclaration'
endfunction
command! -nargs=0 JV :call YcmGoToVertical()

function! YcmGoToHorizontal()
  execute 'sp'
  execute 'YcmCompleter GoToDefinitionElseDeclaration'
endfunction
command! -nargs=0 JH :YcmGoToHorizontal()

nmap <leader>= <C-w>=
nmap <leader>f :exe "vertical resize +10"<CR>
nmap <leader>a :exe "vertical resize -10"<CR>
nmap <leader>d :exe "resize -10"<CR>
nmap <leader>s :exe "resize +10"<CR>

""""""""""""""""""""""""""""""
" => Status line [STATL]
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings [EDMP]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>p "0p
map <leader>P "0P

" Delete trailing white space on save, useful for Python
func! DeleteTrailingWS()
  if expand('%') =~ 'vimrc'
    return
  endif

  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite * :call DeleteTrailingWS()

map <leader>o o<esc>
nnoremap <leader>u :GitGutterUndoHunk<CR>
map <C-I> :YcmCompleter FixIt<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying [VSCD]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <leader>g :Ack!<Space>$
let g:ackprg = 'ag --vimgrep'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc [MISC]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>

" Toggle paste mode on and off
nmap <leader>sp :setlocal paste!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions [HLFN]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

function! LinuxFormatting()
    setlocal tabstop=8
    setlocal shiftwidth=8
    setlocal softtabstop=8
    setlocal textwidth=80
    setlocal noexpandtab

    setlocal cindent
    setlocal formatoptions=tcqlron
    setlocal cinoptions=:0,l1,t0,g0
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Language Specific [LASP]
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufReadPost *.py nmap <leader>pd oimport ipdb; ipdb.set_trace()<Esc>
au BufReadPost *.py nmap <leader>Pd Oimport ipdb; ipdb.set_trace()<Esc>
au BufReadPost *.py nmap <leader>pp ofrom pprint import pprint as pp<Esc>
au BufReadPost *.py nmap <leader>Pp Ofrom pprint import pprint as pp<Esc>
au BufReadPost *.py normal!zR
au! FileType python setl nosmartindent
au FileType python setl sw=4 sts=4 et
au FileType cpp setl sw=2 sts=2 et
au FileType c setl sw=2 sts=2 et

au FileType go set listchars=eol:$,tab:\|\ 
let g:go_fmt_fail_silently = 1
set cino=N-s


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Linters [LNTR]
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_identifier_candidate_chars = 4
let g:ycm_error_symbol = 'x'
let g:ycm_warning_symbol = '!'
let g:ale_fixers = {
\   'cpp': ['clang-format'],
\   'c': ['clang-format'],
\   'py': ['autopep8'],
\   'rust': ['rustfmt'],
\}

let g:ale_linters = {
\   'cpp': [],
\   'py': [],
\   'rust': ['cargo'],
\}

let g:ale_fix_on_save = 1

execute printf('source %s/%s', $HOME, '.vimrc.local')
