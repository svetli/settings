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
:set cursorline					"
:set colorcolumn=+1				"
:set encoding=utf-8 			" set encoding
:set expandtab					"
:set formatoptions=qrn1 		"
:set gdefault					" make searches globaly /g
:set hlsearch					" highlight searches
:set hidden						"
:set ignorecase					" ignores case in search patterns
:set incsearch					" highlight searches
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
:set ruler						"
:set relativenumber				" display line number column
:set regexpengine=1             " slow scrolling with new regexpengine
:set showbreak=↪				"
:set showmatch					" show search matches
:set showmode					"
:set showcmd					" display an incomplete command in the lower right
:set shiftround					"
:set shiftwidth=4				" width (in spaces) used in each step of autoindent (aswell as << and >>)
:set scrolljump=5				" set scrolling
:set scrolloff=3				"
:set softtabstop=4 				"
:set smarttab					" code indent
:set smartcase					" don't ignore case when the search pattern has uppercase
:set smartindent				" 
:set synmaxcol=500              " dont try highlight lines longer than 500 chars
:set tabstop=4					" width (in spaces) that a <tab> is displayed as
:set textwidth=80				" number of columns before an automatic line break is inserted (see formatoptions)
:set ttyfast					"
:set wildmenu					"
:set wrap						" handle long lines correctly

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
:set background=dark
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
" Plugin: powerline
" ----------------------------------------------------------
let g:Powerline_symbols="fancy"
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
" Helpers
" ----------------------------------------------------------
nnoremap <Leader>1 yypVr=
nnoremap <Leader>2 yypVr-

nnoremap <Leader>r <C-w>v<C-w>l
nnoremap <Leader>s <C-w>s<C-w>l
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
