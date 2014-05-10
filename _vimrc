" nz45s2

" Pathogen
runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()

syntax on
filetype plugin on

set nocompatible
set showmatch           " Show matching brackets.
set incsearch           " Incremental search
set mouse=a             " Enable mouse usage (all modes)
set ruler               " Disaply current location of curor
set hlsearch            " Highlight search
set ignorecase
set smarttab            " Smart tab
set fileformat=dos
set nowrap
set relativenumber
set number              " Show line number
set laststatus=0        " Always show statusline
set wildmenu
set smartcase

" Opening
au GUIEnter * simalt ~x

" Mapleader
let mapleader = ","

" Clipboard
" set clipboard+=unnamed

" disable backup and swap files
set nobackup
set noswapfile

" Colorscheme
set background=dark
colorscheme molokai
" set guifont=Inconsolata:h14:cANSI
set guifont=DejaVu\ Sans\ Mono:h11

" Backup
set nobackup

" Delphi C SWREF
set expandtab
set cindent
set tabstop=3
set softtabstop=3
set shiftwidth=3
set colorcolumn=80
set backspace=2

" Toggle Menu and Toolbar
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=b
set guioptions-=L
"noremap <silent> <F11> :if &guioptions =~# 'T' <Bar>
"        \set guioptions-=T <Bar>
"        \set guioptions-=m <bar>
"        \set guioptions-=r <bar>
"        \set guioptions-=b <bar>
"        \set guioptions-=L <bar>
"    \else <Bar>
"        \set guioptions+=T <Bar>
"        \set guioptions+=m <Bar>
"        \set guioptions+=r <bar>
"        \set guioptions+=b <bar>
"        \set guioptions+=L <bar>
"    \endif<CR>

" Keyboard customize

inoremap jk <Esc>

inoremap <expr> <C-d> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
inoremap <expr> <C-u> pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"
inoremap <expr> <C-f> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-f>"
inoremap <expr> <C-b> pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-b>"
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" nnoremap <F2> :%s/\s\+$//g<CR>
" nnoremap <F3> :%s/\t/   /g<CR>

" vnoremap <tab> >gv
" vnoremap <s-tab> <gv
" nmap <tab> v>
" nmap <s-tab> v<

" Close preview window automaticly
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Cursorline
set cursorline
hi cursorline guibg=NONE gui=underline

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Plugin                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" A
nnoremap <F12> :A<CR>

" Ag
nnoremap <leader>a :Ack!<space>
let g:ackprg = 'ag --smart-case --nogroup --nocolor --column'

" Ack
" let g:ackprg='perl "c:\Path\ack.pl" -H --nocolor --nogroup --column'

" Neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_max_menu_width = 70
nnoremap <C-\> :NeoComplCacheToggle<CR>

" Tagbar
set tags=tags;
let g:tagbar_left=1
nnoremap <F4> :TagbarToggle<CR>

" Nerdtree
let NERDTreeWinPos="right"
nnoremap <leader><F4> :NERDTreeToggle<CR>

" Cscope
nnoremap <F7> :cs kill -1<CR>
    \:!cscope -Rbqk<CR>
    \:cs add cscope.out<CR>
    \:cs reset<CR>

" Ctag
nnoremap <C-]> :tjump <C-R>=expand("<cword>")<CR><CR>

" Gitgutter
let g:gitgutter_realtime = 0
nnoremap <leader>j :GitGutterNextHunk<cr>
nnoremap <leader>k :GitGutterPrevHunk<cr>
highlight clear SignColumn
autocmd ColorScheme * highlight clear SignColumn

" Lookupfile
let g:LookupFile_MinPatLength = 2
let g:LookupFile_PreserveLastPattern = 0
let g:LookupFile_PreservePatternHistory = 0
let g:LookupFile_AlwaysAcceptFirst = 1
let g:LookupFile_AllowNewFiles = 0
let g:LookupFile_UsingSpecializedTags = 1
let g:LookupFile_Bufs_LikeBufCmd = 0
let g:LookupFile_ignorecase = 1
let g:LookupFile_smartcase = 1
if filereadable("./filenametag")
    let g:LookupFile_TagExpr = '"./filenametag"'
