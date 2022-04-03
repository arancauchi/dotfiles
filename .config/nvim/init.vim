
set runtimepath^=~/.vim runtimepath+=~/.vim/after
set termguicolors
set background=dark
set shell=/bin/zsh
let &packpath = &runtimepath

source ~/.vimrc
source ~/.config/nvim/coc.vim
set shortmess=A

autocmd VimEnter * luafile $HOME/.config/nvim/lua/init.lua

call plug#begin()
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'preservim/nerdtree'
  Plug 'ellisonleao/gruvbox.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'airblade/vim-gitgutter'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-surround'
  Plug 'wookayin/fzf-ripgrep.vim'
  Plug 'easymotion/vim-easymotion'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzy-native.nvim'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'pangloss/vim-javascript'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'jparise/vim-graphql'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'neoclide/coc-eslint'
  Plug 'nvim-telescope/telescope-frecency.nvim'
  Plug 'tami5/sqlite.lua'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-surround'
  Plug 'jreybert/vimagit'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'google/vim-maktaba'
  Plug 'google/vim-codefmt'
  Plug 'ryanoasis/vim-devicons'
  Plug 'google/vim-glaive'
  Plug 'tpope/vim-fugitive'
  Plug 'scrooloose/nerdcommenter'
  Plug 'milch/vim-fastlane'
call plug#end()

let g:coc_global_extensions = ['coc-tsserver']

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
    silent call CocActionAsync('doHover')
  endif
endfunction

function! s:show_hover_doc()
  call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

" autocmd CursorHoldI * :call <SID>show_hover_doc()
" autocmd CursorHold * :call <SID>show_hover_doc()

let NERDTreeShowHidden=1
"autocmd VimEnter * NERDTreeFind | wincmd p
"set modifiable
set ma

" Exit Vim if NERDTree is the only window remaining in the only tab.
"autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
"autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

nmap <leader>n :tabnext<cr>
nmap <leader>N :tabnew<cr>
nmap <space>gp :Git pull<cr>
nmap <space>gP :Git push --no-verify<cr>
nmap <space>gs :G<cr>
nmap <space>gm :Gvdiffsplit master<cr>
nmap <space>gM :Gvdiffsplit!<cr>
nmap <space>ghf :diffget //2
nmap <space>ghj :diffget //3

nnoremap <leader>t :NERDTreeToggle<CR> <C-w>w<cr>
nnoremap <leader>gf :NERDTreeFind<CR>
map <silent> <esc> :noh <CR>
nnoremap <leader>b :buffers<CR>:buffer<Space>

map <silent> <C-w>o :noh <CR>

noremap tt <C-w>
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l

noremap U <C-r>
" Search through history using fzf
noremap <C-r> :History<cr>

nnoremap ff <cmd>Telescope frecency<cr>
nnoremap <leader>fa <cmd>Telescope find_files hidden=true<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>

nnoremap <leader>r :source $MYVIMRC<CR>
nnoremap <leader>w :w<CR>

let g:EasyMotion_smartcase = 1
nmap <C-j> <Plug>(easymotion-sn)

" move selected lines down one line
xmap <S-k> :m-2<CR>gv=gv
" move selected lines up one line
xmap <S-j> :m'>+<CR>gv=gv

nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)

set encoding=UTF-8
set guicursor=i:ver1
set guicursor=i:block
set guicursor+=i:blinkon1
