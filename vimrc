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
:set nocompatible		" use vim settings instead vi
:set modelines=0		" turn off modelines
:set encoding=utf-8 	" set encoding
:set tabstop=4			" set tab width
:set shiftwidth=4		""
:set softtabstop=4 		""
:set expandtab			""
:set scrolljump=5		" set scrolling
:set scrolloff=3		""
:set smarttab			" code indent
:set shiftround			""
:set autoindent			""
:set smartindent		""
:set showmode			""
:set showcmd			""
:set hidden				""
:set wildmenu			""
:set cursorline			""
:set ttyfast			""
:set ruler				""
:set laststatus=2		" show info in ruler
:set relativenumber		" display line number column
:set undofile			" create *.un~ files
:set number				" show line numbers
:set ignorecase			" make case insensitive search
:set smartcase			" make case insensitive search
:set gdefault			" make searches globaly /g
:set incsearch			" highlight searches
:set showmatch			" show search matches
:set hlsearch			" highlight searches
:set clipboard=unnamed	" work with system clipboard
:set wrap				" handle long lines correctly
:set textwidth=80		""
:set colorcolumn=+1		""
:set formatoptions=qrn1 ""
:set backspace=start,eol,indent

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
:let g:solarized_termtrans=1
:let g:solarized_termcolors=16
:set background=light
:colorscheme solarized

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

" ----------------------------------------------------------
" Plugin: syntastic
" ----------------------------------------------------------
let g:syntastic_check_on_open=0
let g:syntastic_auto_jump=1
let g:syntastic_auto_loc_list=1
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['php', 'javascript', 'json', 'html', 'sh', 'docbk', 'css', 'xml', 'xhtml'] }

" ----------------------------------------------------------
" Plugin: tabularize
" ----------------------------------------------------------
if exists(":Tabularize")
	nmap <Leader>a= :Tabularize /=<CR>
	vmap <Leader>a= :Tabularize /=<CR>
	nmap <Leader>a: :Tabularize /:\zs<CR>
	vmap <Leader>a: :Tabularize /:\zs<CR>
endif

" ----------------------------------------------------------
" Plugin: GUndo
" ----------------------------------------------------------
nnoremap <F5> :GundoToggle<CR>
let g:gundo_debug = 1
let g:gundo_preview_bottom = 1
let g:gundo_tree_statusline = "Gundo"
let g:gundo_preview_statusline = "Gundo Preview"

" ----------------------------------------------------------
" Plugin: vim-powerline
" ----------------------------------------------------------
let g:Powerline_symbols="unicode"
" ----------------------------------------------------------

" ----------------------------------------------------------
" PHP Parser Check
" ----------------------------------------------------------
autocmd FileType php noremap <C-L> :w!<CR>:/usr/bin/php -l %<CR>
autocmd FileType php noremap <C-M> :w!<CR>:/usr/bin/php %<CR>

" ----------------------------------------------------------
" XMLLint
" ----------------------------------------------------------
autocmd FileType xml noremap <C-L> :w!<CR>:/usr/bin/xmllint %<CR>

" ----------------------------------------------------------
" JSLint
" ----------------------------------------------------------
autocmd FileType javascript noremap <C-L> :!/usr/local/bin/jsl %<CR>

" ----------------------------------------------------------
" Helpers
" ----------------------------------------------------------
nnoremap <Leader>1 yypVr=
nnoremap <Leader>2 yypVr-

nnoremap <Leader>r <C-w>v<C-w>l
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
" NERD Tree
" ----------------------------------------------------------
noremap  <F2> :NERDTreeToggle<cr>
inoremap <F2> <esc>:NERDTreeToggle<cr>

let NERDTreeHighlightCursorline = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDChristmasTree = 1
let NERDTreeChDirMode = 2

let NERDTreeIgnore = ['.vim$', '\~$', '.*\.pyc$', 'pip-log\.txt$', 'whoosh_index',
                    \ 'xapian_index', '.*.pid', 'monitor.py', '.*-fixtures-.*.json',
                    \ '.*\.o$', 'db.db', 'tags.bak', '.*\.pdf$', '.*\.mid$',
                    \ '.*\.midi$']

" ----------------------------------------------------------
" Quick Edit
" ----------------------------------------------------------
nnoremap <F3> :vsplit $MYVIMRC<cr>
:command! Cwd :lcd %:p:h
