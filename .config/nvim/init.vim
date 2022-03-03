set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

autocmd VimEnter * luafile $HOME/.config/nvim/lua/init.lua

call plug#begin()
  Plug 'preservim/nerdtree'
  Plug 'ellisonleao/gruvbox.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-surround'
  Plug 'wookayin/fzf-ripgrep.vim'
  Plug 'easymotion/vim-easymotion'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzy-native.nvim'
call plug#end()

let NERDTreeShowHidden=1
autocmd VimEnter * NERDTreeFind | wincmd p

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

colorscheme gruvbox
set termguicolors
set background=dark
set shell=/bin/zsh

nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l

noremap U <C-r>
noremap <C-r> :History<cr>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>

nnoremap <leader>r :source $MYVIMRC<CR>
nnoremap <leader>w :w<CR>

nmap s <Plug>(easymotion-sn)

set guicursor=i:ver1
set guicursor=i:block
set guicursor+=i:blinkon1
