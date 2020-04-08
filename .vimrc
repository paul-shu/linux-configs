call plug#begin('~/.vim/plugged')

"Plug 'flazz/vim-colorschemes'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'
Plug 'rust-lang/rust.vim'
Plug 'bfrg/vim-cpp-modern'
Plug 'skywind3000/asyncrun.vim'

Plug 'preservim/nerdcommenter'
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1

" Plug 'airblade/vim-gitgutter'
let g:gitgutter_git_executable = 'C:\Program Files\Git\bin\git.exe'
set updatetime=100

Plug 'vim-ruby/vim-ruby'
autocmd FileType ruby compiler ruby

Plug 'Yggdroot/LeaderF', { 'do': '.\install.bat' }
" let g:Lf_ShortcutF='<C-F>'
" let g:Lf_ShortcutB='<C-B>'
let g:Lf_UseCache=0
let g:Lf_IgnoreCurrentBufferName = 1
" let g:Lf_WindowPosition = 'popup'
" let g:Lf_PreviewInPopup = 1
noremap <leader>m :LeaderfFunction<CR>
noremap <F4> :LeaderfMru<CR>
" search word under cursor, the pattern is treated as regex, and enter normal mode directly
noremap <leader>rg :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search word under cursor, the pattern is treated as regex,
" append the result to previous search results.
noremap <C-G> :<C-U><C-R>=printf("Leaderf! rg --append -e %s ", expand("<cword>"))<CR>
" search word under cursor literally only in current buffer
" noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg -F --current-buffer -e %s ", expand("<cword>"))<CR>
" search visually selected text literally, don't quit LeaderF after accepting an entry
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F --stayOpen -e %s ", leaderf#Rg#visual())<CR>
" recall last search. If the result window is closed, reopen it.
noremap go :<C-U>Leaderf! rg --stayOpen --recall<CR>
" In the quickfix window, <CR> is used to jump to the error under the
" cursor, so undefine the mapping there.
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled=1
let g:airline_detect_spell=0
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline_powerline_fonts=1
let g:airline#extensions#whitespace#mixed_indent_algo=2
let g:airline_extensions = []

Plug 'ludovicchabant/vim-gutentags'
let g:cpp_class_scope_highlight=1
let g:cpp_member_variable_highlight=0
let g:cpp_class_decl_highlight=1
let g:cpp_experimental_simple_template_highlight=1
let g:cpp_concepts_highlight=1
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
let g:gutentags_ctags_tagfile = '.tags'
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
if !isdirectory(s:vim_tags)
	silent! call mkdir(s:vim_tags, 'p')
endif

