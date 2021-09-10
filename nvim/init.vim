syntax on
filetype plugin indent on

let mapleader = " "

set exrc
set hidden
set guicursor=n-v-c-i:block-Curso
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set autoindent
set tabstop=4 softtabstop=4
set showmatch " Shows matching brackets
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set colorcolumn=100
set noshowmode
set completeopt=menuone,noinsert,noselect
set signcolumn=yes
set cmdheight=1
set updatetime=50
set splitright " open new split panes to right and below
set splitbelow
set listchars=tab:\|\
set list


call plug#begin('~/.config/nvim/plugged')
"Themes
Plug 'gruvbox-community/gruvbox'
Plug 'sts10/vim-pink-moon'
Plug 'arzg/vim-colors-xcode'
Plug 'artanikin/vim-synthwave84'

"Utilities
Plug 'ap/vim-css-color'
Plug 'mbbill/undotree'
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'preservim/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'liuchengxu/vim-which-key'

" auto complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Eslint

"Search and similars
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
call plug#end()

set background=dark
colorscheme gruvbox

source ~/.config/nvim/which-key.vim
nnoremap <leader>ntt :NERDTreeToggle<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>sz <cmd>Telescope find_files<cr>
nnoremap <leader>st <cmd>Telescope live_grep<cr>
nnoremap <leader>sB <cmd>Telescope buffers<cr>

"move line up or down
nnoremap <A-Down> :m .+1<CR>==
nnoremap <A-Up> :m .-2<CR>==
inoremap <A-Down> <ESC>:m .+1<CR>==gi
inoremap <A-Up> <ESC>:m .-2<CR>==gi
vnoremap <A-Down> :m '>+1<CR>gv=gv
vnoremap <A-Up> :m '<-2<CR>gv=gv

"Function that returns the current git branch
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

" show documentation used by CoC
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

"Change NerdTree arrows
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#hunks#enabled=1
let g:airline_section_b='%{GitBranch()}'
let g:airline_theme='deus'

let NERDTreeShowHidden=1

" CoC config
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
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

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
