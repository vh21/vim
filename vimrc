"
" pathogen
"
call pathogen#infect()
call pathogen#helptags()

" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
" runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
"    \| exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

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

" Source a global configuration file if available
" XXX Deprecated, please move your changes here in /etc/vim/vimrc
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

"
" personal
"
set nu
set hlsearch
syntax on



" Open and close all the three plugins on the same time
nmap <F8> :TrinityToggleAll<CR>

" Open and close the srcexpl.vim separately
nmap <F9> :TrinityToggleSourceExplorer<CR>

" Open and close the taglist.vim separately
nmap <F10> :TrinityToggleTagList<CR>

" Open and close the NERD_tree.vim separately
nmap <F11> :TrinityToggleNERDTree<CR>

set tags=tags;
set mouse=nv

"
" Cscope configuration
"
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

"
" showmarks
"
let g:showmarks_include='abcdefghijklmnopqrstuvwxyz' . 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
let g:showmarks_ignore_type=""
let g:showmarks_textlower="\t"
let g:showmarks_textupper="\t"
let g:showmarks_textother="\t"
let g:showmarks_auto_toggle = 0
nnoremap <silent> mo :ShowMarksOn<CR>
nnoremap <silent> mt :ShowMarksToggle<CR>

"
" wokmarks
"
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

