" General settings {{{
 scriptencoding utf-16      " allow emojis in vimrc
 syntax on                  " syntax highlighting
" }}}

"  Behavior Modification ----------------------  {{{

  " set leader key
    let g:mapleader="\\"

  " alias for leader key
    nmap <space> \
    xmap <space> \

  set background=dark   " tell vim what the background color looks like
  set backspace=2       " Backspace deletes like most programs in insert mode
  set history=200       " how many : commands to save in history
  set ruler             " show the cursor position all the time
  set showcmd           " display incomplete commands
  set incsearch         " do incremental searching
  set hlsearch          " Highlight all search pattern matches
  set laststatus=2      " Always display the status line
  set ignorecase        " ignore case in searches
  set smartcase         " use case sensitive if capital letter present or \C
  set magic             " Use 'magic' patterns (extended regular expressions).
" set nohowmode        " don't show mode as airline already does
  set ttimeoutlen=0     " remove delay from status bar
  set showcmd           " show any commands
  set foldmethod=manual " set folds by syntax of current language<Paste>
  set mouse=a           " enable mouse (selection, resizing windows)
  set iskeyword+=-      " treat dash separated words as a word text object-test

  set tabstop=2         " Softtabs or die! use 2 spaces for tabs.
  set shiftwidth=2      " Number of spaces to use for each step of (auto)indent.
  set expandtab         " insert tab with right amount of spacing
  set shiftround        " Round indent to multiple of 'shiftwidth'
  set termguicolors     " enable true colors
  set hidden            " enable hidden unsaved buffers
  set ttyfast           " should make scrolling faster
  set lazyredraw        " should make scrolling faster

  " visual bell for errors
    set visualbell

  " wildmenu
     set wildmenu                        " enable wildmenu
     set wildmode=list:longest,list:full " configure wildmenu

  " selipboard registry will be set to plus
  " you need xsel or xclip installed
    set clipboard=unnamedplus

  " text appearance
    set textwidth=100
    set nowrap                          " nowrap by default
    set list                            " show invisible characters
    set listchars=tab:»·,trail:·,nbsp:· " Display extra whitespace

  " Numbers
    set number
    set numberwidth=3
    set relativenumber

  " Signcolumn
    set signcolumn=yes

  " Open new split panes to right and bottom, which feels more natural
    set splitbelow
    set splitright

  " enable spell check
  " set spell

  " select language for spell
    " To move your cursor to the next misspelled word, enter ]s.
    " To move your cursor to the previous misspelled word, enter [s.
    " To mark a word as good and add it to your spellfile,
    " move your cursor to the word and enter zg
    set spelllang=en

  " Set spellfile to location that is guaranteed to exist, can be symlinked to
  " Dropbox or kept in Git
    set spellfile=~/.config/nvim/spell/spell.utf-8.add

  " Autocomplete with dictionary words when spell check is on
    set complete+=kspell

  " highlight fenced code blocks in markdown
    let g:markdown_fenced_languages = [
         \ 'html',
         \ 'elm',
         \ 'vim',
         \ 'js=javascript',
         \ 'json',
         \ 'python',
         \ 'ruby',
         \ 'elixir',
         \ 'sql',
         \ 'bash=sh'
         \ ]

  " enable folding in bash files
    let g:sh_fold_enabled=1
" }}}

"  Plugin Modifications (BEFORE loading bundles) ----- {{{

" ====================================
" WinResizer:
" ====================================
  nnoremap <C-w>r :WinResizerStartResize<CR>

" ====================================
" YouCompleteMe:
" ====================================
  set completeopt-=preview
  let g:ycm_add_preview_to_completeopt = 0

" ====================================
" Ultisnips:
" ====================================
  let g:UltiSnipsJumpForwardTrigger="<TAB>"
  let g:UltiSnipsJumpBackwardTrigger="<S-TAB>"
  let g:UltiSnipsExpandTrigger="<nop>"
  let g:ulti_expand_or_jump_res = 0
  function! <SID>ExpandSnippetOrReturn()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
      return snippet
    else
      return "\<CR>"
    endif
  endfunction
  inoremap <expr> <CR> pumvisible() ? "<C-R>=<SID>ExpandSnippetOrReturn()<CR>" : "\<CR>"

" ====================================
" Vim multiple cursors:
" ====================================
  let g:multi_cursor_exit_from_insert_mode = 0
  let g:multi_cursor_exit_from_visual_mode = 0

" ====================================
" Carbon Now Screenshots (vim-carbon-now-sh)
" ====================================
  vnoremap <F5> :CarbonNowSh<CR>

" ====================================
" setup airline
" ====================================
  let g:airline_theme='onedark'
  let g:airline_powerline_fonts = 1

