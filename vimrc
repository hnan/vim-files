"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Credits to the VIM community for many of the smart things in this file
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins with vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"filetype on "try to fix the http://tooky.co.uk/2010/04/08/there-was-a-problem-with-the-editor-vi-git-on-mac-os-x.html
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
Bundle 'neocomplcache'
"Bundle 'shougo/neocomplcache'
"Bundle 'ervandew/supertab'
Bundle 'scrooloose/nerdcommenter'
Bundle 'EasyMotion'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/syntastic'
Bundle 'msanders/snipmate.vim'
Bundle 'mattn/zencoding-vim'
Bundle 'digitaltoad/vim-jade'
Bundle 'othree/html5.vim'
Bundle 'groenewege/vim-less'
Bundle 'altercation/vim-colors-solarized'
Bundle 'CSSMinister'
Bundle 'ap/vim-css-color'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-surround'
Bundle 'pangloss/vim-javascript'
Bundle 'airblade/vim-gitgutter'


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

" Quick windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <Leader>q <C-w>c
map <Leader>o <C-w>o

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
"noremap ,z <C-y>,

noremap <Leader>f :Ack 


" Nerd tree
"noremap \t :NERDTreeToggle<CR>
noremap <Leader>n :NERDTreeFind<CR>
let g:NERDTreeWinPos = "right"
let g:NERDTreeShowBookmarks = 1


" Git fugitive
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gl :Git pull<CR>
noremap <Leader>gp :Git push<CR>
noremap <Leader>gk :!gitk %:p<CR>

let g:neocomplcache_enable_at_startup = 1

"let g:syntastic_enable_signs=1
"let g:syntastic_error_symbol='✗'
"let g:syntastic_warning_symbol='⚠'

let g:syntastic_javascript_checkers = ['jshint']



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
set colorcolumn=80
set guioptions-=T
set guioptions-=L
set guioptions-=r

if has('win32')
    colorscheme murphy
else
    colorscheme solarized
    if has('gui_running')
        set background=light
    else
        set background=dark
    endif
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
au BufRead,BufNewFile *.{jsont,handlebars,emberhbs} setf html 
au BufRead,BufNewFile *.ejs setf html 
" Fix default ft detection for *.ts
au BufRead,BufNewFile *.ts if &ft == 'xml' | set ft=javascript | endif
syntax on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Abbreviations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
ab fun function
ab cw console.log


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
