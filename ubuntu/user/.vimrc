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
set fileencodings=utf-8 " origin: tuf8,euc-kr
set clipboard=unnamedplus " computer shares clipboard with vi.
set t_Co=256
set background=dark
colorscheme gruvbox
filetype plugin indent on

" set by file types
augroup filetypedetect
  au Filetype c,cpp set
    \ cindent
    \ tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
  au Filetype python,sh set
    \ tabstop=2
    \ softtabstop=2
    \ shiftwidth=2
    \ expandtab
  au Filetype rust,vim set
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

" ~/kernel/*/tags,~/u-boot/*/tags;
set tags=./tags;
if has("cscope")
  set csprg=/usr/bin/cscope
  set cst
  set csverb
  set csto=1
  set cspc=3
  "add any database in current dir
  if filereadable("cscope.out")
    cs add cscope.out
  "else search cscope.out elsewhere
  else
    let cscope_file=findfile("cscope.out", ".;")
    let cscope_pre=matchstr(cscope_file, ".*/")
    "echo cscope_file
    if !empty(cscope_file) && filereadable(cscope_file)
      exe "cs add" cscope_file cscope_pre
    endif
  endif
endif

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
" hot key - only normal mode
"

" open header
nnoremap t <C-w>gf
" <F2> ~ <F12>
nnoremap <F2> :bprevious<CR>
nnoremap <F3> :bnext<CR>
nnoremap <F4> :enew<cr>
nnoremap <F5> :NERDTreeToggle<cr>
nnoremap <F6> :TagbarToggle<cr>
nnoremap <F10> <C-w><C-v>
"Jump between objects added by plug-in
nnoremap <tab> <C-w><C-w>
nnoremap <Space> :bnext<CR>

nnoremap <leader>bq :bp <BAR> bd #<CR>
nnoremap <leader>bl :ls<CR>
