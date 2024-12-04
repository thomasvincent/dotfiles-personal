" -*- mode: vim -*-
" .vimrc - Vim configuration file optimized for macOS

" General Settings
set nocompatible            " Better features, avoid vi compatibility
set encoding=utf-8          " Use UTF-8 as the standard encoding
set clipboard=unnamed       " Use the system clipboard by default
set wildmenu                " Enhanced command completion
set ttyfast                 " Optimize screen redraw
set backspace=indent,eol,start  " Make backspace work in insert mode

" Theme and Appearance
set background=dark
colorscheme solarized       " Solarized color scheme for consistency

" File and Backup Management
set backupdir=~/.vim/backups  " Centralize backup files
set directory=~/.vim/swaps  " Centralize swap files
set undodir=~/.vim/undo     " Centralize undo history
set backupskip=/tmp/*,/private/tmp/*  " Exclude temp files from backups

" Security Settings
set secure                  " Enhance script security
set nomodeline              " Avoid modeline for security reasons
set noexrc                  " Do not auto-read config files from current directory

" Indentation and Tabs
set tabstop=2 shiftwidth=2  " Use 2 spaces for tab and indentation
set expandtab               " Replace tabs with spaces
set smartindent             " Enable smart auto-indenting

" Developer Workflow Enhancements
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': 'brew install fzf' }  " FZF for file searching
Plug 'tpope/vim-fugitive'                          " Git integration
Plug 'dense-analysis/ale'                          " Asynchronous linting
call plug#end()

" Conditional plugin loading based on capabilities
if has('python')
  Plug 'psf/black', { 'for': 'python' }  " Python formatter
endif

" Key Mappings and Functions
function! StripWhitespace()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction
nnoremap <leader>ss :call StripWhitespace()<CR>
nnoremap <leader>W :w !sudo tee % > /dev/null<CR>
nnoremap <leader>o :!open %<CR>
vnoremap <C-c> :w !pbcopy<CR><CR>
nnoremap <C-v> :r !pbpaste<CR>

" Autocommands for File Types
augroup vimrc
  autocmd!
  autocmd FileType python,javascript autocmd BufWritePre <buffer> call StripWhitespace()
  autocmd FileType markdown setlocal wrap spell
  autocmd BufNewFile,BufRead *.md set filetype=markdown
  autocmd BufNewFile,BufRead *.swift set filetype=swift
augroup END
