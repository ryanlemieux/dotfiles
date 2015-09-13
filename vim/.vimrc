"---------------
"fortress's vim
"---------------

set nocompatible "THIS MUST BE FIRST
execute pathogen#infect()
syntax on
filetype plugin indent on

set background=dark
colorscheme jellybeans

"===========SETTINGS===============
" operational settings
set ttyfast 
set ruler "show the line number on the status bar
set autoread "watch for file changes
set number "line numbers
set mousehide "hide mouse when typing
set showmode "show the mode all the time
set showcmd 
set smarttab "tab and backspace are smart
set backspace=indent,eol,start
set showmatch "Show matching brackets/parenthesis
set spelllang=en_us 
set wildmenu "list instead of just completing
set wildmode=list:longest,full " 

"turn on mouse
set mouse=v

"indents
"set tabstop=4
"set shiftwidth=4 "use indents of 4 spaces
"set expandtab "tab are spaces not tabs
set autoindent "indent at same

"searching
set hlsearch "highlight search terms
set incsearch "find as you type 
set ignorecase
set smartcase

"wrapping
set nowrap "don't wrap lines
set textwidth=0
set wrapmargin=0
set linebreak

"statusbar info and appearance
set statusline=\ \%f%m%r%h%w\ ::\ %y\ [%{&ff}]\%=\ [%p%%:\ %l/%L]
set laststatus=2
set cmdheight=1

"crosshairs
set cursorline
set cursorcolumn

"show dangling whitespace
match SpellBad /\s\+$/ " highlight dangling whitespace

if has("autocmd")

    " always jump to the last cursor position
    autocmd BufReadPost * if line("'\"")>0 && line("'\"")<=line("$")|exe "normal g`\""|endif

    " limit cols to 80 to the following
    autocmd BufRead *.txt set tw=80 " limit width to n cols for txt files
    autocmd BufRead ~/.mutt/temp/mutt-* set tw=79 ft=mail nolist nocindent spell " width, mail syntax hilight, spellcheck
    autocmd FileType tex set tw=80 nolist spell nocindent

endif

"===========FUNCTIONS==============
" Map keys to toggle functions
function! MapToggle(key, opt)
    let cmd = ':set '.a:opt.'! \| set '.a:opt."?\<CR>"
    exec 'nnoremap '.a:key.' '.cmd
    exec 'inoremap '.a:key." \<C-O>".cmd
endfunction
command! -nargs=+ MapToggle call MapToggle(<f-args>)


"===========MAPPINGS===============
map <F5> :set nu!
MapToggle <F6> spell
MapToggle <F7> paste
map <F8> :set list!
map <F9> :%s/\t/    /g
map <F10> :set cursorline! cursorcolumn!

"space bar un-highlights search
:noremap <silent> <Space> :silent noh<Bar>echo<CR>

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

"========PLUGIN SPECIFIC========
let maplocalleader=',' 
let mapleader=','

" NERDtree
"let NERDTreeWinSize=20
nmap <LocalLeader>n :NERDTreeToggle<cr>

"tagbar
nmap <LocalLeader>tb :TagbarToggle<cr>

"git support (fugitive)
nmap <LocalLeader>gb :Gblame<cr>
nmap <LocalLeader>gs :Gstatus<cr>
nmap <LocalLeader>gd :Gdiff<cr>
nmap <LocalLeader>gl :Glog<cr>
nmap <LocalLeader>gc :Gcommit<cr>
nmap <LocalLeader>gp :Git push<cr>

"pydiction
let g:pydiction_location = '$HOME/.vim/bundle/pydiction/complete-dict'

"super omni
let g:SuperTabDefaultCompletionType = "context"

