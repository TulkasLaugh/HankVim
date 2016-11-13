set nocompatible                  " be iMproved, required
filetype off                      " required
set rtp+=~/.vim/bundle/Vundle.vim " set the runtime path to include Vundle and initialize
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree.git'
Plugin 'easymotion/vim-easymotion'
Plugin 'vim-scripts/summerfruit256.vim'
Plugin 'vim-scripts/Relaxed-Green'
Plugin 'tpope/vim-vividchalk'
call vundle#end()
filetype plugin indent on         " required
let g:netrw_liststyle=3           " Set file explorer to list NERDTree style directory
autocmd Filetype gitcommit setlocal spell spelllang=en_us 
autocmd Filetype gitcommit set textwidth=72
:syntax enable 
:set t_Co=256
:colorscheme summerfruit256
":colorscheme relaxedgreen
:let NERDTreeHijackNetrw=0
:let NERDTreeShowBookmarks=1
:let NERDTreeQuitOnOpen=1
:set ruler number relativenumber
:set hlsearch
:set tabstop=4 softtabstop=4 shiftwidth=4 et
:set autoindent
:set pastetoggle=<f5>
:set incsearch
:set winminwidth=20
:set winwidth=100
:set winminheight=1
:set winheight=55
:inoremap <C-P> <C-R>=EnterPrint()<CR>
:inoremap <C-X> <C-X><C-L><C-N><C-R>=CompleteLineWithSingleMatch()<CR>
:inoremap <C-K> <C-R>=SelectPrevAutoComplete()<CR>
:inoremap <C-J> <C-R>=SelectNextAutoComplete()<CR>
:inoremap <Tab> <C-R>=TabOrComplete()<CR><C-R>=TabOrCompleteWithSingleMatch()<CR>
"Mapped meta-j,k,h,l to be arrow keys in insert mode
:inoremap ˙ <Left>
:inoremap ¬ <Right>
:inoremap ˚ <Up>
:inoremap ∆ <Down>
:map <Space> <Plug>(easymotion-s)
:map e <Plug>(easymotion-bd-jk)
:map ; <Plug>(easymotion-repeat)
:map \ <Plug>(easymotion-prefix)
:map [[ ?{<CR>w99[{:noh<CR>:call AlignToFunction()<CR>zt
:map ]] j0[[%/{<CR>:noh<CR>:call AlignToFunction()<CR>zt
"∆ (meta-j) makes line down, ˚ (meta-k) makes line up
:noremap ∆ o<Esc>
:noremap ˚ O<Esc>
:noremap <S-Left> gT
:noremap <S-Right> gt
:noremap <Left> <C-W>h 
:noremap <Right> <C-W>l 
:noremap <Up> <C-W>k 
:noremap <Down> <C-W>j 
:noremap <C-@> @@
:noremap <C-]> <C-]>zt
:noremap <S-W> :w<CR>
:noremap <S-E> :Explore<CR>
:noremap <C-G> :call NumberToggle()<CR>:<BS>
:noremap <C-H> _
:noremap <C-L> $
:noremap <C-P> :noh<CR>:<BS>
:noremap <C-N> :NERDTree<CR>
:noremap Ω :set nonumber<CR>:set norelativenumber<CR>
:noremap ≈ :set number<CR>:set relativenumber<CR>
:noremap <Home> :tabnew<CR>
:vnoremap // y/<C-R>"<CR>
:vnoremap <C-N> :normal 
:set runtimepath+=/full/path/to/plugin/directory/
:inoreabbrev {} {<CR> <BS><CR>}<Up><End>
":call AddToGit() adds current file that's open in VIM to git repository
":call CreateDirectory() creates the directory for folder of newly established 
"   file that was called upon using 'vim <filename with nonexistent directory>
"   so that it can be saved
":call DisplayGitGraph() shows the full graph of all the branches and history
"   for the git repository
":call FormatTreeOutput() formats the output for the CSE462 project2
":call FormatCurlyBrackets() formats curly braces for readability
":call GoToMiddle() sets cursor to middle of the line
":call TotalMatches() to see how many matches are for a search done 
":call TabOrComplete() to set tab as autocomplete while still maintaining tab function
":call SelectPrevAutoComplete() help maps ctrl-k to ctrl-p only when autocomplete
"   menu is up
":call SelectNextAutoComplete() help maps ctrl-j to ctrl-n only when autocomplete
"   menu is up
":call NumberToggle() switches between relative number and absolute number at
"   a single command
