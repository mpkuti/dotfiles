"-------------------------------------------------------------------------------
" Vundle, package manager
"-------------------------------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"-------------------------------------------------------------------------------
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" Powerline
"Plugin 'Lokaltog/powerline'
" Latex-Suite
Plugin 'git://git.code.sf.net/p/vim-latex/vim-latex'
" NERDTree
Plugin 'scrooloose/nerdtree'
" Minibubexpl
Plugin 'fholgado/minibufexpl.vim'
" Language Tool
Plugin 'vim-scripts/LanguageTool'
" Vim-Marked
Plugin 'itspriddle/vim-marked'
"-------------------------------------------------------------------------------
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"-------------------------------------------------------------------------------

"-------------------------------------------------------------------------------
" STATUSLINE
set laststatus=2
set statusline=%t       "tail of the filename
set statusline+=\ [%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=[%c,    "cursor column
set statusline+=%l/%L]  "cursor line/total lines
set statusline+=[%P]  "percent through file
"-------------------------------------------------------------------------------

"-------------------------------------------------------------------------------
" UTF 8
"-------------------------------------------------------------------------------
set encoding=utf-8
"-------------------------------------------------------------------------------

"-------------------------------------------------------------------------------
"********** Required by Pathogen: **********
"-------------------------------------------------------------------------------
"execute pathogen#infect()
"-------------------------------------------------------------------------------

"-------------------------------------------------------------------------------
"********** 256 Colors **********
"-------------------------------------------------------------------------------
set t_Co=256
"-------------------------------------------------------------------------------

"-------------------------------------------------------------------------------
"********** UI Color Theme **********
"-------------------------------------------------------------------------------
colors noctu
"-------------------------------------------------------------------------------
"
"-------------------------------------------------------------------------------
"********** Spell check language set **********
"-------------------------------------------------------------------------------
"set spell spelllang=en_us
"-------------------------------------------------------------------------------

"-------------------------------------------------------------------------------
"********** Language Tool (grammar checking) **********
"-------------------------------------------------------------------------------
"let g:languagetool_jar='$HOME/LanguageTool-2.6/languagetool-commandline.jar'
let g:languagetool_jar='$HOME/LanguageTool-2.7/languagetool-commandline.jar'
let g:languagetool_lang='en-US'
cmap lch LanguageToolCheck
"-------------------------------------------------------------------------------

"-------------------------------------------------------------------------------
"********** Make the 81th column stand out **********
"-------------------------------------------------------------------------------
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)
"-------------------------------------------------------------------------------

"-------------------------------------------------------------------------------
"********** Powerline: **********
"-------------------------------------------------------------------------------
"set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
"set nocompatible
"set laststatus=2
"let g:Powerline_symbols = 'fancy'
"-------------------------------------------------------------------------------

"-------------------------------------------------------------------------------
"********** This enables automatic indentation as you type. **********
"-------------------------------------------------------------------------------
filetype indent on

"********** Indentation settings: **********
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
"-------------------------------------------------------------------------------

"-------------------------------------------------------------------------------
"********** Show the invisible characters: **********
"-------------------------------------------------------------------------------
set list
"********** Use the same symbols as TextMate for tabstops and EOLs **********
set listchars=tab:▸\ ,eol:¬

"**********Invisible character colors **********
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
"-------------------------------------------------------------------------------

"-------------------------------------------------------------------------------
"********** Misc **********
"-------------------------------------------------------------------------------
" INSERT NEW LINE WITHOUT ENTERING INSERT MODE
" <Enter>: new line after this line
" <Shift> + <Enter>: new line before this line
nmap <CR> o<esc>
nmap <S-Enter> O<esc>

" SAVE WHENEVER CHANGING THE BUFFER
:set autowrite

" SHOW ROW NUMBERS
:set number

" SYNTAX HIGHLIGHTING
syntax on
filetype plugin on

" Call :ls and insert :b with <leader>b
let mapleader = "\<tab>"
"nnoremap <Leader>b :ls<CR>:b<Space>
nnoremap <Leader>b :ls<CR>:b
"-------------------------------------------------------------------------------

