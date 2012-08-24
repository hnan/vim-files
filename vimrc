"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Credits to the VIM community for many of the smart things in this file
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins to install
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" pathogen      --- https://github.com/tpope/vim-pathogen
" Command-T     --- http://www.vim.org/scripts/script.php?script_id=3025
" bufexplorer   --- http://www.vim.org/scripts/script.php?script_id=42
" nerdtree      --- https://github.com/scrooloose/nerdtree
" Ack           --- https://github.com/mileszs/ack.vim
" syntastic     --- https://github.com/scrooloose/syntastic
" SuperTab      --- http://www.vim.org/scripts/script.php?script_id=1643
" snipmate      --- https://github.com/msanders/snipmate.vim
" nerdcommenter --- https://github.com/scrooloose/nerdcommenter
" Powerline     --- https://github.com/Lokaltog/vim-powerline
" zencoding-vim --- https://github.com/mattn/zencoding-vim
" vim-jade      --- https://github.com/digitaltoad/vim-jade
" html5.vim     --- https://github.com/othree/html5.vim
" vim-less      --- https://github.com/groenewege/vim-less
" fugitive      --- https://github.com/tpope/vim-fugitive
" solzrized     --- https://github.com/altercation/vim-colors-solarized

" Note that Command-T requires ruby and the version of ruby linked with VIM 
" must be the same version you build Command-T
" Check ruby version with :ruby puts RUBY_VERSION
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


set nocompatible

call pathogen#infect()
call pathogen#helptags()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Faster keystroke
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","
nnoremap ; :
nnoremap : ;
inoremap jk <Esc>
noremap <Leader>s :update<CR>
inoremap <Leader>s <Esc>:update<CR>a

noremap j gj
noremap k gk

" Quick switch among windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <Leader>q <C-w>c

nnoremap <Leader><Leader>d :set bg=dark<CR>
nnoremap <Leader><Leader>l :set bg=light<CR>

" Quick tab navigation
map <D-1> 1gt
map <D-1> 1gt
map <D-2> 2gt
map <D-3> 3gt
map <D-4> 4gt
map <D-5> 5gt
map <D-6> 6gt
map <D-7> 7gt
map <D-8> 8gt
map <D-9> 9gt
nmap <Tab> gt
nmap <S-Tab> gT
nnoremap <silent> <C-t> :tabnew<CR>

" Buffer
noremap <C-tab> :bn<CR>
noremap <C-S-tab> :bp<CR>

" Omni completion
inoremap ,c <C-x><C-o>

" Zen coding
"inoremap ,z <C-y>,

" Nerd tree
noremap \t :NERDTreeToggle<CR>
noremap \f :NERDTreeFind<CR>
let g:NERDTreeWinPos = "right"
let g:NERDTreeShowBookmarks = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Easier vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <Leader><Leader>s :so ~/.vimrc<CR>
noremap <Leader><Leader>v :tabe ~/.vimrc<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Better appearance 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number                     " show line numbers
set cul                        " hightlight current line
set ruler                      " show a ruler
set showmatch                  " show matching braces
set showcmd                    " show partial commands
set wrap                       " wrap too long lines
set laststatus=2               " always show status line

colorscheme solarized
if has('gui_running')
    set background=dark
else
    set background=dark
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smarter behaviour
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch                     " highlight the searchterms
set incsearch                    " jump to the matches while typing
set ignorecase                   " ignore case while searching
set smartcase
" always center the line of the matched search
map N Nzz
map n nzz

set history=50                   " history
set undolevels=1000              " 1000 undo levels
set wildchar=<Tab>               " expand the command line using tab
set autowrite                    " write before hiding a buffer
set backspace=indent,eol,start   " powerful backspaces
set textwidth=0                  " don't wrap words
set nobackup
set noswapfile

set ofu=syntaxcomplete#Complete  " omnicompletion
set completeopt=menuone,longest  " always show popup menu, insert longest match

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs and indentation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4                    " count tabs as 4 characters in a file
set shiftwidth=4                 " 4 spaces are used for (auto)indent
set expandtab                    " expand tab to spaces
set softtabstop=4
set autoindent


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fold
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fold using markers {{{
" like this
" }}}
" set foldmethod=marker

" folding settings
" set foldmethod=indent
" set foldnestmax=10
" set nofoldenable
" set foldlevel=1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File type detection and syntax
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on      " auto-detect the filetype
au BufRead,BufNewFile *.{jsont,handlebars} setfiletype html 
syntax on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Abbreviations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
ab fun function
ab cw console.log


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""