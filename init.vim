let mapleader = ","
syntax on 
filetype indent on
filetype plugin on
set guicursor=
set number
set nohlsearch
set hidden
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
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
set cmdheight=1
set updatetime=50
set shortmess+=c
set ttyfast
set clipboard+=unnamedplus
set scrolloff=5
call plug#begin(stdpath('data').'/plugged')

Plug 'nvim-lua/completion-nvim'
Plug 'neovim/nvim-lsp'
Plug 'neovim/nvim-lspconfig'
Plug 'shougo/deoplete.nvim'
Plug 'shougo/deoplete-lsp'
Plug 'tjdevries/colorbuddy.vim'
Plug 'tjdevries/gruvbuddy.nvim'
" Plug 'tomasiser/vim-code-dark'
" COLORSCHEME
"" Plug 'chriskempson/base16-vim'
" Plug 'gruvbox-community/gruvbox'
" Plug 'tweekmonster/gofmt.vim'
" Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
"" COMMENTING
Plug 'scrooloose/nerdcommenter'
"" RUST
Plug 'rust-lang/rust.vim'
"" AUTO COMPLETE
" Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
"" CODE PRETTIER
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/0.x'
  \ }
" GO
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

"" ICONS
Plug 'ryanoasis/vim-devicons'

"" TYPESCRIPT
Plug 'sheerun/vim-polyglot'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'leafgarland/typescript-vim'

"" FILE FINDER
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mxw/vim-jsx'

Plug 'nvim-lua/plenary.nvim'
Plug 'tjdevries/express_line.nvim'

"" STATUS LINE
" Plug 'vim-airline/vim-airline'

call plug#end()

"let g:gruvbox_contrast_dark = 'hard'
"if exists('+termguicolors')
    "let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    "let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"endif
" let g:gruvbox_invert_selection='0'


let g:javascript_plugin_jsdoc = 1
let g:vim_jsx_pretty_colorful_config = 1
noremap <leader>l <C-W><right>
noremap <leader>k <C-W><left>

noremap <leader>= :vertical resize +5<CR>
noremap <leader>- :vertical resize -5<CR>

" noremap <silent><leader>w :!wal --theme random_dark &<cr>
" colorscheme base16-solarflare
" set background=dark
" colorscheme gruvbox 
" colorscheme codedark
lua require('colorbuddy').colorscheme('gruvbuddy')
" let g:airline_theme="ayu_mirage"
"let g:airline_theme="serene"
" set background=dark
" colorscheme wal 
" highlight Pmenu ctermbg=111217 guibg=#111217

" Python
noremap ,t :w!\|!python3 %<cr>

" Go 
noremap ,g :w!\|!go run %<cr>

" Rust
let g:rustfmt_autosave = 1

" go
let g:go_fmt_command = "goimports"     
" let g:go_auto_type_info = 1 
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


" --- vim go (polyglot) settings.
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1

" Prettier
let g:prettier#exec_cmd_path = "/usr/bin/prettier"
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#autoformat = 0 

"nmap <leader>gi <Plug>(coc-implementation)
"nmap <leader>gd <Plug>(coc-definition)


let g:fzf_layout = { 'window': {'width': 0.8, 'height': 0.8} }
let $FZF_DEFAULT_OPTS='--reverse'

noremap <leader>f :Files<CR>

let load_matchparen = 1

let g:go_def_mapping_enabled = 0

" COC STUFF
"inoremap <silent><expr> <TAB>
    "\ pumvisible() ? "\<C-n>" :
    "\ <SID>check_back_space() ? "\<TAB>" :
    "\ coc#refresh()
"inoremap <exr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"function! s:check_back_space() abort
"let col = col('.') - 1
"return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

"" Use <c-space> to trigger completion.
"inoremap <silent><expr> <c-space> coc#refresh()

let g:deoplete#enable_at_startup = 1
let g:deoplete#auto#complete#popup = "manual"
set completeopt-=preview
autocmd Filetype rust,python,go,c,cpp,js,ts setl omnifunc=v:lua.vim.lsp.omnifunc
:lua << END
  require'nvim_lsp'.tsserver.setup{}
  require'nvim_lsp'.clangd.setup{}
  require('el').setup{}
	require'nvim_lsp'.rust_analyzer.setup{}
END
nnoremap <leader>gd    <cmd>lua vim.lsp.buf.declaration()<CR>
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#manual_complete()
autocmd filetype c nnoremap <F4> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
