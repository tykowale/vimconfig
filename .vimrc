set nocompatible

" Pathogen init
source ~/.vim/bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" Plugin mappings
nnoremap <silent> <leader>nf :NERDTreeFind<cr><c-w>=
nnoremap <silent> <leader>nt :NERDTreeToggle<cr><c-w>=
nnoremap <silent> <leader>ff :CtrlP<cr>
nnoremap <silent> <leader>fb :CtrlPBuffer<cr>
nnoremap <silent> <leader>ww :FixWhitespace<cr>

" Convenience mappings
nnoremap <silent> <leader><cr>  :tabnew<cr>
nnoremap <silent> <leader>]     gt
nnoremap <silent> <leader>[     gT
nnoremap <silent> <leader>nh    :nohls<cr>
nnoremap <silent> <leader>rr    :set relativenumber!<cr>
nnoremap <silent> <leader>ev    :vsplit $MYVIMRC<cr>
nnoremap          <leader>sv    :source $MYVIMRC<cr>
inoremap          jj            <esc>l
inoremap          jk            <esc>l
inoremap          <c-l>         <Space>=><Space>
inoremap          OA          <up>
inoremap          OB          <down>
inoremap          OC          <right>
inoremap          OD          <left>
nnoremap          OA          <up>
nnoremap          OB          <down>
nnoremap          OC          <right>
nnoremap          OD          <left>
nnoremap          <c-h>         <c-w>h
nnoremap          <c-j>         <c-w>j
nnoremap          <c-k>         <c-w>k
nnoremap          <c-l>         <c-w>l

" Abbreviations
cnoreabbrev Q q
cnoreabbrev W w
cnoreabbrev Wa wa
cnoreabbrev wA wa
cnoreabbrev WA wa
cnoreabbrev Qa qa
cnoreabbrev qA qa
cnoreabbrev QA qa
cnoreabbrev X x

runtime macros/matchit.vim

" General settings
filetype plugin indent on
set hlsearch incsearch
set hidden
set showmatch
set dir=/tmp//
set softtabstop=4 tabstop=4 shiftwidth=4 expandtab smarttab
set wrap
set scrolloff=4
set number
set ruler
set backspace=indent,eol,start
set undolevels=1000 "maximum number of changes that can be undone
set showcmd
set modifiable
set write

" Turn off alarm bells
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

" Cursor shapes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Status line
set laststatus=2
set statusline=
set statusline+=%<\                       " cut at start
set statusline+=%2*[%n%H%M%R%W]%*\        " buffer number, and flags
set statusline+=%-40f\                    " relative path
set statusline+=%=                        " seperate between right- and left-aligned
set statusline+=%1*%y%*%*\                " file type
set statusline+=%10(L(%l/%L)%)\           " line
set statusline+=%2(C(%v/125)%)\           " column
set statusline+=%P                        " percentage of file

" Color Scheme info
syntax enable
set background=dark
let g:solarized_visibility="high"
let g:solarized_contrast="high"
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized

" Plugin settings
let NERDTreeShowHidden=1
let g:syntastic_quiet_messages = { "level": "warnings",
                                 \ "type":  "style",
                                 \ "regex": 'proprietary attribute',
                                 \ "file":  '.*\.html$' }
let g:ctrlp_show_hidden = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = "/tmp/"
let g:ctrlp_custom_ignore = { 'dir':  '\(node_modules\|.git\|.tmp\)$'
                            \ }

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
