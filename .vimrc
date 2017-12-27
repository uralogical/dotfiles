set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'mattn/emmet-vim'
Plugin 'znake/znake-vim'
Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'terryma/vim-multiple-cursors'

nnoremap <silent><C-k> :NERDTreeToggle<CR>
nnoremap <silent><C-p> :Unite file<CR>

call vundle#end()            " required
filetype plugin indent on    " required

syntax enable
"colorscheme molokai
colorscheme palenight
"colorscheme neuromancer
set number
set noswapfile
set ruler
set title
set showcmd
set hlsearch
set incsearch
set showmatch
set wildmenu wildmode=list:longest,full
set history=10000
set ts=2
set t_Co=256
set whichwrap=b,s,h,l,<,>,[,],~
set cursorline
set laststatus=2
set showmode
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set smartindent

let g:lightline = {
  \ 'colorscheme': 'wombat'
\ }

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
				  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
					  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
		endfunction
		call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
		call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
		call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
		call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
		call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
		call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
		call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
		call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
		call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
		call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
		call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
		call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
		call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

if &term =~ "xterm"
	let &t_SI .= "\e[?2004h"
	let &t_EI .= "\e[?2004l"
	let &pastetoggle = "\e[201~"

	function XTermPasteBegin(ret)
		set paste
		return a:ret
	endfunction

	inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif
