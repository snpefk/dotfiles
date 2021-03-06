call plug#begin('/home/snpefk/.local/share/nvim/plugged')

Plug 'nightsense/seabird'
Plug 'udalov/kotlin-vim'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'lambdalisue/vim-gista'
Plug 'majutsushi/tagbar'
Plug 'universal-ctags/ctags'
Plug 'dhruvasagar/vim-table-mode'
Plug 'junegunn/goyo.vim'

call plug#end()
"==============================================
set termguicolors 
colorscheme petrel
highlight Normal guibg=none
highlight NonText guibg=none
"==============================================
set clipboard+=unnamedplus

"==============================================
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set number

nmap <F8> :TagbarToggle<CR>
set tabstop=4
set shiftwidth=4

"fix yaml formatting
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