"-------------------------------------------------------------------------------
"********** Solarized theme: **********
"-------------------------------------------------------------------------------
"set background=dark
"let g:solarized_termcolors=256
"colorscheme solarized

"-------------------------------------------------------------------------------
"-------------------------------------------------------------------------------
" FILETYPE SPECIFIC RULES
"-------------------------------------------------------------------------------
"-------------------------------------------------------------------------------

"-------------------------------------------------------------------------------
"-------------------------------------------------------------------------------
" LaTeX-SUITE RULES
"-------------------------------------------------------------------------------
let mapleader = "\<tab>"

"let g:Tex_CompileRule_dvi = 'pdflatex --interaction=nonstopmode --shell-escape $*'
let g:Tex_CompileRule_pdf = 'pdflatex --interaction=nonstopmode --shell-escape $*'

" Set the XeTeX compiler by pressing <Leader>lx (<tab>lx)
function SetXeTex()
    "let g:Tex_CompileRule_pdf = 'xelatex -aux-directory=F:/Vim/my_latex_doc/temp --synctex=-1 -src-specials -interaction=nonstopmode $*'
    "let g:Tex_CompileRule_pdf = 'xelatex --interaction=nonstopmode --shell-escape $*'
    let g:Tex_CompileRule_pdf = 'xelatex --shell-escape $*'
endfunction
map <Leader>lx :<C-U>call SetXeTex()<CR>

"g:Tex_CompileRule_pdf = 'latex --interaction=nonstopmode --shell-escape $*'

let g:Tex_DefaultTargetFormat='pdf'
let g:tex_flavor = "pdflatex"
let g:Tex_BibtexFlavor = 'bibtex'
let g:Tex_MultipleCompileFormats='pdf'
"let g:Tex_CompileRule_pdf = 'mkdir -p tmp; pdflatex -output-directory tmp -interaction=nonstopmode $*; cp tmp/*.pdf .'
let TCLevel = 'strict'

let g:Tex_ViewRule_pdf = 'open -a Skim.app'

"********** environments **********
let g:Tex_PromptedEnvironments = 'eqnarray*,eqnarray,equation,equation*,\[,$$,align,align*,figure,table'

"********** prompted commands using F7 key: **********
let g:Tex_PromptedCommands = 'footnote,cite,pageref,label,input'

"********** Disable folding **********
:let Tex_FoldedSections=""
:let Tex_FoldedEnvironments=""
:let Tex_FoldedMisc=""

"********** Soft wrapping **********
autocmd BufRead,BufNewFile *.tex set wrap linebreak nolist
"-------------------------------------------------------------------------------

"-------------------------------------------------------------------------------
" TXT
"-------------------------------------------------------------------------------
" Soft wrapping
autocmd BufRead,BufNewFile *.txt set wrap linebreak nolist nonumber
"-------------------------------------------------------------------------------

"-------------------------------------------------------------------------------
" MARKDOWN
"-------------------------------------------------------------------------------
" Recognize .md as .markdown file type
autocmd BufRead,BufNewFile *.md set filetype=markdown
" Soft wrapping
autocmd BufRead,BufNewFile *.md set wrap linebreak nolist
autocmd BufRead,BufNewFile *.markdown set wrap linebreak nolist nonumber
"-------------------------------------------------------------------------------

"-------------------------------------------------------------------------------
" PYTHON
"-------------------------------------------------------------------------------
" based on: http://www.vex.net/~x/python_and_vim.html
autocmd BufRead,BufNewFile *.py set tabstop=4
autocmd BufRead,BufNewFile *.py set shiftwidth=4
autocmd BufRead,BufNewFile *.py set smarttab
autocmd BufRead,BufNewFile *.py set expandtab
autocmd BufRead,BufNewFile *.py set softtabstop=4
autocmd BufRead,BufNewFile *.py set autoindent
autocmd BufRead,BufNewFile *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd BufWritePre *.py normal m`:%s/\s\+$//e``
"-------------------------------------------------------------------------------
