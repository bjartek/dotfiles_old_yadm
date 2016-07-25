"load plug vim if we do not have it yet
if empty(glob('~/.config/nvim/autoload/plug.vim'))
				!mkdir -p ~/.config/nvim/autoload/
				!curl -fLo ~/.config/nvim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
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

Plug 'sickill/vim-pasta'       " enhances the default paste command ('p')

Plug 'myusuf3/numbers.vim' "line numbering done right
set number "will be relative number while in normal mode thanks to numbers.vim

Plug 'tpope/vim-surround'      " support handling surrounding quotes/brackets/etc
Plug 'tpope/vim-repeat'
Plug 'scrooloose/syntastic'    " syntax checking

Plug 'easymotion/vim-easymotion' "easier moving around
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'edsono/vim-matchit', { 'for': ['html', 'xml'] }

Plug 'SirVer/ultisnips'
" ==================== UltiSnips ====================
function! g:UltiSnips_Complete()
  call UltiSnips#ExpandSnippet()
  if g:ulti_expand_res == 0
    if pumvisible()
      return "\<C-n>"
    else
      call UltiSnips#JumpForwards()
      if g:ulti_jump_forwards_res == 0
        return "\<TAB>"
      endif
    endif
  endif
  return ""
endfunction

function! g:UltiSnips_Reverse()
  call UltiSnips#JumpBackwards()
  if g:ulti_jump_backwards_res == 0
    return "\<C-P>"
  endif

  return ""
endfunction


if !exists("g:UltiSnipsJumpForwardTrigger")
  let g:UltiSnipsJumpForwardTrigger = "<tab>"
endif

if !exists("g:UltiSnipsJumpBackwardTrigger")
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
endif

au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"

Plug 'fatih/vim-go',  { 'for' : 'go' }
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-go', { 'do': 'make'}

set completeopt+=noinsert
let g:deoplete#enable_at_startup = 1
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources._ = ['buffer', 'member', 'tag', 'file', 'neosnippet']
let g:deoplete#sources#go#sort_class = ['func', 'type', 'var', 'const']
let g:deoplete#sources#go#align_class = 1


" Use partial fuzzy matches like YouCompleteMe
"call deoplete#custom#set('_', 'matchers', ['matcher_fuzzy'])
"call deoplete#custom#set('_', 'converters', ['converter_remove_paren'])
"call deoplete#custom#set('_', 'disabled_syntaxes', ['Comment', 'String'])
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
let g:ctrlp_working_path_mode = 'ra'
nmap <C-b> :CtrlPBufTag<cr>
imap <C-b> <esc>:CtrlPBufTag<cr>

let g:ctrlp_custom_ignore = {
												\ 'dir':  '\v[\/]\.(git|hg|svn|sass-cache|pip_download_cache|wheel_cache)$',
												\ 'file': '\v\.(png|jpg|jpeg|gif|DS_Store|pyc)$',
												\ 'link': '',
												\ }
let g:ctrlp_show_hidden = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_match_window = 'bottom,order:btt,min:10,max:10,results:10'
let g:ctrlp_mruf_max=450    " number of recently opened files
let g:ctrlp_max_files=0     " do not limit the number of searchable files
let g:ctrlp_use_caching = 1
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'

let g:ctrlp_switch_buffer ='Et'
let g:ctrlp_open_new_file ='t'

" Wait to update results (This should fix the fact that backspace is so slow)
let g:ctrlp_lazy_update = 1
" Show as many results as our screen will allow
let g:ctrlp_buftag_types = {'go' : '--language-force=go --golang-types=ft'}


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
