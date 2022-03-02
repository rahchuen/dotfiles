call plug#begin()
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tomlion/vim-solidity'
call plug#end()

set number            " show line numbers
set showcmd           " show command in bottom bar
set cursorline        " highlight current line
set wildmenu          " visual autocomplete for command menu
syntax on
set tabstop=2         " number of visual spaces per tab
set shiftwidth=2
set expandtab
set softtabstop=2     " number of spaces in tab when editing
set noswapfile
set incsearch         " search as characters are entered
set hlsearch          " highlight matches
set foldenable        " enable folding
set foldlevelstart=10 " opens most folds by default
set foldmethod=indent " fold based on indent level
set ruler             " always show current position
set lbr               " Linebreak on 500 characters
set tw=80             " tw = text width
set ai                " Auto indent
set si                " Smart indent
set wrap              " Wrap lines
set visualbell        " No sounds
set showmode          " Show curent mode at the bottom
set ignorecase        " Ignore case while searching
set mouse=a           " Enable mouse
set incsearch
set ignorecase
set smartcase
"set clipboard=unamed
""Change window splits
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l
map \q :nohlsearch<CR>

set splitbelow
set splitright
set cc=80

""NERDTree
map <C-o> :NERDTreeToggle<CR>
autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"FZF fuzzy file search
nnoremap <C-p> :FZF<cr>

" get occurences of word searchable through double left click
" "   note: that it removes default visual mode selection of word
:map <2-LeftMouse> *

