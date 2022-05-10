set runtimepath^=~/.vim runtimepath+=~/.vim/after
set termguicolors
set background=dark
set shell=/bin/zsh
set updatetime=100

source ~/.vimrc
source ~/.config/nvim/coc.vim
set shortmess=A
set encoding=UTF-8
set guicursor=i:ver1
set guicursor=i:block
set guicursor+=i:blinkon1
set modifiable
let g:coc_global_extensions = ['coc-tsserver']
let NERDTreeShowHidden=1
let g:NERDCreateDefaultMappings = 0 
let g:EasyMotion_smartcase = 1
let &packpath = &runtimepath
let g:fzf_command_prefix = 'Fzf'

autocmd VimEnter * luafile $HOME/.config/nvim/lua/init.lua

call plug#begin()
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'preservim/nerdtree'
  Plug 'ellisonleao/gruvbox.nvim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'wookayin/fzf-ripgrep.vim'
  Plug 'easymotion/vim-easymotion'
  Plug 'idbrii/vim-endoscope'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'pangloss/vim-javascript'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'jparise/vim-graphql'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'tami5/sqlite.lua'
  Plug 'tpope/vim-surround'
  ""Plug 'jreybert/vimagit'
  Plug 'airblade/vim-gitgutter'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'google/vim-maktaba'
  Plug 'google/vim-codefmt'
  Plug 'ryanoasis/vim-devicons'
  Plug 'google/vim-glaive'
  Plug 'tpope/vim-fugitive'
  Plug 'scrooloose/nerdcommenter'
  Plug 'milch/vim-fastlane'
  Plug 'stsewd/fzf-checkout.vim'
  Plug 'glepnir/dashboard-nvim'
  Plug 'NoahTheDuke/vim-just'
  Plug 'jesseleite/vim-agriculture'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzy-native.nvim'
  Plug 'nvim-telescope/telescope-frecency.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'pwntester/octo.nvim'
  Plug 'kien/ctrlp.vim'
  Plug 'rking/ag.vim'
call plug#end()

function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
    silent call CocActionAsync('doHover')
  endif
endfunction

function! s:show_hover_doc()
  call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

imap <C-s> <Plug>(endoscope-close-pair)

nnoremap <silent> <leader>cc :call nerdcommenter#Comment('x', 'toggle')<CR>
vnoremap <silent> <leader>cc :call nerdcommenter#Comment('x', 'toggle')<CR>

nmap <leader>n :tabnext<cr>
nmap <leader>N :tabnew<cr>

nmap <space>gg :FzfGBranches<cr>
nmap <space>gp :Git pull<cr>
nmap <space>gP :Git push --no-verify<cr>
nmap <space>gs :G<cr>
nmap <space>gm :Gvdiff master<cr>
nmap <space>gM :Gvdiffsplit!<cr>
nmap <space>ghf :diffget //2<cr>
nmap <space>ghj :diffget //3<cr>

nmap <space>l <Cmd>CocCommand eslint.executeAutofix<cr>
map <C-\> <Plug>(coc-terminal-toggle)
nmap <space>e <Cmd>CocCommand explorer<CR>
nnoremap <leader>t :NERDTreeToggle<CR> <C-w>w<cr>
nnoremap <leader>gf :NERDTreeFind<CR>
map <silent> <esc> :noh <CR>

map <silent> <C-w>o :noh <CR>

noremap tt <C-w>
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l
nnoremap <leader>v <C-w>v<C-w>w<C-w>n<C-w>w<C-w>c

noremap U <C-r>
noremap <C-r> :FzfHistory<cr>
noremap <C-t> :FzfFiles<cr>

vmap <Leader>/ <Plug>AgRawVisualSelection

nnoremap ff <cmd>CtrlPMixed<cr>
nnoremap fr <cmd>Telescope frecency<cr>
nnoremap fa <cmd>Telescope find_files hidden=true<cr>
nnoremap fg <cmd>Rg<cr>
"nnoremap fb <cmd>CocList buffers<cr>
nnoremap fb <cmd>Telescope buffers<cr>
nnoremap fo <cmd>Telescope oldfiles<cr>

nnoremap <leader>r :source $MYVIMRC<CR>
nnoremap <leader>w :w<CR>

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

let g:dashboard_default_executive ='telescope'