"let g:airline#extensions#branch#enabled = 0
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
"let g:airline#extensions#tabline#show_buffers = 0
"let g:airline_left_sep = ''
"let g:airline_right_sep = ''
"let g:airline_mode_map = {
"      \ '__' : '-',
"      \ 'n'  : 'N',
"      \ 'i'  : 'I',
"      \ 'R'  : 'R',
"      \ 'c'  : 'C',
"      \ 'v'  : 'V',
"      \ 'V'  : 'V',
"      \ '' : 'V',
"      \ 's'  : 'S',
"      \ 'S'  : 'S',
"      \ '' : 'S',
"      \ }

" =====================================
"  FZF
" =====================================
" set fzf's default input to ripgrep instead of find. This also removes gitignore etc
" let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'
  let $FZF_DEFAULT_COMMAND = 'fd --type f --hidden --follow --color=always --exclude .git --ignore-file ~/.gitignore'
  let $FZF_DEFAULT_OPTS='--ansi'
  let g:fzf_files_options = '--preview "(bat --color \"always\" --line-range 0:100 {} || head -'.&lines.' {})"'

  function! FZFOpen(command_str)
    if (expand('%') =~# 'NERD_tree' && winnr('$') > 1)
      exe "normal! \<c-w>\<c-w>"
    endif
    exe 'normal! ' . a:command_str . "\<cr>"
  endfunction

  command! -bang -nargs=* FzfRg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
    \   <bang>0 ? fzf#vim#with_preview('up:60%')
    \           : fzf#vim#with_preview('right:50%:hidden', '?'),
    \   <bang>0)

  nnoremap <silent> <C-b> :call FZFOpen(':Buffers')<CR>
  nnoremap <silent> <C-g>g :call FZFOpen(':FzfRg!')<CR>
  nnoremap <silent> <C-g>c :call FZFOpen(':Commands')<CR>
  nnoremap <silent> <C-g>l :call FZFOpen(':BLines')<CR>
  nnoremap <silent> <C-p> :call FZFOpen(':Files')<CR>
  nnoremap <silent> <C-h> :call FZFOpen(':History')<CR>
  " nnoremap <silent> <C-p> :call FZFOpen(':call Fzf_dev()')<CR>

  imap <c-x><c-k> <plug>(fzf-complete-word)
  imap <c-x><c-f> <plug>(fzf-complete-path)
  imap <c-x><c-j> <plug>(fzf-complete-file-ag)
  imap <c-x><c-l> <plug>(fzf-complete-line)

" ======================================
" FZF + DevIcons
" ======================================
  " Files + devicons
  function! Fzf_dev()
    let l:fzf_files_options = '--preview "rougify {2..-1} | head -'.&lines.'"'

    function! s:files()
      let l:files = split(system($FZF_DEFAULT_COMMAND), '\n')
      return s:prepend_icon(l:files)
    endfunction

    function! s:prepend_icon(candidates)
      let l:result = []
      for l:candidate in a:candidates
        let l:filename = fnamemodify(l:candidate, ':p:t')
        let l:icon = WebDevIconsGetFileTypeSymbol(l:filename, isdirectory(l:filename))
        call add(l:result, printf('%s %s', l:icon, l:candidate))
      endfor

      return l:result
    endfunction

    function! s:edit_file(item)
      let l:pos = stridx(a:item, ' ')
      let l:file_path = a:item[pos+1:-1]
      " TODO: not working
      let l:cmd = get({
                \ 'ctrl-x': 'split',
                \ 'ctrl-v': 'vertical split',
                \ 'ctrl-t': 'tabe'
                \ }, a:item[0], 'e')
      execute 'silent ' . l:cmd . ' ' . l:file_path
    endfunction

    call fzf#run({
          \ 'source': <sid>files(),
          \ 'sink':   function('s:edit_file'),
          \ 'options': '-m --expect=ctrl-t,ctrl-v,ctrl-x '.
          \            l:fzf_files_options,
          \ 'down':    '40%' })
  endfunction

  " Custom FZF commands ----------------------------- {{{
  fun! s:change_branch(e)
    let l:_ = system('git checkout ' . a:e)
    :e!
    :AirlineRefresh
    echom 'Changed branch to' . a:e
  endfun

  fun! s:parse_pivotal_story(entry)
      let l:stories = pivotaltracker#stories('', '')
      let l:filtered = filter(l:stories, {_idx, val -> val.menu == a:entry[0]})
      return l:filtered[0].word
  endfun

  inoremap <expr> <c-x># fzf#complete(
        \ {
        \ 'source': map(pivotaltracker#stories('', ''), {_key, val -> val.menu}),
        \ 'reducer': function('<sid>parse_pivotal_story'),
        \ 'options': '-m',
        \ 'down': '20%'
        \ })

  inoremap <expr> <c-x>t fzf#complete(
        \ {
        \ 'source': map(pivotaltracker#stories('', ''), {_key, val -> val.menu}),
        \ 'options': '-m',
        \ 'down': '20%'
        \ })

  command! Gbranch call fzf#run(
        \ {
        \ 'source': 'git branch',
        \ 'sink': function('<sid>change_branch'),
        \ 'options': '-m',
        \ 'down': '20%'
        \ })

  fun! s:change_remote_branch(e)
    let l:_ = system('git checkout --track ' . a:e)
    :e!
    :AirlineRefresh
    echom 'Changed to remote branch' . a:e
  endfun

  command! Grbranch call fzf#run(
        \ {
        \ 'source': 'git branch -r',
        \ 'sink': function('<sid>change_remote_branch'),
        \ 'options': '-m',
        \ 'down': '20%'
        \ })
  " --------------------------------------------------}}}

