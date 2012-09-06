"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Credits to the VIM community for many of the smart things in this file
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins with vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'scrooloose/nerdtree'
" Command-T not work on windows http://rfbrazier.posterous.com/installing-the-command-t-vim-plugin-on-window
"Bundle 'wincent/Command-T'
Bundle 'kien/ctrlp.vim'
" Remember to include git in path when install msysgit on Windwos.
Bundle 'tpope/vim-fugitive'
" Make ack work on windows http://stackoverflow.com/a/4792583/375230
Bundle 'mileszs/ack.vim'
Bundle 'bufexplorer.zip'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/syntastic'
Bundle 'msanders/snipmate.vim'
Bundle 'mattn/zencoding-vim'
Bundle 'digitaltoad/vim-jade'
Bundle 'othree/html5.vim'
Bundle 'groenewege/vim-less'
Bundle 'altercation/vim-colors-solarized'

filetype plugin indent on


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
noremap <Space> :bn<CR>
noremap <S-Space> :bp<CR>

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
if has('win32')
    noremap <Leader><Leader>s :so ~/_vimrc<CR>
    noremap <Leader><Leader>v :tabe ~/_vimrc<CR>
else
    noremap <Leader><Leader>s :so ~/.vimrc<CR>
    noremap <Leader><Leader>v :tabe ~/.vimrc<CR>
endif



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


if has('win32')
    colorscheme murphy
else
    colorscheme solarized
endif
"if has('gui_running')
    "set background=dark
"else
    "set background=dark
"endif


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