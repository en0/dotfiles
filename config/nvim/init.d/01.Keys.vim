let mapleader = ","

"" Which key
nnoremap <silent> <leader> :WhichKey '<Leader>'<CR>
nnoremap <silent> g :WhichKey 'g'<CR>

"" Buffer navigation
map <Leader>n :BufferPrevious<CR>
map <Leader>m :BufferNext<CR>
map <Leader>c :BufferClose<CR>
map <Leader>N :BufferMovePrevious<CR>
map <Leader>M :BufferMoveNext<CR>

"" Project Explorer
nnoremap <Leader>e :NvimTreeToggle<CR>
nnoremap <C-p> :NvimTreeOpen<CR>

"" Fuzzy Finder
" nnoremap <Leader>f :CocCommand fzf-preview.GitFiles<CR>
nnoremap <Leader>f :CocCommand fzf-preview.DirectoryFiles<CR>
nnoremap <Leader>b :CocCommand fzf-preview.Buffers<CR>
nnoremap <Leader>F :call FzfGrep()<CR>
nnoremap <Leader>G :CocCommand fzf-preview.GitStatus<CR>
nnoremap <Leader>t :CocCommand fzf-preview.TodoComments<CR>

"" Coc Integration
" GoTo code navigation (Coc).
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gm <Plug>(git-messenger)
nmap <silent> gg :0<CR>

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Searching
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" Better indent control
vnoremap < <gv
vnoremap > >gv

" Format Text
vmap Q gq
nmap Q gq

" Spelling! ya.
map <F7> :setlocal spell! spelllang=en_us<CR>

" Because you always forget
command WW w !sudo tee %

" Escape terminal mode
tnoremap <C-w>h <C-\><C-N><C-w>h
tnoremap <C-w>j <C-\><C-N><C-w>j
tnoremap <C-w>k <C-\><C-N><C-w>k
tnoremap <C-w>l <C-\><C-N><C-w>l


" Python
autocmd FileType python map <Leader>p :call InsertBreakpoint()<CR>

function! InsertBreakpoint()
  let trace = expand("import pdb; pdb.set_trace()")
  execute "normal o".trace
endfunction

autocmd FileType python nnoremap <buffer><Leader>i :exec '!isort %'<CR>

" Session Management ## TODO: move this to lua and make it smarter
map <Leader>sn :lua MiniSessions.write('')<Left><Left>
map <Leader>ss :lua MiniSessions.write()<CR>
map <Leader>sd :lua MiniSessions.delete('')<Left><Left>
map <Leader>sn :lua print("Current Session: " .. MiniSessions.get_latest())<CR>

" Playing around
map <Leader>x :py say_hello()<CR>
