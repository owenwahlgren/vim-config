" General Settings
set number                  " Show line numbers
set nowrap                  " Don't wrap lines
set tabstop=4               " Set tab size to 4 spaces
set shiftwidth=4            " Number of spaces for each step of (auto)indent
set expandtab               " Convert tabs to spaces
set smartindent             " Auto-indent new lines
syntax on                   " Enable syntax highlighting
set re=0                    " Disable regexp engine
set ignorecase              " Case insensitive searching
set smartcase               " Case sensitive when search has uppercase
set hlsearch                " Highlight search results
set incsearch               " Show incremental search results
set backup                  " Enable backups
set backupdir=~/.vim/backups " Directory for backups
set undodir=~/.vim/undo     " Directory for undo history
set undofile                " Enable persistent undo

" Colors and Fonts
set background=dark         " Use a dark background
set guifont=Monaco:h12      " GUI font setting

" Key Mappings
nnoremap <Space> <Nop>      " Disable the space key
inoremap jj <Esc>           " Map 'jj' to escape from insert mode

" Config vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin("~/.vim/plugged")

Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'          " Git integration
Plug 'vim-airline/vim-airline'     " Status/tabline
Plug 'github/copilot.vim'

call plug#end()

" NERDTree Settings
let NERDTreeShowHidden=1              " Show hidden files in NERDTree

" Custom Commands
command WQ wq                          " Alias for saving and quitting

" Filetype specific settings
autocmd FileType python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType html setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

" Ensure .vimrc is sourced when saved
if has("autocmd")
  autocmd BufWritePost .vimrc source %
endif