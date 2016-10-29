"Inspiration:
"https://github.com/captbaritone/dotfiles/blob/master/vimrc

"load plug vim if we do not have it yet
if empty(glob('~/.vim/autoload/plug.vim'))
!mkdir -p ~/.vim/autoload/
!curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin()

Plug 'tpope/vim-sensible' "base sensible options
Plug 'ConradIrwin/vim-bracketed-paste' "auto :set paste
Plug 'mhinz/vim-startify' "give a nice startup screen with recent files
Plug 'tpope/vim-dispatch' "dispatch command async

Plug 'mileszs/ack.vim' "search with ack plugin using rg
Plug 'ctrlpvim/ctrlp.vim' "find files

Plug 'majutsushi/tagbar' "visualize tags in code

Plug 'scrooloose/nerdtree' "file navigation
Plug 'tyok/nerdtree-ack' "search in nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin' "nerdtree and git

Plug 'tpope/vim-fugitive' "git
Plug 'idanarye/vim-merginal' "git branch stuff
Plug 'int3/vim-extradite' "git log stuff
Plug 'airblade/vim-gitgutter' "show git information in gutter

Plug 'AndrewRadev/splitjoin.vim' "split and join code, like structs in go
Plug 'Raimondi/delimitMate' "auto close brackets quotes aso
Plug 'junegunn/vim-easy-align' "align text
Plug 'tpope/vim-unimpaired' "navigage in files

Plug 'bling/vim-airline' "nicer status line
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized' "pretty colors
Plug 'nanotech/jellybeans.vim'
Plug 'myusuf3/numbers.vim' "line numbering done right

Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'


Plug 'tpope/vim-surround'      " support handling surrounding quotes/brackets/etc
Plug 'tpope/vim-repeat' "repeat commnads
Plug 'easymotion/vim-easymotion' "easier moving around

Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'edsono/vim-matchit', { 'for': ['html', 'xml'] }
Plug 'fatih/vim-go',  { 'for' : 'go', 'branch': 'vim-8.0' }
Plug 'maralla/completor.vim'
Plug 'scrooloose/syntastic'    " syntax checking

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
set autowrite

"go keybings
let g:completor_go_omni_trigger = '(?:\b[^\W\d]\w*|[\]\)])\.(?:[^\W\d]\w*)?'
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

set directory^=$HOME/.vim/tmp//

Plug 'bronson/vim-trailing-whitespace'

" Use ; for commands., do not have to hold shift to do commands
nnoremap ; :

" the biggest key on the keyboard as leader makes sense, bind lots of stuff to it
let mapleader="\<SPACE>"

"delete buffer
nmap <silent> <leader>x :bdelete<CR>

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

au FileType go nmap <leader>ds <Plug>(go-def-split)
au FileType go nmap <leader>d <Plug>(go-def-vertical)
au FileType go nmap <leader>dt <Plug>(go-def-tab)
au FileType go nmap <leader>a <Plug>(go-alternate-edit)
au FileType go nmap <leader>as <Plug>(go-alternate-split)
au FileType go nmap <leader>av <Plug>(go-alternate-vertical)

au FileType go nmap <leader>do <Plug>(go-doc)
au FileType go nmap <leader>dov <Plug>(go-doc-vertical)
au FileType go nmap <leader>dob <Plug>(go-doc-browser)
au FileType go nmap <leader>s <Plug>(go-implements)
au FileType go nmap <leader>e <Plug>(go-rename)
au FileType go nmap <leader>i <Plug>(go-info)
noremap <leader>qq :cclose<CR>
map <leader>q :cnext<CR>


"git/fugitives
" fugitive git bindings
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>g :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q %:p<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gl :Extradite!<CR>
nnoremap <leader>gg :Ggrep<Space>
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gm :Gmove<Space>
nnoremap <leader>gb :MerginalToggle<CR>
nnoremap <leader>gp :Gpush<CR>
nnoremap <leader>gu :Gpull<CR>
nnoremap <leader>gf :Gfetch<CR>
" same bindings for merging diffs as in normal mode
xnoremap dp :diffput<cr>
xnoremap do :diffget<cr>

"cd to the current file's directory
nnoremap <leader>. :cd %:p:h<CR>:pwd<CR>

nmap <silent> <leader>ev :vsplit $HOME/.vimrc<CR>
nmap <silent> <leader>sv :source $HOME/.vimrc<CR>

Plug 'sjl/gundo.vim'
Plug 'mjakl/vim-asciidoc'
Plug 'ryanoasis/vim-devicons'

call plug#end()

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

"i like dark things and small tabstops
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

set ts=2
set sw=2
set background=dark
set number "will be relative number while in normal mode thanks to numbers.vim

colo solarized
let g:airline_theme='jellybeans'

" tips
" CTRL-6, back to last buffer
"open or close the right or left drawer, files or tags
map <F2> :NERDTreeToggle<CR>
map <F3> :Tagbar<CR>
map <F5> :GundoToggle<CR>

" to focus tagbar or nerdtree easily
nmap <silent> <leader>z :TagbarOpen fj<CR>
nmap <silent> <leader>zz :NERDTree<CR>
nnoremap <leader>f :Ack!<Space>

" navigate windws quicker
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nmap <C-[> <C-T>
"spellcheck and tw for git commits
autocmd Filetype gitcommit setlocal spell textwidth=72

let g:ackprg = 'rg --vimgrep --no-heading'
if executable("rg")
	set grepprg=rg\ --vimgrep\ --no-heading
	set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" ==================== trim whitespace ====================
fun! TrimWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfun
noremap <leader>w :call TrimWhitespace()<CR>


" ==================== delimitMate ====================
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_smart_quotes = 1
let g:delimitMate_expand_inside_quotes = 0
let g:delimitMate_smart_matchpairs = '^\%(\w\|\$\)'

" will not work for me
" imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"


" ==================== Spit Join ====================
nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>

