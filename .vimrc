set scrolloff=4

" Remap undo
map U <C-R>
map 0 ^

nnoremap <expr> mm (line('$')/2).'G'.'zz'
nnoremap <expr> MM (line('$')*0.75).'G'.'zz'

" change and delete always sends to the null register
" yank uses system clipboard, so it now mimics delete rather than cut/paste
noremap c "_c
noremap C "_C

cnoremap <C-j> <C-n>
cnoremap <C-k> <C-p>

nnoremap <C-j> <C-n>
nnoremap <C-k> <C-p>
nmap , $p
map <silent> <leader>n :tabnew<cr>
map <silent> <leader>t :tabn<cr>
map <silent> <Leader>wq :wq<cr>
map <Leader>q :q<cr>
map <Leader>Q :q!<cr>
map <leader>w :w<CR>

nnoremap <Left> <C-w>>
nnoremap <Right> <C-w><

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

set ttimeout
set ttimeoutlen=50
set ttyfast

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

