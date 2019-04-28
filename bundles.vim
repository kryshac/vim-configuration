call plug#begin('~/.local/share/nvim/plugged')

" List Plugins =====================================

" Dependencies: {{{
  " fzf greatness (fuzzy finding)
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
    Plug 'junegunn/fzf.vim'
" }}}

" TimPope: {{{
  " Surround text with closures
    Plug 'tpope/vim-surround'
" }}}

" Navigation: {{{
  Plug 'easymotion/vim-easymotion'
" }}}

" Snippets: {{{
  " ES2015 code snippets (Optional)
    Plug 'epilande/vim-es2015-snippets', { 'for': ['javascript', 'javascript.jsx'] }

  " React code snippets
    Plug 'epilande/vim-react-snippets', { 'for': ['javascript', 'javascript.jsx'] }

  " vim snippets for Ulti ...
    Plug 'honza/vim-snippets'

  " modern snippets for vim
    Plug 'SirVer/ultisnips'
" }}}

" NERDTree: {{{
  " NERDTree... tree explorer for vim
    Plug 'scrooloose/nerdtree'

  " Nerdtree show git status
    Plug 'Xuyuanp/nerdtree-git-plugin'

  " highlight file icons with different colors
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" }}}

" Searching: {{{
  " highlights all search results and allows tabbing between them
    Plug 'haya14busa/incsearch.vim'

  " incremantal fuzzy search extension for incsearch.vim
    Plug 'haya14busa/incsearch-fuzzy.vim'

  " Integration between haya14busa/incsearch.vim and easymotion/vim-easymotion
    Plug 'haya14busa/incsearch-easymotion.vim'
" }}}

" JavaScript: {{{
  " JavaScript support (required by vim-jsx)
  Plug 'pangloss/vim-javascript'

  " React:
    " JSX support for react components
    Plug 'mxw/vim-jsx'

    " A Vim plugin that provides functions that modify React source files 
    Plug 'mvolkmann/vim-react', { 'for': 'javascript.jsx' }

    " extract partial render, rename tag, select self close tags
    Plug 'samuelsimoes/vim-jsx-utils', { 'for': 'javascript.jsx' }

  " JSON manipulation
  Plug 'tpope/vim-jdaddy', { 'for': 'json' }

  " syntax highlighting for styled components
  Plug 'styled-components/vim-styled-components', { 'branch': 'main', 'for': 'javascript.jsx' }
" }}}

" TypeScript: {{{
  " Syntax for typescript
    Plug 'HerringtonDarkholme/yats.vim'
    Plug 'leafgarland/typescript-vim'

  " Language service plugin for typescript
    Plug 'mhartington/nvim-typescript', {'do': './install.sh'}

  " For Denite features
  " you need python-neovim
    Plug 'Shougo/denite.nvim'

  " Intellisense engine
    Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
" }}}

" Airline {{{
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'enricobacis/vim-airline-clock'
" }}}

" ColorSchemes: {{{
  " One Dark
    Plug 'joshdick/onedark.vim'

  " Vim one
    Plug 'rakr/vim-one'
" }}}

" Other: {{{

  " share code screenshots with Carbon Now
    Plug 'kristijanhusak/vim-carbon-now-sh'

  " resize windows in vim naturally
    Plug 'simeji/winresizer', { 'on': 'WinResizerStartResize' }

  " Multiple cursor emulation (a la Sublime Text) using ctrl-n
    Plug 'terryma/vim-multiple-cursors'
" }}}

call plug#end()
