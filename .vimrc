" Vim 7.2
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,euc-kr,cp949,euc-jp,shift-jis,big5,latin1,ucs-21e
set hidden
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Jul 02
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc
let g:netrw_liststyle=3

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
set backspace=indent,eol,start
set history=700	undolevels=700
set tabstop=4 softtabstop=4 shiftwidth=4
set ruler number
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set modifiable
set clipboard=unnamed
set autochdir

set background=dark
"colorscheme  wombat256mod "solarized
syntax on
set t_Co=256
inoremap jj <ESC>
nnoremap no :noh<CR>
let mapleader=","
set laststatus=2

map so :so ~/.vimrc<CR>
map bn :bn<CR>
map bp :bp<CR>
imap '' ''<ESC>i
imap "" ""<ESC>i
imap () ()<ESC>i
imap [] []<ESC>i
imap <> <><ESC>i
imap {} {<cr>}<ESC><left>i


" Don't use Ex mode, use Q for formatting
"map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
"inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
"if !exists(":DiffOrig")
  "command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  "\ | wincmd p | diffthis
"endif

""" Vundle Setting by gmarik  
""" set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" alternatively, pass a path where Vundle should install bundles
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

" My Bundles here
Bundle 'c.vim'
Bundle 'ctrlp.vim'
Bundle 'DirDiff.vim'
Bundle 'Gist.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'minibufexpl.vim'
Bundle 'matchit.zip'
Bundle 'WebAPI.vim'  
Bundle 'taglist.vim'
Bundle 'The-NERD-Commenter'
Bundle 'vimwiki'

" The following are examples of different formats supported.
" Keep bundle commands between here and filetype plugin indent on.
" scripts on GitHub repos
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-rails.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" scripts from http://vim-scripts.org/vim/scripts.html
Bundle 'L9'
Bundle 'FuzzyFinder'
" scripts not on GitHub
Bundle 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Bundle 'file:///home/gmarik/path/to/plugin'
" ...

filetype plugin indent on     " required
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments ater Bundle commands are not allowed.
"
"
let loaded_matchit = 1
let g:Powerline_symbols = 'fancy'
"" Gist setting
let g:gist_clip_comand = 'xclip -selection clipboard'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_browser_command = 'opera %URL% &'
"" Netrw setting by Charles E. Cambell
let g:netrw_altv = 1
let g:netrw_fastbrowse = 2
let g:netrw_keepdir = 0
let g:netrw_liststyle = 2
let g:netrw_retmap = 1
let g:netrw_silent = 1
let g:netrw_special_syntax= 1et g:Powerline_symbols = 'fancy'
