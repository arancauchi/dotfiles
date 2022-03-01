set scrolloff=3

" Remap undo
map U <C-R>
map 0 ^
map Q gq
nnoremap <expr> mm (line('$')/2).'G'.'zz'
nnoremap <expr> MM (line('$')*0.75).'G'.'zz'
" paste always reads from the last yanked register in normal and visual modes
vnoremap p "0p
vnoremap P "0P
nnoremap p "0p
nnoremap P "0P
" change always sends  to the null register
nnoremap c "_c
nnoremap C "_C

cnoremap <C-j> <C-n>
cnoremap <C-k> <C-p>

nnoremap <C-j> <C-n>
nnoremap <C-k> <C-p>

map <leader>n :tabnew<cr>
map <leader>t :tabn<cr>
map tt :tabn<cr>
map nn :tabnew<cr>
map <Leader>q :q<cr>

set timeoutlen=1000
set visualbell
set noerrorbells
set showmode
set ignorecase
set smartcase
set clipboard+=unnamed
set incsearch
set expandtab
set shiftwidth=2
set number relativenumber
set nu rnu
