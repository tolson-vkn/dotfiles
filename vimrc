" Don't use arrows
" rscheme gruvbox:
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" really, just don't
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>

inoremap jk <Esc>

syntax on

set autoindent
set ruler
" set cmdheight=2
set number relativenumber

inoremap jk <Esc>

" g maps!
map gc "+y
map gp "+gP
" with gvim installed:
" Cut - "+x
" Copy - "+y
" Paste - "+gP
" Put before - [p
" Put after - ]p

"
" Relative or absolute number lines
function! NumberToggle()
    if(&rnu == 1)
        set nu
        set nornu
    else
        set nonu
        set nu
        set rnu
    endif
endfunction

map gn :call NumberToggle()<CR>
map gN :set nornu nonu<CR>

" Pretty characters - this is a little noisy at times...
set list
"set listchars=eol:⏎,tab:␉·,trail:␠,nbsp:⎵
"set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set listchars=eol:¬,trail:·,tab:>-,trail:~,extends:>,precedes:<

set backspace=indent,eol,start

" Show all space characters
" set lcs+=space:·

" Ingore case on search
set ignorecase
" but don't _ignore_ case
set smartcase

" Shut up
set noerrorbells
set novisualbell
set t_vb=
set noeb vb t_vb=
set tm=500

" File type
set ffs=unix,mac,dos

" No backups - yolo - ya'll got RAM?
set nobackup
set nowb
set noswapfile

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Tabs vs space lives on
" https://github.com/jhawthorn/dotfiles/
if has("autocmd")
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType eruby setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType sass setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType scss setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType haml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType coffee setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType elixir setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType lua setlocal ts=2 sts=2 sw=2 expandtab

  autocmd User Rails let  g:fuzzy_roots = [rails#app().path()]
  au BufRead,BufNewFile {*.txt}                              set ft=txt
  au BufRead,BufNewFile {*.yml,*.yaml,*.kubeconfig}          set ft=yaml
  au BufRead,BufNewFile {*.rake,*.ruby,config.ru}            set ft=ruby
  au BufRead,BufNewFile {Gemfile,Rakefile,Capfile,Guardfile} set ft=ruby
  au BufRead,BufNewFile {*.rss,*.atom}                       set ft=xml
  au BufRead,BufNewFile *.json                               set ft=json
  au BufRead,BufNewFile {*.md,*.mkd,*.markdown}              set ft=markdown
  au BufRead,BufNewFile {COMMIT_EDITMSG}                     set ft=gitcommit
  au BufRead,BufNewFile *mutt-*                              set ft=mail formatoptions=aw
  au BufRead,BufNewFile svn-commit.*                         set ft=svn
  au BufRead,BufNewFile {*.vala,*.vapi}                      set ft=vala
  au BufRead,BufNewFile pos.*.*                              set ft=basic
  au BufRead,BufNewFile *.mirah                              set ft=mirah
  au BufRead,BufNewFile *.rl                                 set ft=ragel cindent

  au BufRead,BufNewFile *.vala set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
  au BufRead,BufNewFile *.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m

  au BufRead,BufNewFile *_spec.rb compiler rspec
endif


"------ Plugs     ------

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'fatih/vim-go'
Plug 'valloric/youcompleteme'
Plug 'leafgarland/typescript-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'morhetz/gruvbox'
"Plug 'inkarkat/vim-spellcheck'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

"------ End Plugs ------

colorscheme gruvbox
set background=dark

" NERTTree config
let NERDTreeShowHidden=1
map <silent> <C-n> :NERDTreeToggle<CR>

" close NERDTree after a file is opened
let g:NERDTreeQuitOnOpen=1

" YCM config
let g:ycm_enable_diagnostic_signs=0
