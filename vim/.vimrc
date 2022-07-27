autocmd!
filetype off

call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'mfukar/robotframework-vim'
Plug 'scrooloose/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go'
Plug 'hashivim/vim-terraform'
Plug 'cespare/vim-toml'
Plug 'avakhov/vim-yaml'

call plug#end()

" scrooloose/syntastic configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_config_file='.flake8' " in the repo/project dir!

" vim-airline/vim-airline configuration
let g:airline_powerline_fonts = 1
let g:airline_theme='tomorrow'

" fatih/vim-go configuration
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" hashivim/vim-terraform configuration
autocmd BufWritePost, *.tf :TerraformFmt

" vim settings
set hidden
filetype plugin indent on

for directory in ['/.vim/backup', '/.vim/swap', '/.vim/undo']
    if !isdirectory($HOME.directory)
        call mkdir($HOME.directory, 'p')
    endif
endfor
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
set viminfo+=n~/.vim/viminfo
" remove trailing white spaces and ^Ms
autocmd BufRead,BufWritePre,FileWritePre * silent! %s/[\r \t]\+$//

" visual settings
set background=dark
set t_Co=256
let g:solarized_termcolors=256
colorscheme solarized
set laststatus=2
" enable background transparency
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE

" visual text settings
set showmatch
set hlsearch
set incsearch
set smartcase

" syntax highlighting settings
syntax enable
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

" buffer settings
set ruler

" input settings
set backspace=indent,eol,start
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set shiftround

" input settings: python
autocmd BufReadPre,BufNewFile *.py setlocal textwidth=79

" input settings: markdown
autocmd BufReadPre,BufNewFile *.md setlocal textwidth=79