Plug 'dense-analysis/ale'
let g:ale_linters = { 'cpp': ['clang'] }
let g:ale_c_build_dir_names = ['build', 'vsbuild']
let g:ale_c_parse_compile_commands = 0
let g:ale_cpp_clang_options = "-Iinclude/ -Iinclude/blocks -Iinclude/blocks/resamplers -Iinclude/blocks/modems -Iinclude/blocks/estimators -Iinclude/blocks/filters -Iinclude/blocks/burstsearch -Iinclude/blocks/spectralline -Iinclude/blocks/windows -Iinclude/blocks/evm -Iinclude/spectrum -Iinclude/spectrum/blocks -Iinclude/spectrum/arch -Iinclude/spectrum/flows -Iinclude/rfid -Iinclude/rfid/blocks -Iinclude/rfid/arch -Iinclude/rfid/flows -Iinclude/flexdemod -Iinclude/flexdemod/blocks -Iinclude/flexdemod/arch -Iinclude/flexdemod/flows -Iinclude/wlanhf -Iinclude/wlanhf/blocks -Iinclude/wlanhf/arch -Iinclude/wlanhf/flows -Iinclude/lte-a -Iinclude/lte-a/blocks -Iinclude/lte-a/arch -Iinclude/lte-a/flows -Iinclude/nbiot -Iinclude/nbiot/blocks -Iinclude/nbiot/arch -Iinclude/nbiot/flows -Iinclude/cdma -Iinclude/cdma/blocks -Iinclude/cdma/arch -Iinclude/cdma/flows -Iinclude/wcdma-ota -Iinclude/wcdma-ota/blocks -Iinclude/wcdma-ota/arch -Iinclude/wcdma-ota/flows -Iinclude/hrpuwb -Iinclude/hrpuwb/arch -Iinclude/hrpuwb/flows -Iinclude/dab -Iinclude/dab/blocks -Iinclude/dab/arch -Iinclude/dab/flows -Iinclude/radar -Iinclude/radar/arch -Iinclude/radar/flows -Iinclude/fmstereo -Iinclude/fmstereo/arch -Iinclude/fmstereo/flows -Iinclude/gsm -Iinclude/gsm/blocks -Iinclude/gsm/arch -Iinclude/gsm/flows -Iinclude/nr-ota -Iinclude/nr-ota/blocks -Iinclude/nr-ota/arch -Iinclude/nr-ota/flows -Iinclude/signalformatdetect -Iinclude/signalformatdetect/blocks -Iinclude/signalformatdetect/arch -Iinclude/signalformatdetect/flows -Iinclude/cmmb -Iinclude/cmmb/blocks -Iinclude/cmmb/arch -Iinclude/cmmb/flows -Iinclude/arch -Iinclude/wlan -Iinclude/wlan/blocks -Iinclude/wlan/arch -Iinclude/wlan/flows -Iinclude/fileio -Iinclude/fileio/xmlLibrary -Iinclude/fileio/sdfLibrary -Iinclude/managed -Iinclude/math -Iinclude/math/vector -Iinclude/math/vector/NEON -Iinclude/math/bitvector -Iinclude/math/fft -Iinclude/math/matrix -Iinclude/math/matrix/NRLibrary -Iinclude/wihd -Iinclude/wihd/blocks -Iinclude/wihd/arch -Iinclude/wihd/flows -Iinclude/wman -Iinclude/wman/blocks -Iinclude/wman/arch -Iinclude/wman/flows -Iinclude/mqam -Iinclude/mqam/blocks -Iinclude/mqam/arch -Iinclude/mqam/flows -Iinclude/isdb -Iinclude/isdb/arch -Iinclude/isdb/flows -Iinclude/ofdm11n -Iinclude/ofdm11n/blocks -Iinclude/ofdm11n/arch -Iinclude/ofdm11n/flows -Iinclude/flo -Iinclude/flo/blocks -Iinclude/flo/arch -Iinclude/flo/flows -Iinclude/analog -Iinclude/analog/blocks -Iinclude/analog/arch -Iinclude/analog/flows -Iinclude/edge2 -Iinclude/edge2/blocks -Iinclude/edge2/arch -Iinclude/edge2/flows -Iinclude/bluetooth -Iinclude/bluetooth/arch -Iinclude/bluetooth/flows -Iinclude/pulse -Iinclude/pulse/blocks -Iinclude/pulse/arch -Iinclude/pulse/flows -Iinclude/ifspanadaptation -Iinclude/ifspanadaptation/blocks -Iinclude/ifspanadaptation/arch -Iinclude/ifspanadaptation/flows -Iinclude/avionics -Iinclude/avionics/blocks -Iinclude/avionics/arch -Iinclude/avionics/flows -Iinclude/umb -Iinclude/umb/blocks -Iinclude/umb/arch -Iinclude/umb/flows -Iinclude/ofdm -Iinclude/ofdm/blocks -Iinclude/ofdm/arch -Iinclude/ofdm/flows -Iinclude/channelsounding -Iinclude/channelsounding/arch -Iinclude/channelsounding/flows -Iinclude/ofdm11ac -Iinclude/ofdm11ac/blocks -Iinclude/ofdm11ac/arch -Iinclude/ofdm11ac/flows -Iinclude/edge -Iinclude/edge/blocks -Iinclude/edge/arch -Iinclude/edge/flows -Iinclude/uwb -Iinclude/uwb/blocks -Iinclude/uwb/arch -Iinclude/uwb/flows -Iinclude/dtmb -Iinclude/dtmb/blocks -Iinclude/dtmb/arch -Iinclude/dtmb/flows -Iinclude/docsis -Iinclude/docsis/blocks -Iinclude/docsis/arch -Iinclude/docsis/flows -Iinclude/dvb2 -Iinclude/dvb2/blocks -Iinclude/dvb2/arch -Iinclude/dvb2/flows -Iinclude/nr -Iinclude/nr/blocks -Iinclude/nr/arch -Iinclude/nr/flows -Iinclude/lte-ota -Iinclude/lte-ota/blocks -Iinclude/lte-ota/arch -Iinclude/lte-ota/flows -Iinclude/pastimulusresponse -Iinclude/pastimulusresponse/arch -Iinclude/pastimulusresponse/flows -Iinclude/mototalk -Iinclude/mototalk/arch -Iinclude/mototalk/flows -Iinclude/lte -Iinclude/lte/blocks -Iinclude/lte/arch -Iinclude/lte/flows -Iinclude/v5g -Iinclude/v5g/blocks -Iinclude/v5g/arch -Iinclude/v5g/flows -Iinclude/ofdm11ax -Iinclude/ofdm11ax/blocks -Iinclude/ofdm11ax/arch -Iinclude/ofdm11ax/flows -Iinclude/dvb -Iinclude/dvb/blocks -Iinclude/dvb/arch -Iinclude/dvb/flows -Iinclude/tdscdma -Iinclude/tdscdma/blocks -Iinclude/tdscdma/arch -Iinclude/tdscdma/flows -Iinclude/flexofdm -Iinclude/flexofdm/blocks -Iinclude/flexofdm/arch -Iinclude/flexofdm/flows -Iinclude/ofdm11ah -Iinclude/ofdm11ah/blocks -Iinclude/ofdm11ah/arch -Iinclude/ofdm11ah/flows -Iinclude/hardbop -Iinclude/hardbop/arch -Iinclude/hardbop/flows -Itest/Client -Isrc/fileIO/xmlLibrary"
nmap <silent> <leader>k <Plug>(ale_previous_error)
nmap <silent> <leader>j <Plug>(ale_next_error)

