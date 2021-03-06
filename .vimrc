execute pathogen#infect()

" General options
set fileformat=unix
set encoding=utf-8

" Use vim defaults
set nocompatible

" Editor general features
set number
set numberwidth=5
syntax on
set autoread
set noerrorbells
set novisualbell
set laststatus=2
set writeany
set showcmd
set ruler
set ttyfast
set lazyredraw
" set mouse=a
set backspace=indent,eol,start
set history=100
set undolevels=150
set scrolloff=5 " Show 5 lines above/below the cursor when scrolling.
set title " Set the title in the console.
filetyp off
filetype plugin indent on

" Tabs, spaces, indentation...
set nowrapscan
set nowrap
set showtabline=4
set expandtab " will insert spaces for tabs
set smartindent
set foldmethod=marker
set showmatch
set matchtime=3
set tabstop=4 " will set the tabs to display as four spaces
set shiftwidth=4 " indents will have a width of  
set softtabstop=4

" Search options
set ignorecase
set incsearch
set infercase
set hlsearch

" Defining <leader> key
:let mapleader=" "

" Leader Mappings
map <Leader>q :qall<CR>

" Tagbar Plugin
autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag/plugin/closetag.vim

" SuperTab
let g:SuperTabDefaultCompletionType = ""

" Tagbar
let g:tagbar_usearrows = 1
nnoremap <F7> :TagbarToggle<CR>

" Solarize Color Scheme
syntax enable
set background=dark
set t_Co=256 
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized

" Highlight line number of where cursor currently is
hi CursorLineNr guifg=#050505

" Nerd Tree Explorer
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Opens in a new tab
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <F9> :NERDTreeFind<CR>

" Toggle Tabs Easily
nnoremap <C-l> :tabprevious<CR>
nnoremap <C-h> :tabnext<CR>

" FILE SEARCH AG
" The Silver Searcher
if executable('ag')
	" Use ag over grep
	set grepprg=ag\ --nogroup\ --nocolor
	" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g "'
	" ag is fast enough that CtrlP doesn't need to cache
	let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent!grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>
" alert from changes done to one file outside of Vim
:au FileChangedShell * echo "Warning: File changed on disk"

" Autocompletion Plugin
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" Enable heavy omni completion.
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
  endif
  let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'

" Switch Window easily
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" Only do this part when compiled with support for autocommands.
if has("autocmd")
	" Use filetype detection and file-based automatic indenting.
	filetype plugin indent on

	" Use actual tab chars in Makefiles.
	autocmd FileType make set tabstop=4444 shiftwidth=4 softtabstop=0 noexpandtab
endif

" Inserting a new line without entering to insert mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" SNIPPETS
au BufRead *.ctp set ft=php.html
au BufNewFile *.ctp set ft=php.html

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Highlight cursor line
:set cursorline
