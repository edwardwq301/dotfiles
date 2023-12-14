if has("syntax")
  syntax on
endif

"runtime! debian.vim



let mapleader = ","
set timeout timeoutlen=1000 ttimeoutlen=1000
nnoremap \ :x
nnoremap <leader>t :echo "Leader key works!"<CR>


set noeb  "no error sound"
set encoding=utf-8
set nocompatible
set smartcase		" Do smart case matching
set autoindent
set smartindent
set wrap
set hlsearch


set statusline=[%l,%v,%P]\ %{strftime(\"%H:%M\")}%=%F%r 
"%= means right aligned

"set autowrite		
" Automatically save before commands like :next and :make

set viewoptions=folds,options,cursor,unix,slash 
" Better Unix / Windows compatibility

set whichwrap=b,s,h,l,<,>,[,]



" Colorscheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:molokai_original = 0

if has('gui_running')
    colorscheme base16-gruvbox-dark-hard
elseif exists("+termguicolors")
    set termguicolors
    " The commands below are needed for tmux + termguicolors
    " This is only necessary if you use "set termguicolors".
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

    " fixes glitch? in colors when using vim with tmux
    set background=dark
    set t_Co=256

    " colorscheme sonokai
    " let g:sonokai_style = 'shusia'

elseif &t_Co < 256
    colorscheme molokai
    set nocursorline " looks bad in this mode
endif

" Use a line cursor within insert mode and a block cursor everywhere else.
"
" Reference chart of values:
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).
"   Ps = 6  -> steady bar (xterm).
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"


" Spaces & Tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " Insert 4 spaces on a tab
set expandtab       " tabs are spaces, mainly because of python

" UI Config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number              " show line numbers
set relativenumber      " show relative numbering
set showcmd             " show command in bottom bar
"set cursorline          " highlight current line
"hi cursorline guibg=black
filetype indent on      " load filetype-specific indent files
filetype plugin on      " load filetype specific plugin files
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]
set laststatus=2        " Show the status line at the bottom
set mouse+=a            " A necessary evil, mouse support
set noerrorbells visualbell t_vb=    "Disable annoying error noises
set splitbelow          " Open new vertical split bottom
set splitright          " Open new horizontal splits right
set linebreak           " Have lines wrap instead of continue off-screen
"set scrolloff=12        " Keep cursor in approximately the middle of the screen
set ttyfast             " Improve redrawing




" toggle between number and relativenumber
function! ToggleLineNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

function! ToggleALEFix()
    if(g:ale_fix_on_save == 1)
        let g:ale_fix_on_save = 0
    else
        let g:ale_fix_on_save = 1
    endif
endfunc


function! ToggleColorColumn()
    if &colorcolumn == ""
        set colorcolumn=88
    else
        set colorcolumn=
    endif
endfunction

function! ToggleZoom(toggle)
  if exists("t:restore_zoom") && (t:restore_zoom.win != winnr() || a:toggle == v:true)
      exec t:restore_zoom.cmd
      unlet t:restore_zoom
  elseif a:toggle
      let t:restore_zoom = { 'win': winnr(), 'cmd': winrestcmd() }
      vert resize | resize
  endif
endfunction
augroup restorezoom
    au WinEnter * silent! :call ToggleZoom(v:false)
augroup END


command! LineNumberToggle call ToggleLineNumber()
command! ALEfixToggle call ToggleALEFix()
command! ColorColumnToggle call ToggleColorColumn()