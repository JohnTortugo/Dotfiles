"----------------------------------------------
"NeoBundle Scripts-----------------------------
		if has('vim_starting')
			if &compatible
				set nocompatible               " Be iMproved
			endif

			" Required:
			set runtimepath+=/home/divcesar/.vim/bundle/neobundle.vim/
		endif

		" Required:
		call neobundle#begin(expand('~/.vim/bundle'))

		" Let NeoBundle manage NeoBundle
		" Required:
		NeoBundleFetch 'Shougo/neobundle.vim'

		" Add or remove your Bundles here:
		NeoBundle 'Shougo/neosnippet.vim'
		NeoBundle 'Shougo/neosnippet-snippets'
		NeoBundle 'tpope/vim-fugitive'
		NeoBundle 'ctrlpvim/ctrlp.vim'
		NeoBundle 'flazz/vim-colorschemes'
		NeoBundle 'tpope/vim-sensible'
		NeoBundle 'bling/vim-airline'
		NeoBundle 'kien/ctrlp.vim'
		NeoBundle 'scrooloose/nerdtree'
		NeoBundle 'Xuyuanp/nerdtree-git-plugin'
		NeoBundle 'majutsushi/tagbar'
		NeoBundle 'scrooloose/syntastic'
        NeoBundle 'MarcWeber/vim-addon-mw-utils'
        NeoBundle 'tomtom/tlib_vim'
		NeoBundle 'honza/vim-snippets.git'
		NeoBundle 'garbas/vim-snipmate'
		NeoBundle 'tpope/vim-fugitive'
		NeoBundle 'terryma/vim-multiple-cursors'

		" Did not like these:
		"NeoBundle 'ervandew/supertab'
		"NeoBundle 'Valloric/YouCompleteMe'
		"NeoBundle 'rdnetto/YCM-Generator'
		
		" I use these but without NeoBundle support
		" 	A.vim
		" 	Bclose.vim
		" 	Clang Complete
		" 	Nerd Commenter

		" You can specify revision/branch/tag.
		NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

		" Required:
		call neobundle#end()

		" Required:
		filetype plugin indent on

		" If there are uninstalled bundles found on startup,
		" this will conveniently prompt you to install them.
		NeoBundleCheck
"End NeoBundle Scripts-------------------------
"----------------------------------------------



"----------------------------------------------
"Airline configuration ------------------------

	" set the symbol dictionary as the one of powerline
	let g:airline_powerline_fonts = 1

	" powerline symbols
	if !exists('g:airline_symbols')
		let g:airline_symbols = {}
	endif

	let g:airline_left_sep = ''
	let g:airline_left_alt_sep = ''
	let g:airline_right_sep = ''
	let g:airline_right_alt_sep = ''
	let g:airline_symbols.branch = ''
	let g:airline_symbols.readonly = ''
	let g:airline_symbols.linenr = ''
		

	" Enable the list of buffers
	let g:airline#extensions#tabline#enabled = 1

	" Show just the filename
	let g:airline#extensions#tabline#fnamemod = ':t'



"End Airline configuration --------------------
"----------------------------------------------



" ---------------------------------------------
" CtrlP configuration -------------------------
	" The search now will consider only file names
	let g:ctrlp_by_filename = 1

	" When a file with the given name is found the folder is considered
	" the root folder
	" let g:ctrlp_root_markers = ['']

	let g:ctrlp_buffer_func = { 'enter': 'BrightHighlightOn', 'exit':  'BrightHighlightOff', }

	function BrightHighlightOn()
		hi CursorLine ctermbg=gray ctermfg=black
	endfunction

	function BrightHighlightOff()
		hi CursorLine ctermbg=black ctermfg=gray
	endfunction

" End CtrlP configuration ---------------------
" ---------------------------------------------




