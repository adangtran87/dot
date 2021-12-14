if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
  \| endif

call plug#begin('~/.vim/plugged')
" Color
Plug 'morhetz/gruvbox'

" Filebrower
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" tpope
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'

" Syntax
Plug 'ntpeters/vim-better-whitespace'
Plug 'vhda/verilog_systemverilog.vim'
Plug 'heavenshell/vim-pydocstring'
Plug 'calviken/vim-gdscript3'
Plug 'rust-lang/rust.vim'

" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'

call plug#end()

" Colors
let g:gruvbox_italic=0
colorscheme gruvbox
set background=dark

""""" General Options """""
set background=dark
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set listchars=eol:$,tab:>-,extends:>,precedes:<
set list

set number
set nobackup
set nowritebackup
set ignorecase
set noswapfile
syntax on
set t_Co=256
set signcolumn=yes

"Split Movement
nmap gh <C-w>h
nmap gj <C-w>j
nmap gk <C-w>k
nmap gl <C-w>l

" Keep it centered
nnoremap n nzzzv
nnoremap N Nzzzv

" Undo breakpoints
inoremap , ,<c-g>u
inoremap . .<c-g>u

" Replace
nnoremap cn *``cgn
nnoremap cN *``cgN

" Quick movement
nmap J 5j
nmap K 5k
xmap J 5j
xmap K 5k
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Leader Mappings
let mapleader=","
nnoremap <leader>s :StripWhitespace<RETURN>
nnoremap <leader>c :copen<RETURN>
nnoremap <leader>C :cclose<RETURN>

" Since J is overriden give :join another remap
nnoremap <leader>a :join<RETURN>
nnoremap <leader>g :Gstatus<RETURN>
nnoremap <leader>~ :e ~/.vimrc<RETURN>
nnoremap <leader>O :!open %:p<RETURN>

" Programs
nnoremap <leader>n :NERDTree<RETURN>
nnoremap <leader>N :NERDTreeClose<RETURN>
nnoremap <leader>B :Buffers<RETURN>
nnoremap <leader>F :Files ${PWD}<RETURN>
nnoremap <leader>ff :Files<RETURN>
nnoremap <leader>r :Rg<RETURN>

" Diff commands
nmap <leader>dp :diffput<RETURN>
nmap <leader>dg :diffget<RETURN>
nmap <leader>dd :windo diffthis<RETURN>

" Split commands
nmap <leader>ss :split<RETURN>
nmap <leader>vs :vsplit<RETURN>

"Removes search highlight on esc
nnoremap <silent> <esc><esc> :noh<cr><esc>

" pydocstring
let g:pydocstring_doq_path = '/home/$USER/.local/bin/doq'
let g:pydocstring_formatter = 'google'

" Spell
autocmd BufRead,BufNewFile *.txt setlocal spell
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.md setlocal textwidth=80
autocmd FileType gitcommit setlocal spell
