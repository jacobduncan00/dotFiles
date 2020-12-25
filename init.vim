filetype plugin indent on
let mapleader = ","
set nu
set nohlsearch
set hidden
syntax on
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
set cmdheight=1
set updatetime=50
set shortmess+=c

call plug#begin(stdpath('data') . '/plugged')

Plug 'itchyny/lightline.vim'
Plug 'pineapplegiant/spaceduck'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tjdevries/express_line.nvim'
Plug 'preservim/nerdcommenter'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

 if exists('+termguicolors')
      let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
      let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
      set termguicolors
    endif

   colorscheme spaceduck
      let g:lightline = {
          \ 'colorscheme': 'spaceduck',
          \ }

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Enter and exit Goyo Binds
noremap tt <cmd>Goyo<CR>
noremap qq <cmd>Goyo!<CR>

noremap <leader>ff :Files<CR>
let g:fzf_preview_windows = 'right:60%'

if executable('rg')
  let g:ackprg = 'rg --vimgrep'
endif

let g:fzf_layout = { 'window': {'width': 0.8, 'height': 0.8} }
