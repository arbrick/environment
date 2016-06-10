
"=================================================================================================
" Vundle setup
"=================================================================================================
" Setup Vundle
" REF https://github.com/gmarik/Vundle.vim
set nocompatible              " be iMproved, required
filetype off                  " required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	" Let Vundle manage Vundle, required
	Plugin 'gmarik/Vundle.vim'
    " Autocomplete thing
    Plugin 'Shougo/neocomplete'
    " Colors!
    Plugin 'nielsmadan/harlequin'
    Plugin 'tomasr/molokai'
    Plugin 'mopp/mopkai.vim'
    Plugin 'sjl/badwolf'
call vundle#end()

"=================================================================================================
" Vim options
"=================================================================================================
" Determine auto indent settings based on filetype/contents, load plugins/indent files based on that
filetype indent plugin on
" Set colorscheme
colorscheme harlequin
" Enable syntax highlighting
syntax enable
" Number of spaces per TAB
set tabstop=4
set shiftwidth=4
set expandtab
" Show line numbers
set number
" Show last command in bottom bar
set showcmd
" Highlight current line
set cursorline
" Visual autocomplete for command menu
set wildmenu
" Redraw the screen only when needed (speeds up macros)
set lazyredraw
" Highlight matching paren
set showmatch
" Search as chars are entered
set incsearch
" Highlight search matches
set hlsearch
" Enable folding
set foldenable
" Open most folds by default
set foldlevelstart=10
" Set fold based on indent
set foldmethod=indent
" Move vertically by visual line
nnoremap j gj
nnoremap k gk
" Map <esc> to somewhere around the home row
inoremap jk <esc>
" Use case insensitive searching except when searching capital letters
set ignorecase
set smartcase
" Enable autoindent for files that have unknown filetypes
set autoindent
" Confirm exit with unsaved changes
set confirm
" Use visual queue to indicate error (rather than beep)
set visualbell
" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
" Enable auto indent
set ai
" Enable smart indent
set si
" Wrap lines
set wrap
" How many lines to force vim to keep in view when scrolling
set scrolloff=10
" Make paste work like it should
set pastetoggle=<F10>
inoremap <C-v> <F10><C-r>+<F10>

"=================================================================================================
" Neocomplete
"=================================================================================================
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
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

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

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
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
