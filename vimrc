" pathogen
call pathogen#infect()
call pathogen#helptags()
set ic
set cc=80
" file type
filetype on
"filetype plugin indent on

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes) in terminals

" personal
set nu
set hlsearch
syntax on
set tags=tags
set mouse=nv
set background=dark

" list characters
set listchars=tab:._,trail:!
set list

" hotkeys
nmap <F8> :TrinityToggleAll<CR>
nmap <F9> :TrinityToggleSourceExplorer<CR>
nmap <F10> :TrinityToggleTagList<CR>
nmap <F11> :TrinityToggleNERDTree<CR>

" Cscope configuration
if has("cscope")
set csprg=/usr/bin/cscope
set csto=0
set cst
set nocsverb
" add any database in current directory
if filereadable("cscope.out")
cs add cscope.out
" else add database pointed to by environment
elseif $CSCOPE_DB != ""
cs add $CSCOPE_DB
endif
set csverb
set cscopetag
set cscopequickfix=s-,g-,c-,d-,t-,e-,f-,i-
endif

" showmarks
let g:showmarks_include='abcdefghijklmnopqrstuvwxyz' . 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
let g:showmarks_ignore_type=""
let g:showmarks_textlower="\t"
let g:showmarks_textupper="\t"
let g:showmarks_textother="\t"
let g:showmarks_auto_toggle = 0
nnoremap <silent> mo :ShowMarksOn<CR>
nnoremap <silent> mt :ShowMarksToggle<CR>

" wokmarks
let g:wokmarks_do_maps = 0
let g:wokmarks_pool = "abcdefghijklmnopqrstuvwxyz"
map mm <Plug>ToggleMarkWok
map mj <Plug>NextMarkWok
map mk <Plug>PrevMarkWok
map <M-Left>  <Plug>SetMarkWok
map <M-Right> <Plug>ToggleMarkWok
map <M-Up>    <Plug>PrevMarkWok
map <M-Down>  <Plug>NextMarkWok
autocmd User WokmarksChange :ShowMarksOn

" handling filetypes
au FileType python set expandtab shiftwidth=4 softtabstop=4
au FileType c set shiftwidth=8 softtabstop=8
au FileType cpp set shiftwidth=8 softtabstop=8