" ---------------------------------------------
" Begin NERDTree configuration -------------------------
" This plugin is useful for navigating in the directory/file system hierarchy.
" Useful mappings are:
" 	<F8>	Toggle visibility
" 	<C-m>	Toggle the folding of the current folder

	" Close vim if the only window left is the NERDTree
	" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

	" Tells nerdtree to not display .o files
	let NERDTreeIgnore=['\.o$', '\.png', '\.pdf']

	" Open a NERDTree automatically when vim starts up if no files were specified
	autocmd StdinReadPre * let s:std_in=1
	autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

	" set g:NERDTreeHighlightCursorline=1

" End NERDTree configuration ---------------------
" ---------------------------------------------



" ---------------------------------------------
" Begin Tagbar configuration -------------------------
" This plugin is useful for showing the Ctags of the current file.
" 	<F8>	Toggle visibility

	let g:tagbar_left=1


" End Tagbar configuration ---------------------
" ---------------------------------------------



" ---------------------------------------------
" Syntastic configuration -------------------------

	let g:syntastic_cpp_compiler_options = ' -std=c++11'

	set statusline+=%#warningmsg#
	set statusline+=%{SyntasticStatuslineFlag()}
	set statusline+=%*

	let g:syntastic_always_populate_loc_list = 1
	let g:syntastic_auto_loc_list = 1
	let g:syntastic_check_on_open = 0
	let g:syntastic_check_on_wq = 1
	let g:syntastic_error_symbol = "✗"
	let g:syntastic_warning_symbol = "⚠"

	" This makes the left gutter always visible
	autocmd BufEnter * sign define dummy
	autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')
	highlight SignColumn ctermfg=2 ctermbg=NONE

	" Set the fg/bg color of warning/error lines
	highlight YcmErrorSign ctermfg=2 ctermbg=NONE
	highlight YcmWarningSign ctermfg=2 ctermbg=NONE


" End Syntastic configuration ---------------------
" ---------------------------------------------









" ---------------------------------------------
" Clang-complete configuration -------------------------

	let g:clang_user_options='|| exit 0'
	let g:clang_library_path = '/usr/lib/llvm-3.5/lib/'
	let g:clang_use_library=1
	let g:clang_sort_algo = 'alpha'
	let g:clang_memory_percent=70
	let g:clang_jumpto_declaration_key='<F4>'
	
	" Open quick-fix on error
	let g:clang_complete_copen=1

	" If it should complete code patterns like for and ifs
	let g:clang_complete_patterns=0

	" Set this to 0 if you don't want autoselect, 1 if you want autohighlight,
	" and 2 if you want autoselect. 0 will make you arrow down to select the first
	" option, 1 will select the first option for you, but won't insert it unless you
	" press enter. 2 will automatically insert what it thinks is right. 1 is the most
	" convenient IMO, and it defaults to 0.
	let g:clang_auto_select=1

	" this has something to do with characters that are invisible
	set conceallevel=2
	set concealcursor=vin

	" Set the clang_complete engine of snippets, may we someday I change to
	" ultisnips
	let g:clang_snippets=1
	let g:clang_conceal_snippets=1
	let g:clang_snippets_engine='clang_complete'

	" Tells that ccomp should understand macros
	let g:clang_complete_macros = 1

	" If you prefer the Omni-Completion tip window to close when a selection is
	" made, these lines close it on movement in insert mode or when leaving
	" insert mode
	autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
	autocmd InsertLeave * if pumvisible() == 0|pclose|endif

	highlight Pmenu ctermfg=white ctermbg=darkgray
	highlight PmenuSel ctermfg=darkgray  ctermbg=white

" End Clang-complete configuration ---------------------
" ---------------------------------------------



" ----------------------------------------------------------------------------
" Multiple-cursors configs ---------------------------------------------------
" This plugin is interesting because it enable us to make changes
" in several places at the same time. Useful for refactoring.

	" Disable default mappings
	let g:multi_cursor_use_default_mapping=0

	" When we press this we enter in multi cursor mode or goes to next match
	let g:multi_cursor_next_key='<C-c>'

	" Go to prev match
	let g:multi_cursor_prev_key='<C-z>'

	" Ignore this match
	let g:multi_cursor_skip_key='<C-x>'

	" Exit multicursor match
	let g:multi_cursor_quit_key='<Esc>'

	highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
	highlight link multiple_cursors_visual Visual

