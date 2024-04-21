" -*- mode: vim -*-
" .vimrc - Vim configuration file for macOS

" General Settings
set nocompatible  " Avoid Vi compatibility mode for better features
set encoding=utf-8  " Use UTF-8 for all text
set clipboard=unnamed  " Use the system clipboard by default
set wildmenu  " Enhance completion menus
set ttyfast  " Faster screen redraw
set backspace=indent,eol,start  " Allow backspacing over everything in insert mode

" Theme and Appearance
set background=dark
colorscheme solarized  " Use the Solarized color scheme for consistency

" File and Backup Management
set backupdir=~/.vim/backups  " Store backup files in a centralized location
set directory=~/.vim/swaps  " Store swap files in a centralized location
set undodir=~/.vim/undo  " Store undo history in a centralized location
set backupskip=/tmp/*,/private/tmp/*  " Exclude temporary files from backups

" Security Settings
set secure  " Ensure Vim script cannot run shell commands
set nomodeline  " Disable modeline for security
set noexrc  " Disable reading .vimrc and .gvimrc in the current directory

" Indentation and Tabs
set tabstop=2  " Set tab width to 2 spaces
set shiftwidth=2  " Set shift width to 2 spaces
set expandtab  " Use spaces instead of tabs
set smartindent  " Enable smart indentation

" Developer Workflow Enhancements
" Plugin management via vim-plug
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': 'brew install fzf' }  " Use FZF for efficient file finding
Plug 'tpope/vim-fugitive'  " Git integration for better version control workflows
Plug 'dense-analysis/ale'  " Asynchronous Lint Engine for code linting
call plug#end()

" Conditional plugin loading to optimize startup times
if has('python')
  Plug 'psf/black', { 'for': 'python' }  " Load Black formatter only for Python files
endif

" Key Mappings and Functions
" Strip trailing whitespace
function! StripWhitespace()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction
nnoremap <leader>ss :call StripWhitespace()<CR>

" Save files with sudo
nnoremap <leader>W :w !sudo tee % > /dev/null<CR>

" Open files with the 'open' command
nnoremap <leader>o :!open %<CR>

" Use 'pbcopy' and 'pbpaste' for clipboard interaction
vnoremap <C-c> :w !pbcopy<CR><CR>
nnoremap <C-v> :r !pbpaste<CR>

" Autocommands for Intelligent Environment Setup
if has("autocmd")
  filetype plugin indent on
  augroup vimrc
    autocmd!
    autocmd FileType python,javascript autocmd BufWritePre <buffer> call StripWhitespace()
    autocmd FileType markdown setlocal wrap spell
    autocmd BufNewFile,BufRead *.md set filetype=markdown
    autocmd BufNewFile,BufRead *.swift set filetype=swift
  augroup END
endif
