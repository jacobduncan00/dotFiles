let mapleader = ","
filetype indent on
filetype plugin on
set number
set ttyfast
set shiftwidth=2
set updatetime=300
set shortmess+=c
set clipboard+=unnamedplus
set laststatus=0
set ignorecase
set incsearch
set tabstop=2
set textwidth=80
set cmdheight=1
set autoindent
set smartindent
set softtabstop=2
set expandtab
set nowrap
set scrolloff=5
set matchtime=2
set lazyredraw
set timeoutlen=750
set mouse=a
set noerrorbells
syntax on

call plug#begin(stdpath('data').'/plugged')

Plug 'tpope/vim-fugitive'
" COLORSCHEME
Plug 'dylanaraps/wal.vim'
" COMMENTING
Plug 'scrooloose/nerdcommenter'
" RUST
Plug 'rust-lang/rust.vim'
" AUTO COMPLETE
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
" CODE PRETTIER
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/0.x'
  \ }
" GO
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" ICONS
Plug 'ryanoasis/vim-devicons'

" TYPESCRIPT, JAVASCRIPT, HTML, REACT 
Plug 'mattn/emmet-vim'
Plug 'sheerun/vim-polyglot'
Plug 'sainnhe/edge'
Plug 'pangloss/vim-javascript'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'

" FILE FINDER
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" STATUS LINE
Plug 'vim-airline/vim-airline'

call plug#end()

let g:javascript_plugin_jsdoc = 1
let g:vim_jsx_pretty_colorful_config = 1
noremap <leader>l <C-W><right>
noremap <leader>k <C-W><left>

noremap <silent><leader>w :!wal --theme random_dark &<cr>
colorscheme wal 
highlight Pmenu ctermbg=111217 guibg=#111217

" Python
noremap ,t :w!\|!python3 %<cr>

" Go 
noremap ,g :w!\|!go run %<cr>

" Rust
let g:rustfmt_autosave = 1
let g:go_fmt_command = "goimports"     
let g:go_auto_type_info = 1 
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_chan_whitespace_error = 0
let g:go_highlight_extra_types = 0
let g:go_highlight_space_tab_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1

" Prettier
let g:prettier#exec_cmd_path = "/usr/bin/prettier"
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#autoformat = 0 

let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_layout = { 'window': {'width': 0.8, 'height': 0.8} }

noremap <leader>f :Files<CR>

let g:go_def_mapping_enabled = 0

" COC STUFF
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
inoremap <silent><expr> <c-space> coc#refresh()

" let g:airline_powerline_fonts = 1
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#fnamemod = ':t'
