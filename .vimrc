"Inspiration: 
"https://github.com/captbaritone/dotfiles/blob/master/vimrc

"load plug vim if we do not have it yet
if empty(glob('~/.vim/autoload/plug.vim'))
   !mkdir -p ~/.vim/autoload/
    !curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin()

Plug 'tpope/vim-sensible' "base sensible options


Plug 'bling/vim-airline' "nicer status line
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

Plug 'altercation/vim-colors-solarized' "pretty colors
Plug 'nanotech/jellybeans.vim' 
Plug 'fatih/molokai' 


Plug 'rking/ag.vim'  "search
"concider https://github.com/Chun-Yang/vim-action-ag
"use sift for ag.vim
let g:ag_prg="sift --no-color -n"
let g:ag_highlight=1
let g:ag_format="%f:%l:%m"

Plug 'ctrlpvim/ctrlp.vim' "find files
Plug 'tpope/vim-unimpaired' "navigage in files

Plug 'elzr/vim-json', { 'for': 'json' } "json

Plug 'tpope/vim-endwise'
Plug 'junegunn/vim-easy-align' "align text

"Plug 'ervandew/supertab'       " tab completion
Plug 'sickill/vim-pasta'       " enhances the default paste command ('p')

Plug 'myusuf3/numbers.vim' "line numbering done right
set number "will be relative number while in normal mode thanks to numbers.vim

Plug 'tpope/vim-surround'      " support handling surrounding quotes/brackets/etc
Plug 'tpope/vim-repeat'
Plug 'scrooloose/syntastic'    " syntax checking

Plug 'easymotion/vim-easymotion' "easier moving around
"go

Plug 'majutsushi/tagbar'

" Completion
Plug 'mattn/emmet-vim', { 'for': 'html' }

Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

" Make % match xml tags
Plug 'edsono/vim-matchit', { 'for': ['html', 'xml'] }

Plug 'fatih/vim-go',  { 'for' : 'go' }
Plug 'Shougo/neocomplete'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

let g:neocomplete#sources#omni#input_patterns.go = '[^.[:digit:] *\t]\.\w*'


" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

imap <expr><TAB>
  \ pumvisible() ? "\<C-n>" :
  \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"go keybings
set autowrite
let g:go_list_type = "quickfix" "prefer quicklist to locationlist
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_textobj_include_function_doc = 1
let g:go_fmt_fail_silently = 1

let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

Plug 'scrooloose/nerdtree'
Plug 'taiansu/nerdtree-ag'

Plug 'tpope/vim-dispatch' "dispatch command async

"Git stuff
Plug 'tpope/vim-fugitive' 
Plug 'idanarye/vim-merginal' "git branch stuff
Plug 'int3/vim-extradite' "git log stuff
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'AndrewRadev/splitjoin.vim'


Plug 'mhinz/vim-startify'

" Return to last edit position when opening files, except git commit message
 autocmd BufReadPost *
   \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

" Ctrl-P
let g:ctrlp_working_path_mode = 'rw'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|sass-cache|pip_download_cache|wheel_cache)$',
    \ 'file': '\v\.(png|jpg|jpeg|gif|DS_Store|pyc)$',
    \ 'link': '',
    \ }
let g:ctrlp_show_hidden = 1
let g:ctrlp_clear_cache_on_exit = 0
" Wait to update results (This should fix the fact that backspace is so slow)
let g:ctrlp_lazy_update = 1
" Show as many results as our screen will allow
let g:ctrlp_match_window = 'max:1000'

  let g:ctrlp_abbrev = {
    \ 'gmode': 'i',
    \ 'abbrevs': [
      \ {
        \ 'pattern': '^shj',
        \ 'expanded': 'fanmgmt/static/js/workflow',
        \ 'mode': 'pfrz',
      \ },
      \ {
        \ 'pattern': '^shh',
        \ 'expanded': 'fanmgmt/templates/workflow/compliance_review/jst',
        \ 'mode': 'pfrz',
      \ }
      \ ]
    \ }

" If we have sift-tool
if executable('sift')
    " Use sift over grep
    " set grepprg=ag\ --nogroup\ --nocolor
      set grepprg=sift\ --no-color
    " Use sift in CtrlP for listing files. Lightning fast and respects .gitignore
    " let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
     let g:ctrlp_user_command = 'sift -i --no-conf --no-color --no-group --targets --exclude-dirs=".git" --exclude-ext="min.js,dat,exe,gif,png,jpeg,jpg,ico" %s'

    "sift is fast enough that CtrlP doesn't need to cache
     let g:etrlp_use_caching = 0
endif

set directory^=$HOME/.vim/tmp//

Plug 'bronson/vim-trailing-whitespace'

" Use ; for commands., do not have to hold shift to do commands
nnoremap ; :

" the biggest key on the keyboard as leader makes sense, bind lots of stuff to it
let mapleader="\<SPACE>"

"delete buffer
nmap <silent> <Leader>c :bdelete<CR>

"go mappings
au FileType go nmap <leader>r <Plug>(go-run)
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

au FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>tt <Plug>(go-test-func)
au FileType go nmap <leader>c <Plug>(go-coverage-toggle)

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>a <Plug>(go-alternate-edit)
au FileType go nmap <Leader>as <Plug>(go-alternate-split)
au FileType go nmap <Leader>av <Plug>(go-alternate-vertical)

au FileType go nmap <Leader>do <Plug>(go-doc)
au FileType go nmap <Leader>dov <Plug>(go-doc-vertical)
au FileType go nmap <Leader>dob <Plug>(go-doc-browser)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>e <Plug>(go-rename)
au FileType go nmap <Leader>i <Plug>(go-info)
noremap <leader>qq :cclose<CR>
map <leader>q :cnext<CR>


"git/fugitives
" fugitive git bindings
nnoremap <Leader>ga :Git add %:p<CR><CR>
nnoremap <Leader>g :Gstatus<CR>
nnoremap <Leader>gc :Gcommit -v -q %:p<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gl :Extradite!<CR>
nnoremap <Leader>gg :Ggrep<Space>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gm :Gmove<Space>
nnoremap <Leader>gb :MerginalToggle<CR>
nnoremap <Leader>gp :Gpush<CR>
nnoremap <Leader>gu :Gpull<CR>
nnoremap <Leader>gf :Gfetch<CR>
" same bindings for merging diffs as in normal mode
xnoremap dp :diffput<cr>
xnoremap do :diffget<cr>

"cd to the current file's directory
nnoremap <Leader>. :cd %:p:h<CR>:pwd<CR>

nmap <silent> <Leader>ev :vsplit $HOME/.vimrc<CR>
nmap <silent> <Leader>sv :source $HOME/.vimrc<CR>

" neocomlpete and neocomplete snippets
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction

inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

Plug 'sjl/gundo.vim' 
Plug 'mjakl/vim-asciidoc'
Plug 'ryanoasis/vim-devicons'

call plug#end()

"i like dark things and small tabstops
set ts=2
set background=dark
colo jellybeans
let g:airline_theme='jellybeans'

" tips
" CTRL-6, back to last buffer
"open or close the right or left drawer, files or tags 
map <F2> :NERDTreeToggle<CR>
map <F3> :Tagbar<CR>
map <F5> :GundoToggle<CR>

" to focus tagbar or nerdtree easily
nmap <silent> <Leader>z :TagbarOpen fj<CR>
nmap <silent> <Leader>zz :NERDTree<CR>

" navigate windws quicker
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


nmap <C-[> <C-T>
"spellcheck and tw for git commits 
autocmd Filetype gitcommit setlocal spell textwidth=72

set sw=2