" set omnifunc=ale#completion#OmniFunc

Plug 'lervag/vimtex'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

Plug 'raingo/vim-matlab'
autocmd BufEnter *.m compiler mlint

call plug#end()

set spell spelllang=en_us
set nospell

augroup coding
	autocmd FileType c,cpp noremap <buffer> <leader>cf :%py3f C:\Program\ Files\LLVM\share\clang\clang-format.py<cr>
	autocmd FileType c,cpp inoremap <buffer> <leader>cf :py3f C:\Program\ Files\LLVM\share\clang\clang-format.py<cr>
augroup END

set encoding=utf-8
if !empty($CONEMUBUILD)
    set term=xterm
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
	set backspace=indent,eol,start
	inoremap <Char-0x07F> <BS>
	nnoremap <Char-0x07F> <BS>
endif

if !has("gui_running")
    set t_Co=256
else
	set guioptions-=m  "remove menu bar
	set guioptions-=T  "remove toolbar
	set guioptions-=r  "remove right-hand scroll bar
	set guioptions-=L  "remove left-hand scroll bar
	" set guifont=Monaco:h10
	" set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h11
	set guifont=Delugia\ Nerd\ Font:h10
endif

set number
set relativenumber
set incsearch
set hlsearch
set shiftwidth=4
set tabstop=4
set smartindent
set cursorline
set foldmethod=syntax
set nofoldenable
set clipboard=unnamed
" set backspace=indent,eol,start
" set background=dark
" colorscheme gruvbox 
colorscheme OceanicNext 
syntax enable

" Key mappings
noremap <F3> :NERDTreeToggle<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap + ddkP
nnoremap - ddp
inoremap <leader>u <esc>viwUi
nnoremap <leader>u viwU
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
nnoremap <leader>( viw<esc>a)<esc>hbi(<esc>lel
vnoremap <leader>" <esc>a"<esc>`<i"<esc>
vnoremap <leader>' <esc>a'<esc>`<i'<esc>
vnoremap <leader>( <esc>a)<esc>`<i(<esc>
" nnoremap H ^
" nnoremap L $

iabbrev @@ paul_shu@keysight.com
iabbrev ccopy //<cr>// Copyright 2017 Keysight Technologies<cr>//<cr>
iabbrev ssig -- <cr>Paul Shu<cr>paul_shu@keysight
augroup special_code_indent
	autocmd!
	autocmd FileType ruby,javascript :setlocal shiftwidth=2 tabstop=2
augroup END
" Folding setting for XML file type
augroup xmlfolding
	autocmd!
	autocmd FileType xml let g:xml_syntax_folding=1
	autocmd FileType xml setlocal foldmethod=syntax
	autocmd FileType xml :syntax on
	autocmd FileType xml :%foldopen!
augroup end

packadd! matchit
