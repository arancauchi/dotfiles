set encoding=utf-8
set cmdheight=2
set nobackup
set nowritebackup
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

inoremap <silent><expr> <c-space> coc#refresh()

" gd - go to definition of word under cursor
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)

" gi - go to implementation
nmap <silent> gi <Plug>(coc-implementation)

" gr - find references
nmap <silent> gr <Plug>(coc-references)

" gh - get hint on whatever's under the cursor
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> gh :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')

nnoremap <silent> <leader>go :<C-u>CocList outline<cr>
nnoremap <silent> <leader>gs :<C-u>CocList -I symbols<cr>

" List errors
nnoremap <silent> <leader>cl :<C-u>CocList locationlist<cr>
nmap <silent> ]e <Plug>(coc-diagnostic-next)
nmap <silent> [e <Plug>(coc-diagnostic-prev)

" restart when tsserver gets wonky
nnoremap <silent> <leader>cR <Cmd>CocCommand explorer --toggle<CR>:<C-u>CocRestart<CR>

nnoremap <silent><leader>cl :CocList<cr>

" manage extensions
nnoremap <silent> <leader>cx  :<C-u>CocList extensions<cr>

nmap <leader>cr <Plug>(coc-rename)
nmap <leader>cf <Plug>(coc-format-selected)<cr>
vmap <leader>cf <Plug>(coc-format-selected)<cr>

" list commands available in tsserver (and others)
nmap <silent> <Leader>qf  <Plug>(coc-fix-current)

" run code actions
nmap cc <Plug>(coc-codeaction-line)

nmap [c <Plug>(coc-git-prevconflict)
nmap ]c <Plug>(coc-git-nextconflict)


inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Causes tab to close pum
inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

let g:coc_snippet_next = ''
let g:coc_snippet_prev = ''
inoremap <expr> <c-j>
   \ pumvisible() ? "\<c-n>" :
   \ coc#jumpable() ? "\<c-r>=coc#rpc#request('snippetNext', [])<cr>" :
   \ "\<c-j>"
inoremap <expr> <c-k>
   \ pumvisible() ? "\<c-p>" :
   \ coc#jumpable() ? "\<c-r>=coc#rpc#request('snippetPrev', [])<cr>" :
   \ "\<c-k>"