" End multiple-cursors configuration ---------------------
" ---------------------------------------------





" ---------------------------------------------
" General configs -----------------------------
	colorscheme molokai

	set gfn=Inconsolata\ for\ Powerline\ Medium\ 8


	" Set the leader key
	let mapleader = '\\'

	" configure folding behavior
	" set foldmethod=syntax
	" set foldcolumn=3     

	" Enable the use of the mouse
	set mouse=a

	" Shows the line number
	set number

	" Enable syntax highlight

	" Let we change the buffer of the current window without saving it
	set hidden

	" Disable search highlight when we enter insert mode
	autocmd InsertEnter * :setlocal nohlsearch
	autocmd InsertLeave * :setlocal hlsearch

	set encoding=utf-8
	set fillchars+=stl:\ ,stlnc:\
	set number
	set nocompatible
	set nobackup
	set ruler
	set showcmd
	set incsearch
	set hlsearch
	set smartcase
	set autoindent
	set showmatch
	set cursorline
	set history=50
	set tabstop=4				" tab width is 4 spaces
	set shiftwidth=4			" identation is also 2 spaces
	set backspace=indent,eol,start		" allow backspacing over everything
	set whichwrap+=<,>,h,l,[,]			" let the cursor jump to the previous/next line when moving
	"set relativenumber

	" required to always show the status bar of 'powerline'
	set laststatus=2

	" syntax highlight
	syntax on								

	" enable plugins (seem be the default but...)
	filetype plugin on					

	" Automatically reload .vimrc when it's saved
	" au BufWritePost .vimrc so ~/.vimrc

	" This enable using a GUI colorscheme in a terminal window
"	set t_Co=256
"	let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
"	colorscheme molokai


	" Jump to the last position when reopening a file
	if has("autocmd")
	   au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
		\| exe "normal! g'\"" | endif
	endif

	" Configuring spell checker
	hi clear SpellBad
	hi SpellBad term=reverse cterm=underline,bold

	" Directory for storing undohistory
	set undofile
	set undoreload=10000
	set undolevels=1000
	set undodir=/home/divcesar/.vim/undo








	" -------------------------------------
	" -------------------------------------
	" Key mappings and remappings
	
	" Remap page up/down to navigate between buffers
	map <A-h> :bp<CR>
	map <A-l> :bn<CR>
	map <A-w> <Plug>Kwbd<CR>

	" This enable easy moving between windows
	nnoremap <C-h> <C-w>h
	nnoremap <C-j> <C-w>j
	nnoremap <C-k> <C-w>k
	nnoremap <C-l> <C-w>l

	" Enable text search with Ctrl-f
	nmap <C-f> /
	imap <C-f> <Esc>/

	" Switch between header and source files
	imap <C-Tab> <Esc>:A<CR>a
	map <C-Tab> :A<CR>

	" Toggle commentaries
	map <C-S-c> <plug>NERDCommenterInvert<CR>

	" Toggle between the window of NERDtree (showing files) and that of
	" Tagbar (Exuberang CTags)
	nmap <F8> :call SwitchLeftPannel()<CR>

	" Execute the project
	nmap <F9> :wa <BAR> !make run<CR>

	" Rebuild and execute
	nmap <F10> :wa <BAR> !make rebuild-run<CR>

	" Save the source
	nmap <silent> <C-S> :update<CR>
	imap <silent> <C-S> <Esc>:update<CR>a




" End General configs -------------------------
" ---------------------------------------------




" ---------------------------------------------
" Begin my custom funcs -------------------------

function SwitchLeftPannel()
 	if exists("g:isNerdTreeVisible") == 0
 		let g:isNerdTreeVisible = 0
 	endif
 
	if g:isNerdTreeVisible == 1 
		NERDTreeClose
		TagbarOpen
		wincmd h
	else
		TagbarClose
		NERDTree
	endif

	let g:isNerdTreeVisible = ! g:isNerdTreeVisible
endfunction


" End my custom funcs -------------------------
" ---------------------------------------------



