set number " turn on line numbers
set number relativenumber " set numbers to be relative
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nohlsearch
set smartindent
set incsearch
set scrolloff=8
set signcolumn=yes " set visible most left column
set colorcolumn=150 " set visible line which marks N symbols line lenght
set conceallevel=2 " to replace markdown representation of emphasize words
set concealcursor=c " to replace markdown representation of emphasize words. Dosent conceal then cursor on the line 
set shell=/bin/bash\ -i " allows vim use system bash with all alises (this is what it for)
" Use <c-space> to trigger completion. (COC)
if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fzf first plugin
Plug 'junegunn/fzf.vim' " fzf second plugin
Plug 'gruvbox-community/gruvbox' " gruvbox colorscheme
Plug 'HerringtonDarkholme/yats.vim' " react syntax highlight
Plug 'pangloss/vim-javascript' " JS highlight
Plug 'uiiaoo/java-syntax.vim' " Java highlight
Plug 'puremourning/vimspector' " debugger
let g:vimspector_enable_mappings = 'HUMAN' " sets up default mapping in debag
Plug 'neoclide/coc.nvim', {'branch': 'release'} " COC
let g:coc_global_extensions = [
      \ 'coc-tsserver',
      \ 'coc-java'
  \ ]
Plug 'godlygeek/tabular' " markdown highlighting
Plug 'preservim/vim-markdown' " markdown highlighting
call plug#end()

colorscheme gruvbox
highlight clear SignColumn " must be after colorscheme. Removes color from most left sign column
hi ColorColumn ctermbg=darkgrey guibg=darkgrey " changes color of the colorcolumn

" remapings

" GoTo code navigation. (for Coc plugin)
 nmap <silent> gd <Plug>(coc-definition)
 nmap <silent> gy <Plug>(coc-type-definition)
 nmap <silent> gi <Plug>(coc-implementation)
 nmap <silent> gr <Plug>(coc-references)
