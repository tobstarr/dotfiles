filetype plugin off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'kien/ctrlp.vim'
Plugin 'fatih/vim-go'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-abolish'
Plugin 'benmills/vimux'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'toyamarinyon/vim-swift'
Plugin 'honza/dockerfile.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'slim-template/vim-slim'
Plugin 'tpope/vim-rake'
Plugin 'elzr/vim-json'
Plugin 'jamessan/vim-gnupg'
Bundle 'mileszs/ack.vim'
Plugin 'bling/vim-airline'
Plugin 'morhetz/gruvbox'
Plugin 'thinca/vim-localrc'
Plugin 'mtth/scratch.vim'
call vundle#end()
filetype plugin indent on

" colorscheme gruvbox
" set background=dark

let g:vim_json_syntax_conceal = 0

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

hi CursorLine   cterm=NONE ctermbg=lightgrey ctermfg=black guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=lightgrey ctermfg=black guibg=darkred guifg=white

set t_Co=256

let g:syntastic_go_go_build_args = "-o /dev/null"

set relativenumber
set number " seems to work only in vim >= 7.4
set nolinebreak
set showmatch
set showcmd
set ruler
set incsearch
set backspace=indent,eol,start
set wildmenu
set wildignore+=tmp/*,*.o,*.obj,.git
set nocompatible
set nofoldenable
set dir=~/.vim.swp
let $BASH_ENV = "~/.bash_aliases"
set shell=/bin/bash\ -l
let g:ackprg = 'ag --nogroup --nocolor --column'
let g:ctrlp_custom_ignore = '\v[\/]Godeps\/_workspace'

autocmd BufNewFile,BufRead *.ego set ft=html
autocmd BufNewFile,BufRead *.go set ft=go
autocmd BufNewFile,BufRead *.json set ft=json nolist tabstop=2 shiftwidth=2 expandtab autoindent
autocmd BufNewFile,BufRead *.swift set ft=swift
autocmd BufNewFile,BufRead *.md set ft=markdown noexpandtab

autocmd FileType go nnoremap <buffer> gd :GoDef<cr>
autocmd FileType go nnoremap <buffer> K :GoDoc<cr>
autocmd FileType go nmap ,i <Plug>(go-info)
autocmd FileType go set makeprg=make
autocmd FileType go nmap ,e <Plug>(go-rename)
autocmd FileType go set tabstop=4 shiftwidth=4
autocmd FileType go map <C-]> gd
autocmd FileType go map ,rn :GoRename<CR>
autocmd FileType html set expandtab
autocmd FileType ruby set expandtab
autocmd FileType ruby set shiftwidth=2
autocmd FileType ruby set tabstop=2
autocmd FileType ruby map ,. :w<CR>:!make -f Makefile.wip<CR>
autocmd FileType make set noexpandtab nolist shiftwidth=4 tabstop=4 softtabstop=4 

" expand to current directory
cnoremap %% <C-R>=expand('%:h').'/'<CR>

map tt :TagbarToggle<CR>

filetype plugin on
set ignorecase
set smartcase
set hidden

set laststatus=2

set tw=0
syntax on
set history=10000
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smartindent
set grepprg=ack
let g:ackprg = 'ag --nogroup --nocolor --column'
set vb 

set backupdir=/tmp

set gfn=Monaco:h16

map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

scriptencoding utf-8
set encoding=utf-8

map ,. :w<CR>:make -f Makefile.wip<CR>
map ,c :set relativenumber!<CR>:set number!<CR>
map ,ff :CtrlPClearCache<CR>
map ,nt :NERDTreeToggle<CR>
map ,p :set paste!<CR>
map ,q :q<CR>
map ,t :CtrlP .<CR>
map ,w :w<CR>
map ,x :x<CR>
map ,v :VimuxPromptCommand<CR>
map ,, :VimuxRunLastCommand<CR>
map ,/ :VimuxRunLastCommand<CR>


command! -nargs=* Make make <args> | cwindow 3

autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

let g:godef_split=0
let g:go_fmt_command='goimports'
let g:go_autodetect_gopath = 0

set spell spelllang=en_us

map ,s :setlocal spell!<CR>

command! -range AddJsonTags <line1>,<line2>normal ^vEyA `json:""crsA,omitempty"`^j
command! -range AddXmlTags <line1>,<line2>normal ^vEyA `xml:""guawA,attr"`^j
command! -range JsonToStruct <line1>,<line2>normal ^wvi"yI" string `json:f:s` //^crmj^
command! -range StructToMap <line1>,<line2>normal vEyI"": m.Ea, CI"lcrsj^
command! -range XmlToStruct <line1>,<line2>normal ^xvt>yI" string `xml:"f>s"` //^crmj
command! -range InlineErr <line1>,<line2>normal ^wi:Iif A; err != nil {jdd
