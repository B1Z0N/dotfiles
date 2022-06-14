" 4 spaces per tab
set tabstop=2
" tabs to spaces
set expandtab

" useful things
set number
set showcmd
set wildmenu
set lazyredraw
set showmatch

" searching
set incsearch
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>

" movement
nnoremap j gj
nnoremap k gk

" colors
highlight Pmenu ctermbg=gray guibg=gray
syntax on 
colorscheme desert

" windows thing
set belloff=all
