set nocompatible
filetype off 
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'scrooloose/syntastic'
Bundle 'ervandew/supertab'

filetype plugin indent on

" python
autocmd FileType python set omnifunc=pythoncomplete#Complete

set expandtab
"set textwidth=79
set tabstop=8
set softtabstop=4
set shiftwidth=4
set autoindent
