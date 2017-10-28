" ~/.config/nvim/init.vim

" set plugin base dir
let s:editor_root=expand("~/.nvim")

call plug#begin('~/.nvim/plugged')

Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jlanzarotta/bufexplorer'
Plug 'majutsushi/tagbar'
Plug 'vim-ruby/vim-ruby'
Plug 'kana/vim-operator-user'
Plug 'rhysd/vim-clang-format'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/denite.nvim'
Plug 'neomake/neomake'
Plug 'Rip-Rip/clang_complete'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'fntlnz/atags.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'thinca/vim-visualstar'
Plug 'tell-k/vim-autopep8'

" ========================================================== "
"                    PLUGIN SETTINGS                         "
" ========================================================== "
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source ~/.config/nvim/init.vim
endif

" Add plugins to &runtimepath
call plug#end()

set background=dark
"colorscheme jelleybeans
"colorscheme hybrid
colorscheme monokain
syntax enable
set nu
set hlsearch
set listchars=eol:$,tab:>·,trail:~,extends:>,precedes:<,space:␣
set shell=sh
set shiftwidth=2
set tabstop=2
set smartindent
set expandtab
set cursorline
"set colorcolumn=80
" set foldmethod=syntax

" Key mapping for window move operation in normal mode
tnoremap <Esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

" Key mapping for C/C++ develop
map <F2> <leader>be 
map <F3> :NERDTreeToggle<CR>
map <F4> :Tagbar<CR>
nmap <F5> :lvimgrep /<C-R>=expand("<cword>")<cr>/ **/*.cc **/*.h<cr><C-o>:lw<cr>
nmap <F6> :Neomake! make<cr>
" map <C-f> :Denite file_rec<CR>
map <C-g> :Ag <C-r>=expand("<cword>")<cr><cr>
map <C-b> :Buffers<cr>
map <C-f> :GFiles<cr>

" Key mapping for system clipboard
vnoremap <C-c> "+y

" vim-clang-format configurations
let g:clang_format#command = "clang-format-3.8"
let g:clang_format#style_options = {
      \ "BasedOnStyle" : "google",
      \ "AllowShortIfStatementsOnASingleLine" : "true",
      \ "AlwaysBreakTemplateDeclarations" : "true",
      \ "UseTab" : "Never",
      \ "Standard" : "C++11"}

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
"autocmd FileType c,cpp,objc map <buffer><Leader>x<Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>

" Convert each name_like_this to NameLikeThis in current line.
nnoremap ,c :s#\(\%(\<\l\+\)\%(_\)\@=\)\\|_\(\l\)#\u\1\2#g<CR>

" Airline settings
let g:airline#extensions#tabline#enabled = 1

" Conque-GDB config
" let g:ConqueGdb_SaveHistory = 0

" Use deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources = {}
let g:deoplete#sources._ = ['buffer']
let g:deoplete#sources.c = ['buffer', 'member', 'ultisnips', 'tag', 'file']
let g:deoplete#sources.cpp = ['buffer', 'member', 'ultisnips', 'tag', 'file']
" deoplete does not call omnifunc
let g:deoplete#omni_patterns = {}
let g:deoplete#omni#input_patterns = {}
" tab complete
inoremap <expr><TAB> pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ deoplete#mappings#manual_complete()
function! s:check_back_space() "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~ '\s'
  endfunction "}}}

" Clang complete
let g:clang_library_path='/usr/lib/llvm-3.8/lib'

" Neomake config
let g:neomake_open_list = 2
let g:neomake_cpp_enabled_makers = ['clangtidy']
let g:neomake_cpp_clangtidy_args = ['-p', './build', '-extra-arg=c++14']

let g:neomake_cmake_maker = {
      \ 'exe': 'cmake',
      \ 'cwd': './build',
      \ 'args': ['-DCMAKE_BUILD_TYPE=Debug', '..'],
      \ 'errorformat': '%f:%l:%c: %m',
      \ }
let g:neomake_make_maker = {
      \ 'exe': 'make',
      \ 'cwd': './build',
      \ 'args': ['-j4'],
      \ 'errorformat': '%f:%l:%c: %m',
      \ }

" Denite config
" Change mappings
call denite#custom#map('_', "\<C-j>", 'move_to_next_line')
call denite#custom#map('_', "\<C-k>", 'move_to_prev_line')
" Add custom menus
let s:menus = {}
let s:menus.nvim = {
	\ 'description': 'Edit your nvim configuration'
	\ }
let s:menus.nvim.file_candidates = [
	\ ['init.vim', '~/.config/nvim/init.vim'],
	\ ['bashrc', '~/.bashrc'],
	\ ]
call denite#custom#var('menu', 'menus', s:menus)

" UltiSnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Atags config
map <Leader>t :call atags#generate()<cr>
" Auto update Ctags
" autocmd BufWritePost * call atags#generate()
" Generate tags only for files that are not in .gitignore
let g:atags_build_commands_list = [
    \ 'ag -g "" | ctags -L - --fields=+l -f tags.tmp',
    \ 'awk "length($0) < 400" tags.tmp > tags',
    \ 'rm tags.tmp'
    \ ]

" Autopep8
autocmd FileType python set equalprg=autopep8\ -
autocmd FileType python nnoremap <buffer><Leader>cf :call Autopep8()<CR>
autocmd FileType python vnoremap <buffer><Leader>cf :call Autopep8()<CR>
let g:autopep8_disable_show_diff=1
