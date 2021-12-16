call plug#begin('~/.vim/plugged')

" Colorschemas"
Plug 'morhetz/gruvbox'
														
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'https://github.com/tiagofumo/vim-nerdtree-syntax-highlight'

" Git plugins
Plug 'airblade/vim-gitgutter'
Plug 'rbong/vim-flog'
Plug 'tpope/vim-fugitive'
Plug 'kdheepak/lazygit.nvim'

" Autocomplite
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" list of CoC extensions needed
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-snippets']

"this will auto close ( [ {
Plug 'jiangmiao/auto-pairs'

" Comments
Plug 'preservim/nerdcommenter' 

" these two plugins will add highlighting and indenting to JSX and TSX files.
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'

" Search
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" Navigation
Plug 'easymotion/vim-easymotion'

" Airline
Plug 'vim-airline/vim-airline'

" Editorconfig support
Plug 'editorconfig/editorconfig-vim'

" HTML
Plug 'mattn/emmet-vim'

" Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" undo plugin
Plug 'mbbill/undotree'

" Vim tests
Plug 'vim-test/vim-test'
Plug 'rcarriga/vim-ultest', { 'do': ':UpdateRemotePlugins' }

" Initialize plugin system
call plug#end()

" Initialize gruvbox theme
colorscheme gruvbox

set updatetime=120
set colorcolumn=120
set number
set encoding=utf-8
set spell spelllang=en_us
set mouse=a

set tabstop=2 softtabstop=2
set shiftwidth=2
set relativenumber
set number
"set nohlsearch
"set incsearch 
set hidden
set nowrap
set scrolloff=8
set signcolumn=yes
set nofoldenable
set foldlevelstart=99
set foldmethod=syntax
set smartcase 
set noswapfile
set nobackup
" share clipboard across vim sessions
set clipboard=unnamedplus

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Vim tests plugin ultest
let test#javascript#jest#options = "--color=always"
let g:ultest_use_pty = 1

" Commentary Plugin
nmap <C-_>   <Plug>NERDCommenterToggle
vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv

" NERDTree shortcuts 
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <leader>1 :NERDTreeFind<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
"nnoremap <C-n> :NERDTree<CR>
"nnoremap <C-f> :NERDTreeFind<CR>

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Show dotted hidden files in NERDTree
let NERDTreeShowHidden=1

" Emmet settings
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}

autocmd BufRead * normal zR

" nextuffer;
nnoremap  <silent> <Tab>    :bnext<CR>
" previous buffer;
nnoremap  <silent> <S-Tab>  :bprevious<CR>
" `_bufferNumber_ + <Tab>` - go exact the buffer number;
" nnoremap  <silent> <Tab>            <C-^>

" CTRL-C to copy (visual mode)
" imap <S-Tab> <C-d>

map <Leader> <Plug>(easymotion-prefix)
map <silent> <C-h> :call WinMove('h')<CR>
map <silent> <C-j> :call WinMove('j')<CR>
map <silent> <C-k> :call WinMove('k')<CR>
map <silent> <C-l> :call WinMove('l')<CR>

function! WinMove(key)
	let t:curwin = winnr()
	exec "wincmd ".a:key
	if (t:curwin == winnr())
		if(match(a:key, '[jk]'))
			wincmd v
		else
			wincmd s
		endif
		exec "wincmd ".a:key
	endif
endfunction
	
" mbbill/undotree
nnoremap <F5> :UndotreeToggle<CR>

" PLUGIN: FZF
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>g :Commits<CR>
nnoremap <silent> <Leader>H :Helptags<CR>
nnoremap <silent> <Leader>hh :History<CR>
nnoremap <silent> <Leader>h: :History:<CR>
nnoremap <silent> <Leader>h/ :History/<CR>

set grepprg=rg\ --vimgrep\ --smart-case\ --follow
