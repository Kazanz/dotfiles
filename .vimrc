execute pathogen#infect()
syntax on
filetype plugin indent on

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

"Pathogen
execute pathogen#infect()
call pathogen#helptags()
syntax on
filetype plugin indent on

set t_Co=256

syntax enable
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

if has('gui_running')
        set background=light
    else
            set background=dark
        endif

set nofoldenable

" clipboard fusion!
set clipboard^=unnamed clipboard^=unnamedplus


let g:pymode_rope_complete_on_dot = 0


set hlsearch
set showmatch
set ignorecase
set smarttab
set nowrap
set autoindent

set history=1000
set undolevels=1000
set wildignore=*.swp,*.pyc
set title

set nobackup
set noswapfile

set colorcolumn=80

"Command P
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

"Command T
let g:CommandTSelectNextMap = '<C-j>'
let g:CommandTSelectPrevMap = '<C-k>'
let g:CommandTAcceptSelectionSplitMap = "]"
let g:CommandTAcceptSelectionVSplitMap = "<C-]>"

"Moving between buffers
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Single Row Vertical Movement
:nmap j gj
:nmap k gk


" Make ultisnips and YCM work together.
""" YouCompleteMe
let g:ycm_key_list_previous_completion=['<Up>']

"" Ultisnips
let g:UltiSnipsListSnippets="<c-s-tab>"
let g:UltiSnipsExpandTrigger = "<c-s-v>"

""""" Settings for taglist.vim
let Tlist_Use_Right_Window=1
let Tlist_Auto_Open=0
let Tlist_Enable_Fold_Column=0
let Tlist_Compact_Format=0
let Tlist_WinWidth=28
let Tlist_Exit_OnlyWindow=1
let Tlist_File_Fold_Auto_Close = 1
nmap <LocalLeader>tt :Tlist<cr>
