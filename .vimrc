

call pathogen#infect()

set ic
set tabstop=4
set shiftwidth=4
set number

"turn off the noise
set noerrorbells
set vb t_vb=
set mouse=ncrv

syntax on
filetype plugin indent on
au BufRead,BufNewFile *.pde set filetype=cpp
au BufRead,BufNewFile *.ino set filetype=cpp

":let g:pyclewn_args = "--pgm=/opt/gcc-arm-none-eabi-4_7-2012q4/bin/arm-none-eabi-gdb"
":let g:pyclewn_connection = "localhost:2331"

:set <S-F1>=[23~
:set <S-F2>=[24~
:set <S-F3>=[25~
:set <S-F4>=[26~
:set <S-F5>=[28~
:set <S-F6>=[29~
:set <S-F7>=[31~
:set <S-F8>=[32~
:set <S-F9>=[33~
:set <S-F10>=[34~

nnoremap <F1> :Cmapkeys<cr>
nnoremap <F2> :Crun<cr>
nnoremap <F5> :Cnext<cr>
nnoremap <F6> :Cstep<cr>
nnoremap <F7> :call PyclewnF7()<cr>
nnoremap <F9> :call PyclewnF9()<cr>
vnoremap <F10> :call PyclewnF10()<cr>

nnoremap <S-F3> :Ckill<cr>
nnoremap <S-F7> :Cup<cr>
nnoremap <S-F8> :Cdown<cr>
nnoremap <S-F9> :call PyclewnSF9()<cr>
vnoremap <S-F10> :call PyclewnSF10()<cr>

"Nerdtree setup
let g:nerdtree_tabs_open_on_console_startup=1
let g:nerdtree_tabs_autoclose=1
let g:NERDTreeIgnore=['\.o$', '\~$']

"For using ctags
:nmap ,t :!(cd %:p:h;ctags *)&
:set tags=./tags,./../tags,./../../tags,./../../../tags,tags

"For using cscope_quickfix
let Cscope_JumpError = 0
set cscopetag

set t_Co=256

"color skittles_dark
"color wombat
"color molokai
"color wombat
color geo

:command -nargs=* Make make <args> <cr> <cr> | cwindow 15
:command -nargs=* A Ack <args> 

nnoremap <leader>q :call QuickfixToggle()<cr>
nnoremap <leader>m :call DoMake()<cr><cr>
nnoremap <leader>d :call DoMakeDebug()<cr><cr>
nnoremap <leader>u :call DoMakeUpload()<cr><cr>
nnoremap <leader>n :cn<cr>
nnoremap <leader>p :cp<cr>
nnoremap <leader>f :call ShowFuncName() <CR>


let g:quickfix_is_open = 0

function! QuickfixToggle()
	if g:quickfix_is_open
		cclose
		let g:quickfix_is_open = 0
	else
		copen 15
		let g:quickfix_is_open = 1
	endif
endfunction

nnoremap <leader>g :call SearchWordUnderCurson()<cr>
function! SearchWordUnderCurson()
		let g:ackArgs = "-w " . expand("<cword>")
		call Ack(g:ackArgs)
		let g:quickfix_is_open = 1
endfunction

function! DoMake()
		make
		belowright copen
		let g:quickfix_is_open = 1
endfunction

function! DoMakeDebug()
		make DEBUG=1
		belowright copen
		let g:quickfix_is_open = 1
endfunction

function! DoMakeUpload()
		make upload
		belowright copen
		let g:quickfix_is_open = 1
endfunction

fun! ShowFuncName()
	let lnum = line(".")
	let col = col(".")
	echohl ModeMsg
	echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
	echohl None
	call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfun

"pyclewn stuff

fun! PyclewnF7()
	execute "Cuntil " . line(".")
endfunction

fun! PyclewnF9()
	execute "Cprint " . expand("<cword>")
endfunction

fun! PyclewnF10()
	normal gv"xy
	execute "Cprint " . @x
endfunction

fun! PyclewnSF9()
	execute "Cprint *" . expand("<cword>")
endfunction

fun! PyclewnSF10()
	normal gv"xy
	execute "Cprint *" . @x
endfunction

