set scrolloff=3

" Remap undo
map U <C-R>
map 0 ^

nnoremap <expr> mm (line('$')/2).'G'.'zz'
nnoremap <expr> MM (line('$')*0.75).'G'.'zz'

" change and delete always sends to the null register
" yank uses system clipboard, so it now mimics delete rather than cut/paste
noremap c "_c
noremap C "_C
noremap d "_d
noremap D "_D

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
set clipboard=unnamedplus
set incsearch
set expandtab
set shiftwidth=2
set number relativenumber
set nu rnu
