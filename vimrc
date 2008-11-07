set nocompatible

" Make tabs 4 characters instead of default 8
set tabstop=4

" Minimal number of screen lines to keep above and below the cursor
set scrolloff=3

" Remove toolbar in gvim
set guioptions-=T
set guioptions-=m
set guioptions-=r
set guioptions-=L

"Suffixes that get lower priority when doing tab completion for filenames
"These are the files we are not likely to wwant to edit or read
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

"Automatically save before commands like :next and :make
set autowrite

"folding
set foldmethod=syntax

" Set colorscheme
if has("gui_running")
	"colorscheme twilight
	colorscheme desert
else
	colorscheme desert
endif

syntax on
filetype on
filetype indent on
filetype plugin on

" Backups and files
set backup
set backupdir=~/.vim/backups
set directory=~/.vim/tmp

set ruler "Show line/col num + position in file
"set nu "Show line numbers
"set nowrap "Line wrapping is annoying
set wrap

"let loaded_minibufexplorer = 1

"Supertab options
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
	 	\ | wincmd p | diffthis

"MiniBufExpl options
let g:miniBufExplMapWindowNavArros = 1

"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

"Ruby autocomplete settings
autocmd FileType ruby set omnifunc=rubycomplete#Complete
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

highlight Pmenu ctermbg=238 gui=bold

"Always show the status line
"set laststatus=2
nnoremap <silent> \x :call ToggleGuiStuff()<cr>
function! ToggleGuiStuff()
    if &guioptions =~# 'T'
        set guioptions-=T
        set guioptions-=m
    else
        set guioptions+=T
        set guioptions+=m
    endif
endfunction

"Find as you type
set incsearch

map <C-t> :FuzzyFinderTextMate<CR>

"behave like a wordprocessor
autocmd BufRead *\.txt setlocal formatoptions=l
autocmd BufRead *\.txt setlocal lbr
"go up 1 wrapped line instead of a full line
autocmd BufRead *\.txt map <buffer> j gk
autocmd BufRead *\.txt map <buffer> k gk
autocmd BufRead *\.txt setlocal smartindent
autocmd BufRead *\.txt setlocal spell spelllang=en_us

"auto end brace and parentheses
"http://vim.wikia.com/wiki/Automatically_append_closing_characters
inoremap { 		{}<Left>
inoremap {<CR>  {<CR><Cr>}<Up><Esc>0
inoremap {{     {
inoremap {}     {}

inoremap (  ()<Left>
inoremap <silent> )   )<Esc>
                      \:let tmp0=&clipboard <BAR>
                      \let &clipboard=''<BAR>
                      \let tmp1=@"<BAR>
                      \let tmp2=@0<CR>
                      \y2l
                      \:if '))'=="<C-R>=escape(@0,'"\')<CR>"<BAR>
                      \  exec 'normal "_x'<BAR>
                      \endif<BAR>
                      \let @"=tmp1<BAR>
                      \let @0=tmp2<BAR>
                      \let &clipboard=tmp0<BAR>
                      \unlet tmp0<BAR>
                      \unlet tmp1<BAR>
                      \unlet tmp2<CR>
                      \a

