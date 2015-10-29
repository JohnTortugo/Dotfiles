"----------------------------------------------
" Summary of key mappings and notes -----------
"
" Notes:
" 	Update the NeoBundle path
" 	Update the Clang-Complete path
" 	Update the Fortune/Cowsay path
" 	Update the Language tool path
" 	I use the Universal Exuberant CTags
" 		https://github.com/universal-ctags/ctags/
"
" General Mappings:
" <leader>ev	-> Edit .vimrc
" <leader>sv	-> Source .vimrc
" <leader>ih	-> Switches to file under cursor
" <leader>lo	-> Open location list
" <leader>lq	-> Close location list
" <leader>f		-> Start search
"
" m.			-> Remove existing or place the next available local mark
" 
" C-S-c 		-> Toggle comment of the selected lines
" C-s			-> Save the current file
" C-A-f 		-> Format the current paragraph with 80 columns
" C-Tab			-> switch between .c/.h or .cpp/.h
" A-p			-> Open CtrlP file search
" C-p			-> find files using CtrlP
" A-p       	-> find buffer by name using CtrlP
" C-m			-> Toggle the folding of the current folder
" C-f			-> [Insert] Start search in current buffer
" 
" C-h			-> Move to the right window 
" C-j			-> Move to the window below
" C-k			-> Move to the window above
" C-l			-> Move to the left window 
"
" A-h			-> Move to the left tab
" C-PageUp		-> Move to the left tab
" A-l			-> Move to the right tab
" C-PageDown	-> Move to the right tab
" A-w			-> Close the current tab
"
" F1			->
" F2			-> Enable the spell and english grammar checker 
" F3			-> Goto prev spelling error
" F4			-> GoTo next spelling error
" F5			->
" F6			-> Use YCM GoTo Definition/Declaration
" F7			-> Display the current buffer's markers
" F8			-> Toggle NerdTree/Taglist visibility
" F9			-> Execute make run
" F10			-> Execute make rebuild-run
" F11			->
" F12			->
" 
" Multicursor:
" C-c			-> Enter in multi cursor mode or goes to next match
" C-z 	 		-> Go to prev match
" C-x	 		-> Ignore this match



