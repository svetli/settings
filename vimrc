" ----------------------------------------------------------
" Disable splash screen
" ----------------------------------------------------------
:set shortmess +=I

" ----------------------------------------------------------
" Enable pathogen bundles
" ----------------------------------------------------------
filetype off
execute pathogen#infect()
filetype plugin indent on

" ----------------------------------------------------------
" Set mapleader
" ----------------------------------------------------------
let mapleader = ","

" ----------------------------------------------------------
" Basic options
" ----------------------------------------------------------
:set autoindent					" turn on auto-indenting
:set backspace=indent,eol,start " allows backspacing beyond starting point of insert mode, indents and line breaks
:set clipboard=unnamed			" work with system clipboard
:set cursorline					" highlight cursor line
:set colorcolumn=+1				"
:set encoding=utf-8 			" set encoding
:set expandtab					"
:set foldenable                 " enable code folding
:set foldmethod=indent          "
:set foldlevelstart=5           "
:set formatoptions=qrn1 		"
:set gdefault					" make searches globaly /g
:set hlsearch					" highlight searches
:set hidden						"
:set ignorecase					" ignores case in search patterns
:set incsearch					" highlight searches
:set lazyredraw                 " 
:set laststatus=2				" show info in ruler
:set listchars+=tab:▸\			"
:set listchars+=eol:¬			"
:set listchars+=extends:❯		"
:set listchars+=precedes:❮		"
:set linebreak                  " wrap long lines at a space instead of in the middle of a word
:set modelines=0				" turn off modelines
:set nocompatible				" use vim settings instead vi
:set noswapfile                 " no swap files
:set nobackup                   " no backup files
:set number						" show line numbers
:set pastetoggle=<ins>          " toggle paste with <ins>
:set ruler						"
":set relativenumber				" display line number column
":set regexpengine=1             " slow scrolling with new regexpengine
:set showbreak=↪				"
:set showmatch					" show search matches
:set showmode					"
:set showcmd					" display an incomplete command in the lower right
:set shiftround					"
:set shiftwidth=4				" width (in spaces) used in each step of autoindent (aswell as << and >>)
:set scrolljump=5				" set scrolling
:set scrolloff=3				"
:set softtabstop=4 				" let backspace delete indent
:set smarttab					" code indent
:set smartcase					" don't ignore case when the search pattern has uppercase
:set smartindent				"
:set synmaxcol=500              " dont try highlight lines longer than 500 chars
:set tabstop=4					" width (in spaces) that a <tab> is displayed as
:set textwidth=120				" number of columns before an automatic line break is inserted (see formatoptions)
:set ttyfast					"
:set ttyscroll=3                "
:set wildmenu					" show list instead of just completing
:set wrap						" handle long lines correctly
:set wrapscan                   " wrap the scan around the document

" ----------------------------------------------------------
" Clean up GUI
" ----------------------------------------------------------
if has("gui_running")
    set guioptions-=T
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
    set guioptions-=m
    set guioptions-=b
    set guifont=Terminess\ Powerline\ 13
    set background=dark
    set lines=30
    set columns=100
endif


" ----------------------------------------------------------
"  Resize splits when the window is resized
" ----------------------------------------------------------
:autocmd VimResized * :wincmd =

" ----------------------------------------------------------
"  Auto reload vimrc when it's saved
" ----------------------------------------------------------
:autocmd BufWritePost .vimrc so ~/.vimrc

" ----------------------------------------------------------
"  Template Files
" ----------------------------------------------------------
:autocmd BufNewFile *.html 0r $HOME/.vim/templates/template.html
:autocmd BufNewFile *.php 0r $HOME/.vim/templates/template.php
:autocmd BufNewFile *.xml 0r $HOME/.vim/templates/template.xml
:autocmd BufRead,BufNewFile *.less setfiletype css

" ----------------------------------------------------------
" Disable arrow keys
" ----------------------------------------------------------
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" ----------------------------------------------------------
" Set color scheme
" ----------------------------------------------------------
:syntax enable
:set t_Co=256
":let g:solarized_termcolors=256 "
:set background=dark
:colorscheme solarized

command! Light :set background=light
command! Dark :set :background=dark

nmap <silent> <F5> :set background=dark<CR><BAR>:let g:airline_solarized_bg='dark'<CR><BAR>:AirlineTheme solarized<CR>
nmap <silent> <F6> :set background=light<CR><BAR>:let g:airline_solarized_bg='light'<CR><BAR>:AirlineTheme solarized<CR>

" ----------------------------------------------------------
" Tune up regex search
" ----------------------------------------------------------
nnoremap / /\v
vnoremap / /\v

" ----------------------------------------------------------
" Save
" ----------------------------------------------------------
nnoremap <Leader>w :update<CR>
vnoremap <Leader>w <C-C>:update<CR>
inoremap <Leader>w <C-O>:update<CR>

" sudo save
:cmap w!! w !sudo tee % >/dev/null

" ----------------------------------------------------------
" Remap F1 to ESC
" ----------------------------------------------------------
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" ----------------------------------------------------------
" Remap ESC key
" ----------------------------------------------------------
:map! kj <esc>
:map! jj <esc>

" ----------------------------------------------------------
" Moving without skip wrapped lines
" ----------------------------------------------------------
noremap j gj
noremap gj j
noremap k gk
noremap gk k

