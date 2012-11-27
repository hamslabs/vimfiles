
call pathogen#infect()

set ic
set tabstop=4
set shiftwidth=4
set number

syntax on
filetype plugin indent on

"Nerdtree setup
let g:nerdtree_tabs_open_on_console_startup=1
let g:nerdtree_tabs_autoclose=1
let g:NERDTreeIgnore=['\.o$', '\~$']

"For using ctags
:nmap ,t :!(cd %:p:h;ctags *)&
:set tags=./tags,./../tags,./../../tags,./../../../tags,tags

set t_Co=256

"color skittles_dark
"color wombat
"color molokai
"color wombat
color geo

:command -nargs=* Make make <args> <cr> <cr> | cwindow 15
:command -nargs=* A Ack <args> 

set mouse=a

nnoremap <leader>q :call QuickfixToggle()<cr>
nnoremap <leader>m :call DoMake()<cr><cr>

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




