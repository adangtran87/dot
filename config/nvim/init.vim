if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
  \| endif

call plug#begin('~/.vim/plugged')
" Color
Plug 'gruvbox-community/gruvbox'

" Filebrower
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'nvim-telescope/telescope.nvim'

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

" Terminal
Plug 'voldikss/vim-floaterm'

call plug#end()
filetype plugin indent on

" Colors
let g:gruvbox_italic=0
nnoremap <leader>t :FloatermToggle<CR>
tnoremap <leader>t <C-\><C-n>:FloatermToggle<CR>
nnoremap <leader>mt :FloatermSend make test<CR>
nnoremap <leader>ml :FloatermSend make lint<CR>
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
set relativenumber
set cursorline
set nobackup
set nowritebackup
set ignorecase
set noswapfile
syntax on
set t_Co=256
set signcolumn=yes
set colorcolumn=120

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
nnoremap <leader>cn :cnext<RETURN>
nnoremap <leader>cp :cprev<RETURN>
nnoremap <leader>C :cclose<RETURN>
nnoremap <leader>R :source $HOME/.config/nvim/init.vim<CR>

" Since J is overriden give :join another remap
nnoremap <leader>a :join<RETURN>
nnoremap <leader>g :Git<RETURN>
nnoremap <leader>~ :e $HOME/.config/nvim/init.vim<RETURN>
nnoremap <leader>O :!open %:p<RETURN>

command! -bang -nargs=* Rgc
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -tc '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

command! -bang -nargs=* Rgpy
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -tpy '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Programs
nnoremap <leader>n :NERDTree<RETURN>
nnoremap <leader>N :NERDTreeClose<RETURN>
nnoremap <leader>B :Buffers<RETURN>
nnoremap <C-p> :Files ${PWD}<RETURN>
nnoremap <leader>r :Rg<RETURN>
nnoremap <leader>rc :Rgc<RETURN>
nnoremap <leader>rp :Rgpy<RETURN>

" Diff commands
nmap <leader>dp :diffput<RETURN>
nmap <leader>dg :diffget<RETURN>
nmap <leader>dd :windo diffthis<RETURN>

" Split commands
nmap <leader>ss :split<RETURN>
nmap <leader>vs :vsplit<RETURN>

"Removes search highlight on esc
nnoremap <silent> <esc><esc> :noh<cr><esc>

" Spell
autocmd BufRead,BufNewFile *.txt setlocal spell
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.md setlocal textwidth=80
autocmd FileType gitcommit setlocal spell

autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
autocmd BufRead,BufNewFile *.gd setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab

source $HOME/.config/nvim/plugin/godot.vim
source $HOME/.config/nvim/plugin/harpoon.vim
source $HOME/.config/nvim/plugin/lsp.vim
source $HOME/.config/nvim/plugin/pydocstring.vim
source $HOME/.config/nvim/plugin/vim_better_whitespace.vim