" ----------------------------------------------------------
" Jump to start and end of line using the home row keys
" remapping common-keys
" ----------------------------------------------------------
noremap H ^
noremap L $

" ----------------------------------------------------------
"  Reselect visual block after indent/outdent
" ----------------------------------------------------------
vnoremap < <gv
vnoremap > >gv

" ----------------------------------------------------------
" Select all in current buffer
" ----------------------------------------------------------
map <Leader>a ggVG

" ----------------------------------------------------------
" Buffer management
" ----------------------------------------------------------
nmap <Leader>b :ls<CR>:buffer<Space>
nmap <Leader>l :bnext<CR>
nmap <Leader>h :bprev<CR>
nmap <Leader>bq :bprev <BAR> bd #<CR>

" ----------------------------------------------------------
"  Move yankring history file outside home dir
" ----------------------------------------------------------
let g:yankring_history_dir = '/tmp'

" ----------------------------------------------------------
" Plugin: syntastic
" ----------------------------------------------------------
let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=0
let g:syntastic_auto_jump=0
let g:syntastic_auto_loc_list=1
let g:syntastic_enable_signs=1
let g:syntastic_stl_format='[%E{%e Errors}%B{, }%W{%w Warnings}]'
let g:syntastic_mode_map={
    \ "mode":"active",
    \ "active_filetypes":['php', 'javascript'],
    \ "passive_filetypes":['java', 'html']
    \ }
nnoremap <Leader>C :SyntasticCheck<CR>

" ----------------------------------------------------------
" Plugin: GUndo
" ----------------------------------------------------------
nnoremap <F7> :GundoToggle<CR>
let g:gundo_debug = 1
let g:gundo_preview_bottom = 1
let g:gundo_tree_statusline = "Gundo"
let g:gundo_preview_statusline = "Gundo Preview"

" ----------------------------------------------------------
" Plugin: airline
" ----------------------------------------------------------
let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tagbar#flags = 'f'

" ----------------------------------------------------------
" Plugin: ctrlp
" ----------------------------------------------------------
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
nnoremap <Leader>o :CtrlP<CR>

" ----------------------------------------------------------
" Plugin: tagbar
" ----------------------------------------------------------
let g:tagbar_phpctags_bin='~/bin/phpctags'
let g:tagbar_phpctags_memory_limit='512M'

" ----------------------------------------------------------
" Plugin: gutentags
" ----------------------------------------------------------
let g:gutentags_ctags_exclude = ['*.css', '*.html', '*.js']
let g:gutentags_cache_dir = '~/.vim.gutentags'
map <silent> <leader>jd :CtrlPTag<cr><c-\>w

" ----------------------------------------------------------
"  Plugin: snipmate
" ----------------------------------------------------------
let g:snippets_dir = "~/.vim/snippets"

" ----------------------------------------------------------

" ----------------------------------------------------------
" PHP Parser Check
" ----------------------------------------------------------
"autocmd FileType php noremap <C-L> :w!<CR>:/usr/bin/php -l %<CR>
"autocmd FileType php noremap <C-M> :w!<CR>:/usr/bin/php %<CR>
autocmd FileType php nnoremap <buffer> <F8> :exe ':!~/.Settings/bin/ctagsgen.sh "tags"'<CR>

" ----------------------------------------------------------
" XMLLint
" ----------------------------------------------------------
"autocmd FileType xml noremap <C-L> :w!<CR>:/usr/bin/xmllint %<CR>

" ----------------------------------------------------------
" JSLint
" ----------------------------------------------------------
"autocmd FileType js noremap <C-L> :w!<CR>:/usr/bin/jslint %<CR>

" ----------------------------------------------------------
" Helpers
" ----------------------------------------------------------
nnoremap <Leader>1 yypVr=
nnoremap <Leader>2 yypVr-

nnoremap <Leader>r <C-w>v<C-w>l
nnoremap <Leader>s <C-w>s<C-w>l

" ----------------------------------------------------------
" Use <ctrl> + direction key to move around within windows
" ----------------------------------------------------------
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" ----------------------------------------------------------
" HTML5
" ----------------------------------------------------------
let g:event_handler_attributes_complete = 0
let g:rdfa_attributes_complete = 0
let g:microdata_attributes_complete = 0
let g:atia_attributes_complete = 0

" ----------------------------------------------------------
" VimFiler
" ----------------------------------------------------------
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_as_default_explorer = 1
nnoremap <silent> <C-e> :<C-U>VimFiler -buffer-name=explorer -split -simple -winwidth=35 -toggle -no-quit<CR>

" ----------------------------------------------------------
"  AG
" ----------------------------------------------------------
let g:agprg="ag --ignore tags --column"

" ----------------------------------------------------------
" Quick Edit
" ----------------------------------------------------------
nnoremap <F3> :vsplit $MYVIMRC<cr>
:command! Cwd :lcd %:p:h

" ----------------------------------------------------------
" ViMux: Quickly run shell commands without leaving Vim
" ----------------------------------------------------------
let g:VimuxHeight = "25"
let g:VimuxOrientation = "v"
let g:VimuxUseNearest = 0

map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>

" ----------------------------------------------------------
" Preserve indent while paste from OSX clipboard
" ----------------------------------------------------------
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>