endif

" Lookup file with ignore case
function! LookupFile_IgnoreCaseFunc(pattern)
    let _tags = &tags
    try
        let &tags = eval(g:LookupFile_TagExpr)
        let newpattern = '\c' . a:pattern
        let tags = taglist(newpattern)
    catch
        echohl ErrorMsg | echo "Exception: " . v:exception | echohl NONE
        return ""
    finally
        let &tags = _tags
    endtry
    " Show the matches for what is typed so far.
    let files = map(tags, 'v:val["filename"]')
    return files
endfunction
let g:LookupFile_LookupFunc = 'LookupFile_IgnoreCaseFunc'

" UltiSnips
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"


" CtrlP

" Set this to 1 to set searching by filename (as opposed to full path) as the
" default: >
let g:ctrlp_by_filename = 1

" Set this to 1 to set regexp search as the default: >
let g:ctrlp_regexp = 1

" 1 - the parent directory of the current file.
" 2 - the nearest ancestor that contains one of these directories or files:
"     .git/ .hg/ .svn/ .bzr/ _darcs/
" 0 - don't manage working directory.
let g:ctrlp_working_path_mode = 0

" Set this to 1 to enable the lazy-update feature: only update the match window
" after typing been stopped for a certain amount of time: >
"
" If is 1, update after 250ms. If bigger than 1, the number will be used as the
" delar time in milliseconds.
let g:ctrlp_lazy_update = 0

" The maximum number of files to scan, set to 0 for no limit: >
let g:ctrlp_max_files = 0

" Set the maximum height of the match window: >
let g:ctrlp_max_height = 70

" In addition to |'wildignore'|, use this for files and directories you want only
" CtrlP to not show. Use regexp to specify the patterns: >
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$',
    \ 'file': '\.exe$\|\.so$\|\.dll$\|\.elf$\|\.o$\
               \|\.obj$\
               \|\.vsd$\|\.vsdx$\|\.doc$\|\.docx$\
               \|\.xls$\|\.xlsx$',
    \ 'link': '',
    \ }

" Set this to 0 to enable cross-session caching by not deleting the cache files
" upon exiting Vim: >
let g:ctrlp_clear_cache_on_exit = 0

inoremap <expr> <C-d> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
inoremap <expr> <C-u> pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"
inoremap <expr> <C-f> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-f>"
inoremap <expr> <C-b> pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-b>"
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" Statusline
set laststatus=2
" Fencview and fugitive
set statusline=[%n]
set statusline+=%<%f%y%h%m
set statusline+=[%{&fenc!=''?&fenc:&enc}:%{&ff}]
set statusline+=%h%m%r
set statusline+=%{fugitive#statusline()}
set statusline+=\%r%=[%b\ 0x%B]
set statusline+=\ %l\ of\ %L,%c%V
set statusline+=\ Page\ %N
set statusline+=\ %P

" Start of diff setting
" function! SetDiffEnviron()
"     set diff
"     set scrollbind
"     set scrollopt=ver,jump,hor
"     set nowrap
"     set fdm=diff
" endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Plugin                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remove trailing whitespace when writing a buffer, but not for diff files.
function RemoveTrailingWhitespace()
    if &ft != "diff"
        let b:curcol = col(".")
        let b:curline = line(".")
        silent! %s/\t/   /g
        silent! %s/\s\+$//
        silent! %s/\(\s*\n\)\+\%$//
        call cursor(b:curline, b:curcol)
    endif
endfunction
" autocmd BufWritePre * call RemoveTrailingWhitespace()
nnoremap <F2> :call RemoveTrailingWhitespace()<CR>
