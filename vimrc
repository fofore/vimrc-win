"fofore's vimrc
"Minming Qian <qianminming@gmail.com> www.fofore.com
"Fork me in GITHUB https://github.com/fofore/vimrc

"For pathogen.vim :auto load all plugins in 'vimpath'/bundle
let g:pathogen_disabled = [] 
call pathogen#infect()

"--------------------------------------------------------------------------------
" General Settings
"-------------------------------------------------------------------------------- 

set nocompatible            " not compatible with the old-fashion vi mode
set bs=2                    " allow backspacing over everything in insert mode
set history=50              " keep 50 lines of command line history
set ruler                   " show the cursor position all the time
set autoread                " auto read when file is changed from outside
set nowrap                  " wrat setting
set textwidth=200           " set the max textwith

filetype on                 " Enable filetype detection
filetype indent on          " Enable fileytpe-specific indenting
filetype plugin on          " Enable filetype-specific plugins

" input method setting 
if has("gui_running")  
    set imactivatekey=D-space  
    inoremap <ESC> <ESC>:set iminsert=0<CR>  
endif

" auto reload _vimrc when editing it
if has('win32')
    autocmd! bufwritepost _vimrc source $VIM\_vimrc
else
    autocmd! bufwritepost .vimrc source ~/.vimrc
endif


" GUI color and font settings
if has('gui_running')
    colors moria
    set cursorline          " highlight current line
    highlight CursorLine    guibg=#003853 ctermbg=24 gui=none cterm=none
    set guioptions-=m       "hide the menu toolbar
    set guioptions-=T       "hide the tool toolbar
    set guioptions-=r       "hide the ride scroll bar
    set guioptions-=L       "hide the left scroll bar
    set guifont=Mensch\ for\ Powerline:h10
else
    colors lucius
endif


syntax enable
syntax on                   " syntax highlight
set hls                     " search highlighting

" disable sound on errors
set noerrorbells
set novisualbell
set tm=500

set autochdir
set nu                      " show line number 
set clipboard=unnamed       " yank to the system register (*)  by default
set showmatch               " Cursor shows matching ) and }
set showmode                " show current mode
set wildchar=<TAB>          " start wild expansion in the command linpathogene using <TAB>
set wildmenu                " wild char completion menu

" ignore these files while expanding wild chars
set wildignore=*.o,*.class,*.pyc


set nobackup                " no *~backup file
set incsearch               " incremental search
set copyindent              " copy the previous indentation on autoindenting
set ignorecase              " ignore case when searching
set smartcase               " ignore case if search pattern is all lowercase,case-sensitive othterwise


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Use spaces instead of tabs
set expandtab

"Be smart when using tabs
set smarttab

"1 tab == 4spaces
set tabstop=4               " tab length
set shiftwidth=4            
set autoindent
set smartindent
set wrap
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => End of this section
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd Filetype Makefile set noexpandtab

" status line by powerline
set laststatus=2
let g:Powerline_symbols = 'unicode'

function! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return '[PASTE]'
    else
        return ''
    endifcygwin
endfunction

" C/C++ specific settings
autocmd FileType c,cpp,cc set cindent comments=sr:/*,mb:*,el:*/,:// cino=>s,e0,n0,f0,{0,}0,^-1s,:0,=s,g0,h1s,p2,t0,+2,(2,)20,*30


"--------------------------------------------------------------------------------
" Encoding Settings
"-------------------------------------------------------------------------------- 
set encoding=utf-8
set termencoding=utf-8
set fileencoding=chinese
set fileencodings=ucs-bom,utf-8,gbk,cp936,big5,gb2312,latin1 


"---------------------------------------
" Menu Settings, the message and the menu in English, this is so good
"---------------------------------------
language messages en_US
set langmenu=en_US
let $LANG='en_US'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim


"--------------------------------------------------------------------------------
" Mswin Settings
"-------------------------------------------------------------------------------- 
if has('win32')
    source $VIMRUNTIME/vimrc_example.vim    "the vim runtime dir setted when install 
    source $VIMRUNTIME/mswin.vim
    behave mswin
endif


if has('multi_byte_ime')
    "highlight Cursor guibg=Green guifg=NONE
    highlight CursorIM guibg=Purple guifg=NONE
endif



"----------------------------------
" full screen VIM and let VIM biggest after start VIM
"----------------------------------
map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
"if has('gui_running') && has("win32")
"    au GUIEnter * simalt ~x
"endif


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

""""""""""""""""""""""""""""""
" => fencview setting, fancy vim is used to resolve the messy chinese problems
""""""""""""""""""""""""""""""
let g:fencview_autodetect = 1


""""""""""""""""""""""""""""""
" => CtrlP setting, keyboard map
""""""""""""""""""""""""""""""
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

""""""""""""""""""""""""""""""
" => c make new
""""""""""""""""""""""""""""""
autocmd FileType c,cpp map <buffer> <leader><spaautocomplpop work with snipmatece> :w<cr>:make<cr>
let mapleader=","
nmap <leader>cn :cn<cr>
nmap <leader>cp :cp<cr>
nmap <leader>cw :cw 10<cr>

""""""""""""""""""""""""""""""
" => minibufexpl setting
""""""""""""""""""""""""""""""
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplMapWindowNavVim = 1

""""""""""""""""""""""""""""""
" => makeprg for c files
""""""""""""""""""""""""""""""
set makeprg=gcc\ -Wall\ -o\ %<\ %<.c

""""""""""""""""""""""""""""""
" => ctags 
""""""""""""""""""""""""""""""
"let g:ctags_statusline=1
let g:ctags_regenerate=1
let g:ctags_title=1
let Tlist_Show_Menu=1
set tags=tags;
nmap <F9> <ESC>:!ctags -R *<CR>

""""""""""""""""""""""""""""""
" => taglist 
""""""""""""""""""""""""""""""
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
nnoremap <silent> <F8> :TlistToggle<CR>

""""""""""""""""""""""""""""""
" => autocomplpop work with snipmate
""""""""""""""""""""""""""""""
let g:acp_behaviorSnipmateLength=1
let g:acp_ignorecaseOption=1


""""""""""""""""""""""""""""""
" => winmanager
""""""""""""""""""""""""""""""
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<CR>


