set nocompatible					  " be iMproved, required
filetype off                      	  " required
set rtp+=~/vimfiles/bundle/Vundle.vim " set the runtime path to include Vundle and initialize
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'scrooloose/nerdtree.git'
Plugin 'vim-scripts/Relaxed-Green'
Plugin 'vim-scripts/summerfruit256.vim'
Plugin 'tpope/vim-vividchalk'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'OrangeT/vim-csharp'
call vundle#end()
filetype plugin indent on         	  " required
:colorscheme summerfruit256
":colorscheme vividchalk
":colorscheme relaxedgreen
:syntax enable 
autocmd Filetype gitcommit setlocal spell spelllang=en_us 
autocmd Filetype gitcommit set textwidth=72
:let g:netrw_liststyle=3
:let NERDTreeHiJackNetrw=0
:let NERDTreeQuitOnOpen=1
:let NERDTreeShowBookmarks=1

if has('gui_running')
  set guifont=Lucida_Console:h12
  set lines=99999 columns=99999
endif

:set ruler number relativenumber
:set hlsearch
:set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
:set autoindent
:set pastetoggle=<f5>
:set incsearch
:set winminwidth=20
:set winwidth=100
:set winminheight=1
:set winheight=55
:call setreg('z',':set nonumber
:set norelativenumber
','c')
:call setreg('x',':set number
:set relativenumber
','c')
:inoremap dk <ESC>
:inoremap kd <ESC>
:inoremap <C-X> <C-X><C-L><C-N><C-R>=CompleteLineWithSingleMatch()<CR>
:inoremap <C-K> <C-R>=SelectPrevAutoComplete()<CR>
:inoremap <C-J> <C-R>=SelectNextAutoComplete()<CR>
:inoremap <Tab> <C-R>=TabOrComplete()<CR><C-R>=TabOrCompleteWithSingleMatch()<CR>
:inoremap <C-P> <C-R>=EnterPrint()<CR>
:inoremap <C-L> for (int i = 0; i < list.size(); i++)
{
 
}k
:noremap <C-Space> @@
:noremap <S-W> :w<CR>
:noremap <S-E> :Explore<CR>
:noremap <C-G> :call NumberToggle()<CR>:<BS>
:noremap <S-Right> gt
:noremap <S-Left> gT
:noremap <Right> l
:noremap <Left> h
:noremap <Up> k
:noremap <Down> j
:map <Space> <Plug>(easymotion-s)
:map e <Plug>(easymotion-bd-jk)
:map ; <Plug>(easymotion-repeat)
:map \ <Plug>(easymotion-prefix)
:noremap <C-H> _
:noremap <C-L> $
:noremap <C-P> :noh<CR>:<BS>
:noremap <C-N> :NERDTree<CR>
:noremap <Home> :tabnew<CR>
:vnoremap // y/<C-R>"<CR>
:vnoremap <C-N> :normal 
:vnoremap <C-K> :call FocusRange()<CR>:<BS>
:set runtimepath+=/full/path/to/plugin/directory/
:inoreabbrev {} {
a
}k<End>
":call AddToGit() adds current file that's open in VIM to git repository
":call CreateDirectory() creates the directory for folder of newly established 
"   file that was called upon using 'vim <filename with nonexistent directory>
"   so that it can be saved
":call DisplayGitGraph() shows the full graph of all the branches and history
"   for the git repository
":call FormatTreeOutput() formats the output for the CSE462 project2
":call FormatCurlyBrackets() formats curly braces for readability
":call TabOrComplete() to set tab as autocomplete while still maintaining tab function
":call SelectPrevAutoComplete() help maps ctrl-k to ctrl-p only when autocomplete
"   menu is up
":call SelectNextAutoComplete() help maps ctrl-j to ctrl-n only when autocomplete
"   menu is up
"
function! TabOrComplete()
    if col('.')>1 && strpart(getline('.'), col('.')-2, 3) =~ '^\w'
        return "\<C-N>\<C-P>"
    else
        return "\<Tab>"
    endif
endfunction

function! SelectPrevAutoComplete()
    if pumvisible() != 0
        return "\<C-P>"
    else
        return "\<C-K>"
    endif
endfunction

function! SelectNextAutoComplete()
    if pumvisible() != 0
        return "\<C-N>"
    else
        return "\<C-J>"
    endif
endfunction

function! TabOrCompleteWithSingleMatch()
    if col('.')>1 && strpart(getline('.'), col('.')-2, 3) =~ '^\w' && pumvisible() == 0
        return "\<C-N>"
    elseif col('.')>1 && strpart(getline('.'), col('.')-2, 3) =~ '^\w'
        return "\<C-N>\<C-P>"
    else
        return ""
    endif
endfunction

function! GoToMiddle()
    let wholeLine = getline(line("."))
    let lineChars = split(wholeLine, '\zs')
    let n = 0
    while n < len(lineChars)
        let char = char2nr(get(lineChars, n))
        if char  == 9 || char == 32
            let n = n + 1
        else
            break
        endif
    endwhile
    let middleColumn = (n + strlen(getline(line(".")))) / 2
    call cursor(0,middleColumn)
endfunction

function! TotalMatches()
    %s///gn
endfunction

function! EnterPrint()
	if &filetype == "java"
		return "System.out.println("
	elseif &filetype == "c"
		return "printf("
	elseif &filetype == "cpp"
		return "cout << "
	elseif &filetype == "python"
		return "print("
	else
	endif
endfunction

function! CompleteLineWithSingleMatch()
    if pumvisible() == 1
        return ""
    else
        return "\<C-N>"
    endif
endfunction

function! AlignToColumn(column)
    let currentPosition = virtcol(".")
    let offset = a:column - currentPosition
    if a:column > currentPosition
        :execute ":normal" currentPosition . "|" . offset . "i " . "\<Esc>"
    elseif a:column < currentPosition
        :execute ":normal" currentPosition . "|" . "d" . -offset . "h"
    else
    endif
endfunction

function! RainbowOn()
    :normal :RainbowParenthesesToggle

    :normal :RainbowParenthesesLoadRound

    :normal :RainbowParenthesesLoadSquare

    :normal :RainbowParenthesesLoadBraces

    :normal :RainbowParenthesesLoadChevrons

endfunction

function! RainbowOff()
    :normal :RainbowParenthesesToggle

endfunction

function! NumberToggle()
    if (&relativenumber == 1)
        set norelativenumber
    else
        set relativenumber
    endif
endfunction

function! FocusRange() range
    if a:firstline > 1
        let aboveLine = a:firstline - 1
    else
        let aboveLine = 1
    endif
    if a:lastline < line('$')
        let belowLine = a:lastline + 1
    else
        let belowLine = line('$')
    endif
    :execute ":1," . aboveLine . "fold"
    :execute ":" . belowLine . "," . line('$') . "fold"
endfunction
