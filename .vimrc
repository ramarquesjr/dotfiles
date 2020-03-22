colorscheme torte
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set modelineexpr
set spell spelllang=pt
set hlsearch
set incsearch
set t_Co=256

call plug#begin('~/.vim/plugged')
"    Plug 'sheerun/vim-polyglot'
    Plug 'w0rp/ale', { 'do': 'pip install --user flake8 isort yapf ' }
"    Plug 'maralla/completor.vim', { 'do': 'pip install jedi' }
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'lervag/vimtex'
call plug#end()

map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:airline_theme='angr'
let g:airline_powerline_fonts=1
"Desabilitar os pontos indiciando identação
let g:indent_guides_enable_on_vim_startup = 0
let g:polyglot_disabled = ['latex']
let g:vimtex_compiler_latexmk = {
\   'options' : [
\       '-pdf',
\       '-bibtex',
\       '-synctex=1'
\   ],
\}
let g:vimtex_view_general_viewer = 'evince'
