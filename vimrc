set shell=/bin/bash
filetype off

"
" set plugins (vim plugin install check: vimawesome.com)
"

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'VundleVim/Vundle.vim' " vim plugin management
  Plugin 'morhetz/gruvbox' " curl -O https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim
  " check install vim color scheme
  Plugin 'preservim/tagbar'
  Plugin 'preservim/nerdtree'
  Plugin 'preservim/vim-indent-guides'
  Plugin 'preservim/vimux'
  " git
  Plugin 'airblade/vim-gitgutter' " vim with git status(added, modified, and removed lines)
  Plugin 'tpope/vim-fugitive' " vim with git command(e.g., Gdiff)
  " airline
  Plugin 'vim-airline/vim-airline'    " vim status bar
  Plugin 'vim-airline/vim-airline-themes'
  " auto
  Plugin 'AutoComplPop'                   " auto compl
  Plugin 'taglist-plus'
  " openai
  if has ('~/.config/openaiapirc')
    Plugin 'tom-doerr/vim_codex'
  endif
call vundle#end() "$ vim +PluginInstall +qall

"
" set
"

" set by global
syntax on " place color on syntax.
set hlsearch " highlight on search keyword.
set number " display line number.
set autoindent " auto indent when use enter or 'o'.
set nocompatible " no compatible with the original vi.
set modeline " If there is a mode line, it applies.
set title " Display the file currently being edited in the title bar.
set laststatus=2 " turn on bottom bar.
set showmatch " Show parentheses.
set smartindent " reacts to the syntax/style of the code i'm editing.
set ruler " display row, column of cursor.
set fileencodings=tuf8,euc-kr
set clipboard=unnamedplus " computer shares clipboard with vi.
set t_Co=256
set background=dark
colorscheme gruvbox
filetype plugin indent on

" set by file types
augroup filetypedetect
  au Filetype c set
    \ cindent
    \ tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
  au Filetype cpp set
    \ cindent
    \ tabstop=4
    \ softtabstop=4
  au Filetype python set
    \ tabstop=2
    \ softtabstop=2
    \ shiftwidth=2
    \ expandtab
  au filetype rust set
    \ tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ expandtab
  au filetype sh set
    \ tabstop=2
    \ softtabstop=2
    \ shiftwidth=2
    \ expandtab
  au filetype vim set
    \ tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ expandtab
augroup end

"
" About indent guides.
"

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 1
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 1

"
" About ctags & cscope
"

set csprg=/usr/bin/cscope
set csto=0
set cst
set csverb
" cs add cscope.out

" cscope Hot keys
" https://cdang.tistory.com/80
" 

nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>a :cs find a <C-R>=expand("<cword>")<CR><CR>

"
" ctrlp.vim setting
"

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|public$\|log$\|tmp$\|vendor$',
  \ 'file': '\v\.(exe|so|dll)$'
\ }

"
" Tag list setting
"

let Tlist_Use_Right_Window = 1
let Tlist_Auto_Open = 0
let Tlist_Exit_OnlyWindow = 0
let Tlist_Inc_Winwidth = 0
let Tlist_Ctags_Cmd = "/usr/bin/ctags"

"
" vim-airline setting
"

let g:airline#extensions#tabline#enabled = 1 " turn on buffer list
let g:airline_theme='hybrid'
let mapleader = ","

"
" hot key
"

map <F10> <C-w><C-v>
map <tab> <C-w><C-w>

nmap <F5> :NERDTreeToggle<cr>
nmap <F6> :TagbarToggle<cr>

nmap <F2> :bprevious<CR>
nmap <F3> :bnext<CR>
nmap <F4> :enew<cr>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>

nnoremap  <C-x> :CreateCompletion<CR>
inoremap  <C-x> <Esc>li<C-g>u<Esc>l:CreateCompletion<CR>