" ----------------------------------------------------------------------------
" Easymotion
" ----------------------------------------------------------------------------
  " <Leader>f{char} to move to {char}
    map  <Leader>f <Plug>(easymotion-bd-f)
    nmap <Leader>f <Plug>(easymotion-overwin-f)

  " s{char}{char} to move to {char}{char}
    nmap s <Plug>(easymotion-overwin-f2)

  " Move to line
    map <Leader>L <Plug>(easymotion-bd-jk)
    nmap <Leader>L <Plug>(easymotion-overwin-line)

  " Move to word
    map  <Leader>w <Plug>(easymotion-bd-w)
    nmap <Leader>w <Plug>(easymotion-overwin-w)

  " Integration with incsearch.vim
    " You can use other keymappings like <C-l> instead of <CR> if you want to
    " use these mappings as default search and sometimes want to move cursor with
    " EasyMotion.
      function! s:incsearch_config(...) abort
        return incsearch#util#deepextend(deepcopy({
        \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
        \   'keymap': {
        \     "\<CR>": '<Over>(easymotion)'
        \   },
        \   'is_expr': 0
        \ }), get(a:, 1, {}))
      endfunction

      noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
      noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
      noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))

  " Integration with incsearch-fuzzy.vim
    function! s:config_easyfuzzymotion(...) abort
      return extend(copy({
      \   'converters': [incsearch#config#fuzzyword#converter()],
      \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
      \   'keymap': {"\<CR>": '<Over>(easymotion)'},
      \   'is_expr': 0,
      \   'is_stay': 1
      \ }), get(a:, 1, {}))
    endfunction

    noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())

" ----------------------------------------------------------------------------
" NERDTree
" ----------------------------------------------------------------------------
  let g:NERDTreeIgnore = [
        \ '\.vim$',
        \ '\~$',
        \ '\.beam',
        \ 'elm-stuff',
        \ 'deps',
        \ '_build',
        \ '.git',
        \ 'node_modules',
        \ 'tags',
        \ ]

  let g:NERDTreeShowHidden = 1
  let g:NERDTreeAutoDeleteBuffer=1
  " keep alternate files and jumps
  let g:NERDTreeCreatePrefix='silent keepalt keepjumps'

  nnoremap <Leader>nt :NERDTreeToggle<CR>

  " not necessarily NTree related but uses NERDTree because I have it setup
  nnoremap <leader>d :e %:h<CR>

  augroup NERDTreeAuCmds
    autocmd!
    autocmd FileType nerdtree nmap <buffer> <expr> - g:NERDTreeMapUpdir
  augroup END
  " move up a directory with "-" like using vim-vinegar (usually "u" does that)

" Load all plugins ------------------------------- {{{
if filereadable(expand("~/.config/nvim/init.vim.bundles"))
  source ~/.config/nvim/init.vim.bundles
endif
" }}}

" UI Customizations --------------------------------{{{

  set background=dark
  colorscheme one
    let g:one_allow_italics = 1
    call one#highlight('elixirInclude', 'e06c75', '', 'none')
    call one#highlight('elixirOperator', 'd19a66', '', 'none')
    call one#highlight('vimTodo', '000000', 'ffec8b', 'none')

  let g:limelight_conceal_ctermfg = '#454d5a'
  let g:limelight_conceal_guifg = '#454d5a'

  " Make it obvious where 80 characters is
  " cheatsheet https://jonasjacek.github.io/colors/
    highlight ColorColumn ctermbg=60 guibg=#282A33
    let &colorcolumn=join(range(&textwidth,999),',')

    highlight SignColumn ctermbg=60 guibg=#282A33

  " solid window border
    set fillchars+=vert:│

  " hide vertical split
  hi vertsplit guifg=fg guibg=bg
" }}

" For NeoVim ----------------------------------------------------- {{{
  " Remove highlight all search pattern matches
    map <silent> <ESC> :nohlsearch<CR>
" }}}