"----------------------------------------------
" End of summary mappings ---------------------





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
		NeoBundle 'mhinz/vim-startify'
		NeoBundle 'kshenoy/vim-signature'
		NeoBundle 'Raimondi/delimitMate'
		NeoBundle 'vim-scripts/a.vim'
		NeoBundle 'rbgrouleff/bclose.vim'
		NeoBundle 'Valloric/YouCompleteMe'
		NeoBundle 'rdnetto/YCM-Generator'
		NeoBundle 'craigemery/vim-autotag'
		NeoBundle 'NLKNguyen/papercolor-theme'

		"NeoBundle 'Townk/vim-autoclose'
		"NeoBundle 'languagetool-org/languagetool'

		" Did not like these:
		" Clang-Complete					" crash sometimes and is slow
		" NeoBundle 'jiangmiao/auto-pairs' 	" have an UD behavior in somecases
		" NeoBundle 'ervandew/supertab'
		
		" I use these but without NeoBundle support
		" 	Nerd Commenter
		" 	LanguageTool (the tool + vim plugin)

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
	

	let g:ctrlp_extensions = ['buffertag', 'quickfix', 'dir', 'rtscript', 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']

	let g:ctrlp_buffer_func = { 'enter': 'BrightHighlightOn', 'exit':  'BrightHighlightOff', }

	let g:ctrlp_buftag_types = {
		\ 'erlang'     : '--language-force=erlang --erlang-types=drmf',
		\ 'c++'			: '-R --c++-kinds=+p --fields=+iaS --extra=+q',
		\ 'javascript' : {
		\ 'bin': 'jsctags',
		\ 'args': '-f -',
		\ },
		\ }

" End CtrlP configuration ---------------------
" ---------------------------------------------




" ---------------------------------------------
" Begin NERDTree configuration -------------------------
" This plugin is useful for navigating in the directory/file system hierarchy.
" Useful mappings are:
" 	<F8>	Toggle visibility
" 	<C-m>	Toggle the folding of the current folder

	" Close vim if the only window left is the NERDTree
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

	" Tells nerdtree to not display binary files
	let NERDTreeIgnore=['\.o$', '\.png', '\.pdf']

	" Open a NERDTree automatically when vim starts up if no files were specified
	" autocmd StdinReadPre * let s:std_in=1
	" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

	let NERDTreeHighlightCursorline=1
	
	" Disables display of the 'Bookmarks' label and 'Press ? for help' text
	let NERDTreeMinimalUI=1

	" Automatically open subdir if parent has only one child dir
	let NERDTreeCascadeOpenSingleChildDir=1

	" size of the NERD tree
	let NERDTreeWinSize=31

" End NERDTree configuration ---------------------
" ---------------------------------------------



" ---------------------------------------------
" Begin Tagbar configuration -------------------------
" This plugin is useful for showing the Ctags of the current file.
" 	<F8>	Toggle visibility

	let g:tagbar_left=1

	" Width of the Tagbar window in characters.
	let g:tagbar_width=31

	" move to the Tagbar window when it is opened.
	let g:tagbar_autofocus = 1

	" does not show the help message at the top
	let g:tagbar_compact = 1

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
	autocmd BufWinEnter * if &buftype == 'nofile' | sign define dummy | endif
	autocmd BufWinEnter * if &buftype == 'nofile' | execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('') | endif
	highlight SignColumn ctermfg=2 ctermbg=NONE guifg=gray guibg=yellow

	" Set the fg/bg color of warning/error lines
	" highlight YcmErrorSign ctermfg=2 ctermbg=NONE
	" highlight YcmWarningSign ctermfg=2 ctermbg=NONE


" End Syntastic configuration ---------------------
" ---------------------------------------------



" ----------------------------------------------------------------------------
" Begin You-Complete-Me configuration ----------------------------------------

	" This will essentially disable YCM completion for identifiers. It will
	" only works for semantic actions. i.e., when we try to access fields.
	let g:ycm_min_num_of_chars_for_completion=100

	let g:ycm_filetype_blacklist = {
		\ 'tagbar' : 1,
		\ 'qf' : 1,
		\ 'tex' : 1,
		\ 'notes' : 1,
		\ 'markdown' : 1,
		\ 'unite' : 1,
		\ 'text' : 1,
		\ 'vimwiki' : 1,
		\ 'pandoc' : 1,
		\ 'infolog' : 1,
		\ 'mail' : 1
		\}

	let g:ycm_always_populate_location_list = 1

	" Close the preview after an option is accept
	let g:ycm_add_preview_to_completeopt = 1

	" Close the preview when leaving from insert mode
	let g:ycm_autoclose_preview_window_after_insertion = 1

	" Will open the location list when an error is diagnosed
	let g:ycm_always_populate_location_list = 1
	let g:ycm_open_loclist_on_ycm_diags = 1

" End YCM configuration ------------------------------------------------------
" ----------------------------------------------------------------------------


" ---------------------------------------------
" Clang-complete configuration -------------------------
"
"	let g:clang_user_options='|| exit 0'
"	let g:clang_library_path = '/usr/lib/llvm-3.5/lib/'
"	let g:clang_use_library=1
"	let g:clang_sort_algo = 'alpha'
"	let g:clang_memory_percent=70
"	let g:clang_jumpto_declaration_key='<F4>'
"	
"	" Open quick-fix on error
"	let g:clang_complete_copen=1
"
"	" If it should complete code patterns like for and ifs
"	let g:clang_complete_patterns=0
"
"	" Set this to 0 if you don't want autoselect, 1 if you want autohighlight,
"	" and 2 if you want autoselect. 0 will make you arrow down to select the first
"	" option, 1 will select the first option for you, but won't insert it unless you
"	" press enter. 2 will automatically insert what it thinks is right. 1 is the most
"	" convenient IMO, and it defaults to 0.
"	let g:clang_auto_select=1
"
"	" this has something to do with characters that are invisible
"	set conceallevel=2
"	set concealcursor=vin
"
"	" Set the clang_complete engine of snippets, may we someday I change to
"	" ultisnips
"	let g:clang_snippets=1
"	let g:clang_conceal_snippets=1
"	let g:clang_snippets_engine='clang_complete'
"
"	" Tells that ccomp should understand macros
"	let g:clang_complete_macros = 1
"
"	" If you prefer the Omni-Completion tip window to close when a selection is
"	" made, these lines close it on movement in insert mode or when leaving
"	" insert mode
"	autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
"	autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"
"	highlight Pmenu ctermfg=white ctermbg=darkgray
"	highlight PmenuSel ctermfg=darkgray  ctermbg=white
" 
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






" ----------------------------------------------------------------------------
" Begin Startify configs ---------------------------------------------------

	" This will make Startify and NERDTree work properly together (at startup)
	" I.e., will open nerdtree (when no file is specified as parameter) and
	" also show the startify buffer.
    autocmd VimEnter *
	                \   if !argc()
	                \ |   Startify
	                \ |   NERDTree
	                \ |   wincmd w
	                \ | endif

	" This is reaaaaaaallyyy coool man, it will change the opening buffer of
	" vim to a more cooler one =)))
	let g:startify_custom_header = map(split(system('fortune | cowsay -f $(find /usr/local/share/cows/ | shuf -n1)'), '\n'), '"   ". v:val') + ['','']

	" Make NERDTree reuse the Startify buffer
	autocmd User Startified setlocal buftype=

" End Startify configuration ---------------------
" ---------------------------------------------






" ----------------------------------------------------------------------------
" Begin LanguageTool configs ---------------------------------------------------

	let g:languagetool_jar='/opt/LanguageTool-3.1/languagetool-commandline.jar'

" End LanguageTool configuration ---------------------
" ---------------------------------------------



" ----------------------------------------------------------------------------
" Begin DelimitMate configuration --------------------------------------------

	let delimitMate_expand_cr = 1

" End DelimitMate configuration ----------------------------------------------
" ----------------------------------------------------------------------------




" ---------------------------------------------
" General configs -----------------------------
	colorscheme molokai




	set nocompatible
	set encoding=utf-8
	set mouse=a									" Enable the use of the mouse
	set number									" Shows the line number
	set hidden									" Let we change the buffer of the current window without saving it
	set nowrap									" Do not wrap lines
	set tabstop=4								" tab width is 4 spaces
	set backspace=indent,eol,start				" allow backspacing over everything
	set autoindent								" always set autoindenting on
	set copyindent								" Copy the previous indentation on autoindenting
	set shiftwidth=4							" identation is also 4 spaces
	set shiftround    							" use multiple of shiftwidth when indenting with '<' and '>'
	set showmatch     							" set show matching parenthesis
	set ignorecase    							" ignore case when searching
	set smartcase     							" ignore case if search pattern is all lowercase, case-sensitive otherwise
	set smarttab      							" insert tabs on the start of a line according to shiftwidth, not tabstop
	set hlsearch      							" highlight search terms
	set incsearch     							" show search matches as you type
	set whichwrap+=<,>,h,l,[,]					" let the cursor jump to the previous/next line when moving
	set history=1000         					" remember more commands and search history
	set undolevels=1000      					" use many muchos levels of undo
	set wildignore=*.swp,*.bak,*.pyc,*.class,*.o,*.png,*.pdf
	set title                					" change the terminal's title
	"set visualbell           					" don't beep
	set noerrorbells         					" don't beep
	set fillchars+=stl:\ ,stlnc:\
	set nobackup
	set noswapfile
	set ruler
	set showcmd
	set cursorline
	"set relativenumber

	" Set the leader key
	let mapleader = ','

	" configure folding behavior
	set foldmethod=manual
	set foldcolumn=3     
	set foldenable
	set viewoptions+=cursor,folds,slash,unix
	set viewoptions-=options

	augroup vimrc
		autocmd BufWritePost *
		\   if expand('%') != '' && &buftype !~ 'nofile'
		\|      mkview
		\|  endif
		autocmd BufRead *
		\   if expand('%') != '' && &buftype !~ 'nofile'
		\|      silent loadview
		\|  endif
	augroup END



	cmap w!! w !sudo tee % >/dev/null

	" Disable search highlight when we enter insert mode
	autocmd InsertEnter * :setlocal nohlsearch
	autocmd InsertLeave * :setlocal hlsearch

	" Save and restore foldings when closing/opening buffers
	autocmd BufWinLeave *.* mkview!
	autocmd BufWinEnter *.* silent loadview

	" required to always show the status bar of 'powerline'
	set laststatus=2

	" syntax highlight
	syntax on								

	" enable plugins loading and indentation based on filetype
	filetype plugin indent on					

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

	" Remap ';' as ':'	WTF!! now I don't need shift anymore =)))
	nnoremap	;	:
	" nnoremap 	:	<nop>

	" Reselect visual block after indent/outdent
	vnoremap < <gv
	vnoremap > >gv

	" Quickly edit/reload the vimrc file
	nmap <silent> <leader>ev :e $MYVIMRC<CR>
	nmap <silent> <leader>sv :so $MYVIMRC<CR>
	nmap <silent> <leader>ih :IH<CR>
	nmap <silent> <leader>lo :lopen<CR>
	nmap <silent> <leader>lq :lclose<CR>

	" Remap page up/down to navigate between buffers
	nnoremap <A-h> :bp<CR>
	nnoremap <C-PageUp> :bp<CR>
	nnoremap <A-l> :bn<CR>
	nnoremap <C-PageDown> :bn<CR>
	nnoremap <A-w> :Bclose<CR>

	" This enable easy moving between windows
	nnoremap <C-h> <C-w>h
	nnoremap <C-j> <C-w>j
	nnoremap <C-k> <C-w>k
	nnoremap <C-l> <C-w>l

	" Enable text search with Ctrl-f
	nnoremap <leader>f /
	inoremap <C-f> <Esc>/

	" Show the outline window and already start searching
	

	" Open CtrlP to search a name of open buffer
	nnoremap <A-p> :CtrlPBuffer<CR>
	inoremap <A-p> <Esc>:CtrlPBuffer<CR>

	" Switch between header and source files
	inoremap <C-Tab> <Esc>:A<CR>a
	nnoremap <C-Tab> :A<CR>

	" Toggle commentaries
	map <C-S-c> <plug>NERDCommenterInvert<CR>

	" Toggle english spell and grammar checker
	nnoremap <F2>	:call ToggleEnglishChecker()<CR>
	nnoremap <S-F2> 1z=
	nnoremap <F3> [s
	nnoremap <F4> ]s

	" Just a handy map to jump to definition/declaration
	nnoremap <F6> :YcmCompleter GoTo<CR>

	" Show the current buffer's list of markers
	nnoremap <F7> :SignatureListMarks<CR>

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

	" Format the current paragraph using 80-columns
	nmap <C-A-f> <ESC>vipgq
	imap <C-A-f> <ESC>vipgqa



" End General configs -------------------------
" ---------------------------------------------




" ---------------------------------------------
" Begin my custom funcs -------------------------

	function! SwitchLeftPannel()
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

	function! ToggleEnglishChecker()
		if exists("g:isEnglishCheckerActive") == 0
			let g:isEnglishCheckerActive = 0
		endif

		if g:isEnglishCheckerActive == 1
			LanguageToolClear
			set nocursorline
			set nospell
			hi clear SpellBad
		else
			LanguageToolCheck
			set nocursorline
			hi SpellBad gui=underline,bold guifg=black guibg=orange
			set spell spelllang=en_us
		endif

		let g:isEnglishCheckerActive = ! g:isEnglishCheckerActive
	endfunction


	function! BrightHighlightOn()
		hi CursorLine ctermbg=gray ctermfg=black
	endfunction

	function! BrightHighlightOff()
		hi CursorLine ctermbg=black ctermfg=gray
	endfunction


" End my custom funcs -------------------------
" ---------------------------------------------

