" ============================================================================
" Load Plugins {{{

function! s:LoadPlugins()
  call plug#begin('~/.local/share/nvim/plugged')

  "HIGHLIGHTS
  Plug 'rafi/awesome-vim-colorschemes'
  Plug 'sheerun/vim-polyglot'

  "YCM
  Plug 'Valloric/YouCompleteMe'
  Plug 'Valloric/ListToggle'

  "STATUSLINE
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  "GIT
  Plug 'mhinz/vim-signify'
  Plug 'tpope/vim-fugitive'

  "NERDTREE
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'

  "SESSIONS
  Plug 'xolox/vim-misc'
  Plug 'xolox/vim-session'

  "SEARCHERS
  Plug '/usr/share/vim/vimfiles' "fzf installed by pacman
  Plug 'junegunn/fzf.vim'
  Plug 'dyng/ctrlsf.vim'

  "TAGS
  Plug 'majutsushi/tagbar'
  Plug 'ludovicchabant/vim-gutentags'

  "SNIPPETS
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'

  "SOME UI ENCHANTMENTS
  Plug 'ryanoasis/vim-devicons'
  Plug 'blueyed/vim-diminactive'
  Plug 'mhinz/vim-startify'

  "EDITORS
  Plug 'scrooloose/nerdcommenter'
  Plug 'junegunn/vim-easy-align'
  Plug 'tpope/vim-surround'
  Plug 'jiangmiao/auto-pairs'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'AndrewRadev/sideways.vim'
  Plug 'tommcdo/vim-exchange'
  Plug 'kana/vim-niceblock'
  Plug 'matze/vim-move'

  "MOTIONS
  Plug 'romainl/vim-cool'
  Plug 'easymotion/vim-easymotion'
  Plug 'yuttie/comfortable-motion.vim'
  Plug 'chaoren/vim-wordmotion'

  "FEATURSE
  Plug 'xolox/vim-notes'
  Plug 'airblade/vim-rooter'
  Plug 'markonm/traces.vim'
  Plug 'tpope/vim-repeat'
  Plug 'junegunn/limelight.vim'
  Plug 'junegunn/vim-peekaboo'
  Plug 'troydm/zoomwintab.vim'
  Plug 'mbbill/undotree'
  Plug 'machakann/vim-highlightedyank'

  "TESTING RIGHT NOW

  "TO TEST

  "TEXT OBJECT
  "https://github.com/gcmt/wildfire.vim
  "https://github.com/wellle/targets.vim
  "https://github.com/kana/vim-textobj-user
  "https://github.com/Julian/vim-textobj-variable-segment
  "https://github.com/rhysd/vim-textobj-anyblock

  "EDITOR
  "https://github.com/AndrewRadev/splitjoin.vim

  "TO HARD
  "https://github.com/lifepillar/vim-mucomplete
  "https://github.com/xolox/vim-notes
  "https://github.com/xolox/vim-easytags

  "DOUBT
  "https://github.com/tpope/vim-unimpaired
  "https://github.com/tpope/vim-rsi

  " there are so nice structed config --> hneutr/dotfiles
  " and remember this guy             --> junegunn
  " so nice too                       --> https://habr.com/post/303524/
  call plug#end()
endfunction
" }}}
" ============================================================================

" ============================================================================
" Basic Settings {{{

function! s:BasicSettings()
  " --------------------------------------------------------------------------
  " options {{{

  "left colomn
  set number
  set relativenumber
  "search
  set incsearch
  set hlsearch
  set ignorecase
  set smartcase
  "folding
  set foldenable
  set foldlevel=100
  set foldmethod=marker
  "tab
  set tabstop=2
  set shiftwidth=2
  set smarttab
  set expandtab
  set smartindent
  "local language
  set keymap=russian-jcukenwin
  set iminsert=0
  set imsearch=0
  "misc
  set scrolloff=10
  set termencoding=utf8
  set showcmd
  set ch=1
  set mouse=a
  set mousehide
  set nowrap
  set showmatch
  set backspace=indent,eol,start
  set history=200
  set list
  set listchars=tab:\ \ ,trail:·
  set fillchars=fold:\ 
  set cursorline
  set nocompatible
  set backup
  set backupdir=~/.nvimbk
  set notimeout " for leader key etc
  set sessionoptions-=buffers
  " }}}

  " --------------------------------------------------------------------------
  " bindings {{{

  "leader space
  let g:mapleader = ' '
  nnoremap <space> <NOP>

  "movement in insert mode
  inoremap <m-h> <left>
  inoremap <m-j> <down>
  inoremap <m-k> <up>
  inoremap <m-l> <right>

  "separating sting
  nnoremap <leader>/- :call AppendCommentLine('-')<CR>
  nnoremap <leader>/= :call AppendCommentLine('=')<CR>
  nnoremap <leader>/* :call AppendCommentLine('*')<CR>

  "vim
  nnoremap <leader>vs :e ~/.config/nvim/init.vim<CR>
  nnoremap <leader>vr :source ~/.config/nvim/init.vim<CR>

  "clipboard copy
  nmap <leader>vc "+y
  xmap <leader>vc "+y

  "primary copy
  nmap <leader>vy "*y
  xmap <leader>vy "*y

  "windows switching
  nnoremap <silent> <leader>h :call LoadWindow()<CR>

  "terminal toggle
  nnoremap <silent> <F1> :call TerminalToggle()<CR>
  tnoremap <silent> <F1> <C-\><C-n>:call TerminalToggle()<CR>
  nnoremap <silent> <F13> :call SwitchWindowTo("Terminal")<CR>
  tnoremap <silent> <F13> <C-\><C-n>:call SwitchWindowTo("Terminal")<CR>

  "work directory
  nnoremap <leader>dc :cd %:p:h<CR>:pwd<CR>

  "misc
  set pastetoggle=<F8>
  noremap s <NOP>
  noremap S <NOP>
  noremap m <NOP>
  nnoremap <leader>m m
  noremap q <NOP>
  nnoremap <leader>2 q

  "swap ' and `
  nnoremap ' `
  nnoremap ` '
  nnoremap * g*
  nnoremap g* *
  nnoremap # g#
  nnoremap g# #

  "useful binds
  vnoremap // y/<C-R>"<CR>
  nnoremap <leader>w <C-w>

  " }}}

  " --------------------------------------------------------------------------
  " autocomands {{{

  "clear highlight function autoloads
  augroup SetHighlightFunctionGroup
    autocmd!
  augroup END

  "disabling autocommenting
  augroup DisablingAutocommenting
    autocmd!
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
  augroup END

  ""auto save/loading folds {{{
  "function! ValidFolds()
  "  if &l:diff | return 0 | endif
  "  if &buftype != '' | return 0 | endif
  "  if expand('%') =~ '\[.*\]' | return 0 | endif
  "  if empty(glob(expand('%:p'))) | return 0 | endif
  "  if &modifiable == 0 | return 0 | endif
  "  if len($TEMP) && expand('%:p:h') == $TEMP | return 0 | endif
  "  if len($TMP) && expand('%:p:h') == $TMP | return 0 | endif
  "  if expand('%:p:t') == '' | return 0 | endif

  "  return 1
  "endfunction

  "augroup RememberFolds
  "  autocmd!
  "  autocmd BufWritePre,BufWinLeave ?* if ValidFolds() | silent! mkview | endif
  "  autocmd BufWinEnter ?* if ValidFolds() | silent! loadview | endif
  "augroup END
  "" so many fucking errors. may be later}}}
 "}}}

endfunction
" }}}
" ============================================================================

" ============================================================================
" Configure View {{{
function! s:ConfigureView()
  " --------------------------------------------------------------------------
  " view options
  set termguicolors
  set background=dark

  " --------------------------------------------------------------------------
  " favorite sets {{{
  let g:airline_theme='onedark'
  colorscheme lucid
  "colorscheme one
  "colorscheme lucius
  "colorscheme atom

  "let g:airline_theme='hybrid'
  "colorscheme lucius
  "colorscheme deus

  "let g:airline_theme='wombat'
  "colorscheme wombat256mod
  "colorscheme apprentice

  "let g:airline_theme='behelit'
  "colorscheme space-vim-dark
  "colorscheme minimalist

  "let g:airline_theme='ayu_mirage'
  "colorscheme one
  "colorscheme molokai
  "colorscheme dracula

  "unusable but good
  "let g:airline_theme='base16_shell'
  " }}}

  " --------------------------------------------------------------------------
  " highlight colors {{{
  "CursorLine
  call s:SetHighlight("CursorLine",   { 'bg': '#232323'})
  call s:SetHighlight("CursorLineNr", { 'mode': 'bold', 'fg': '#7bc992', 'bg': '#191919'})

  "Msg
  call s:SetHighlight("ErrorMsg",     { 'mode': 'bold', 'bg': '#000000', 'fg': '#ff5555'})
  call s:SetHighlight("WarningMsg",   { 'mode': 'bold', 'bg': '#101010', 'fg': '#ff79c6'})

  "Pmenu
  call s:SetHighlight("Pmenu",        { 'bg': '#101010', 'fg': '7bc992'})
  call s:SetHighlight("PmenuSel",     { 'bg': '#ff99ff', 'fg': 'black'})

  "Diffs
  call s:SetHighlight("DiffAdd",      { 'fg': '#55ff55'})
  call s:SetHighlight("DiffDelete",   { 'fg': '#ff5555'})
  call s:SetHighlight("DiffChange",   { 'fg': '#ff9955'})

  "Folded
  call s:SetHighlight("Folded",       { 'bg': '#302737'})

  "ColorColumn
  call s:SetHighlight("ColorColumn",  { 'bg': '#16121d', 'fg': '#d4eddd'})

  "Directory
  "call s:SetHighlight("Directory",   { 'fg': '#7bc992'})
  " }}}

endfunction
" }}}
" ============================================================================

" ============================================================================
" Configure Plugins {{{

function! s:ConfigureFZF() " {{{
  " --------------------------------------------------------------------------
  " options {{{
  let $FZF_DEFAULT_OPTS = '--multi --no-mouse --inline-info'
  let $FZF_DEFAULT_COMMAND = 'fd --hidden --no-ignore-vcs --type file'

  let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-s': 'split',
    \ 'ctrl-v': 'vsplit' }
  let g:fzf_layout = { 'down': '30%' }
  let g:fzf_history_dir = '~/.local/share/fzf-history'
  let g:fzf_command_prefix='Fzf'

  "autoclose statusline
  augroup CustomFzfView
    autocmd!
    autocmd  FileType fzf set laststatus=0 noshowmode relativenumber!
    autocmd  FileType fzf autocmd BufLeave <buffer> set laststatus=2 showmode relativenumber
  augroup END
  " }}}
  " --------------------------------------------------------------------------
  " highlights {{{
  let g:fzf_colors =
  \ { 'fg'      : ['fg', 'FzfFg'      ] ,
    \ 'bg'      : ['fg', 'FzfBg'      ] ,
    \ 'hl'      : ['fg', 'FzfHl'      ] ,
    \ 'fg+'     : ['bg', 'FzfFg'      ] ,
    \ 'bg+'     : ['bg', 'FzfBg'      ] ,
    \ 'hl+'     : ['bg', 'FzfHl'      ] ,
    \ 'info'    : ['fg', 'FzfInfo'    ] ,
    \ 'border'  : ['fg', 'FzfBorder'  ] ,
    \ 'prompt'  : ['fg', 'FzfPrompt'  ] ,
    \ 'pointer' : ['fg', 'FzfPointer' ] ,
    \ 'marker'  : ['fg', 'FzfMarker'  ] ,
    \ 'spinner' : ['fg', 'FzfSpiner'  ] ,
    \ 'header'  : ['fg', 'FzfHeader'  ] }
  call s:SetHighlight('FzfFg', {'fg': '#3fc997', 'bg': '#00ffff'})
  call s:SetHighlight('FzfBg', {'fg': '#000000', 'bg': '#161616'})
  call s:SetHighlight('FzfHl', {'fg': '#db0088', 'bg': '#ff0000'})

  call s:SetHighlight('FzfInfo'   , {'fg': '#d0ffc3'})
  call s:SetHighlight('FzfBorder' , {'fg': '#ffffff'})
  call s:SetHighlight('FzfPrompt' , {'fg': '#b3e4eb'})
  call s:SetHighlight('FzfPointer', {'fg': '#00ffff'})
  call s:SetHighlight('FzfMarker' , {'fg': '#ff0000'})
  call s:SetHighlight('FzfSpiner' , {'fg': '#d0ffc3'})
  call s:SetHighlight('FzfHeader' , {'fg': '#ffffff'})
  " }}}
  " --------------------------------------------------------------------------
  " bindings {{{
  nmap <m-m> <plug>(fzf-maps-n)
  xmap <m-m> <plug>(fzf-maps-x)
  omap <m-m> <plug>(fzf-maps-o)
  imap <m-m> <plug>(fzf-maps-i)

  inoremap <expr> <c-f>p fzf#vim#complete#path("fd --no-ignore --hidden --type directory")
  inoremap <expr> <c-f>f fzf#vim#complete#path("fd --no-ignore --hidden --type file")
  imap <c-f>l <plug>(fzf-complete-line)
  imap <c-f>b <plug>(fzf-complete-buffer-line)

  "open file
  nnoremap <expr> <Leader>of (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":FzfFiles\<CR>"
  nnoremap <silent> <expr> <leader>od ":FzfFiles ".(expand('%:p:h'))."\<CR>"
  nnoremap <leader>ov :FzfFiles ~/.local/share/nvim<CR>
  nnoremap <leader>og :FzfGFiles<CR>
  nnoremap <leader>oc :FzfGFiles?<CR>| "changed
  nnoremap <leader>ob :FzfBuffers<CR>
  nnoremap <leader>ol :FzfLines<CR>
  nnoremap <leader>ot :FzfTags<CR>
  nnoremap <leader>oz :FzfMarks<CR>
  nnoremap <leader>ow :FzfWindows<CR>
  nnoremap <leader>om :FzfHistory<CR>| "mru
  "buffer local select
  nnoremap <leader>bl :FzfBLines<CR>
  nnoremap <leader>bt :FzfBTags<CR>
  "select other
  nnoremap <leader>st :FzfColors<CR>| "theme
  nnoremap <leader>s: :FzfHistory:<CR>
  nnoremap <leader>s/ :FzfHistory/<CR>
  nnoremap <leader>ss :FzfSnippets<CR>
  nnoremap <leader>sc :FzfCommands<CR>
  nnoremap <leader>sh :FzfHelptags<CR>
  "later
  "nnoremap <leader>oc :FzfCommits<CR>
  "nnoremap <leader>oC :FzfBCommits<CR>
  " }}}
endfunction " }}}

function! s:ConfigureYCM() " {{{
  " --------------------------------------------------------------------------
  " options
  let g:ycm_global_ycm_extra_conf = '~/.config/ycm/ycm_extra_conf.py'
  set completeopt-=preview
  let g:ycm_add_preview_to_completeopt = 0
  let g:ycm_always_populate_location_list = 1
  "let g:ycm_autoclose_preview_window_after_insertion = 1
  let g:lt_height = 7

  " --------------------------------------------------------------------------
  " highlights
  call s:SetHighlight('YcmErrorSign', {'mode': 'bold', 'bg': '#101010', 'fg': '#f43753'})
  call s:SetHighlight('YcmErrorLine', {'bg': '#20202d'})
  call s:SetHighlight('YcmErrorSection', {'mode': 'bold', 'bg': '#ff5555', 'fg': '#000000'})

  " --------------------------------------------------------------------------
  " bindings
  nnoremap <leader>yc :YcmForceCompileAndDiagnostics<CR>
  let g:ycm_key_invoke_completion = '<C-Space>'
  let g:ycm_key_list_stop_completion = ['<C-y>']
  let g:ycm_key_detailed_diagnostics = '<leader>yd'
  nnoremap <leader>ff :YcmCompleter FixIt<CR>
  let g:lt_location_list_toggle_map = '<leader>l'

  nnoremap <buffer> <leader>yt :YcmCompleter GetType<CR>
  nnoremap <buffer> <leader>yr :YcmCompleter ClearCompilationFlagCache<CR>

  nnoremap <buffer> <leader>gg :YcmCompleter GoTo<CR>
  nnoremap <buffer> <leader>gf :YcmCompleter GoToDefinition<CR>
  nnoremap <buffer> <leader>gc :YcmCompleter GoToDeclaration<CR>
  nnoremap <buffer> <leader>gi :YcmCompleter GoToInclude<CR>
endfunction
" }}}

function! s:ConfigureAirline() " {{{
  " --------------------------------------------------------------------------
  " options
  let g:airline#extensions#disable_rtp_load = 1
  let g:airline_extensions = ['tabline', 'branch', 'ycm', 'quickfix', 'tagbar', 'gutentags']

  let g:airline_highlighting_cache = 1
  let g:airline_inactive_collapse = 0
  let g:airline_powerline_fonts = 1

  let g:airline#extensions#ctrlp#color_template = 'visual'
  let g:airline#extensions#ctrlp#show_adjacent_modes = 0

  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#show_buffers = 0
  let g:airline#extensions#tabline#show_tabs = 1
  let g:airline#extensions#tabline#show_splits = 0
  let g:airline#extensions#tabline#show_close_button = 0
  let g:airline#extensions#tabline#tab_nr_type = 1
  let g:airline#extensions#tabline#fnamemod = ':t'
  "let g:airline#extensions#tabline#tab_min_count = 2

  " --------------------------------------------------------------------------
  " custom sections
  function! AirlineInit()
    let g:airline_section_b = airline#section#create(['branch'])
    let g:airline_section_c = '%t%m'
    let g:airline_section_z = '%#__accent_bold#%p%% %l/%L%#__restore__#'
  endfunction
  augroup AAInit
    autocmd!
    autocmd User AirlineAfterInit call AirlineInit()
  augroup END

endfunction
" }}}

function! s:ConfigureUltiSnips() " {{{
  let g:UltiSnipsUsePythonVersion = 3
  let g:UltiSnipsEditSplit = 'vertical'
  let g:UltiSnipsSnippetsDir ='/home/vlad/.local/share/nvim/pSnips'
  let g:UltiSnipsSnippetDirectories = ["UltiSnips", "/home/vlad/.local/share/nvim/pSnips"]

  let g:UltiSnipsListSnippets = '<nop>'
  "let g:UltiSnipsExpandTrigger = '<nop>'
  "let g:UltiSnipsJumpForwardTrigger = '<nop>'
  "let g:UltiSnipsJumpBackwardTrigger = '<nop>'
  let g:UltiSnipsExpandTrigger = '<c-j>'
  let g:UltiSnipsJumpForwardTrigger = '<c-j>'
  let g:UltiSnipsJumpBackwardTrigger = '<c-k>'


  "inoremap <c-j> <c-r>=UltiSnips#ExpandSnippetOrJump()<CR>
  "inoremap <c-j> <c-r>=UltiSnips#ExpandSnippetOrJump()<CR>
  inoremap <c-]> <c-r>=UltiSnips#ListSnippets()<CR>

  xnoremap  <c-j> :call UltiSnips#SaveLastVisualSelection()<CR>gvs
  snoremap  <c-j> <Esc>:call UltiSnips#ExpandSnippetOrJump()<CR>

endf
" }}}

function! s:ConfigureOtherPlugins() " {{{

  " --------------------------------------------------------------------------
  " session
  let g:session_directory = '~/.local/share/nvim/sessions/'
  let g:session_default_overwrite = 1
  let g:session_autoload = 'no'
  let g:session_autosave = 'yes'
  let g:session_autosave_periodic = 5
  let g:session_autosave_silent = 1
  let g:session_persist_font = 0
  let g:session_persist_colors = 0
  let g:session_command_aliases = 1

  " --------------------------------------------------------------------------
  " word motion
  let g:wordmotion_mappings = {
        \ 'w'         :'mw',
        \ 'b'         :'mb',
        \ 'e'         :'me',
        \ 'ge'        :'gme',
        \ 'aw'        :'amw',
        \ 'iw'        :'imw',
        \ '<C-R><C-W>':'<C-R><C-W>'
        \ }

  " --------------------------------------------------------------------------
  " comfortable motion
  let g:comfortable_motion_no_default_key_mappings = 1
  let g:comfortable_motion_interval = 1000.0 / 60

  let g:comfortable_motion_friction = 80.0
  let g:comfortable_motion_air_drag = 6.5

  let g:cm_impulse = 4

  nnoremap <silent> <C-e> :call comfortable_motion#flick(g:cm_impulse * winheight(0) *  0.3 )<CR>
  nnoremap <silent> <C-y> :call comfortable_motion#flick(g:cm_impulse * winheight(0) * -0.3 )<CR>
  nnoremap <silent> <C-d> :call comfortable_motion#flick(g:cm_impulse * winheight(0) *    1 )<CR>
  nnoremap <silent> <C-u> :call comfortable_motion#flick(g:cm_impulse * winheight(0) *   -1 )<CR>
  nnoremap <silent> <C-f> :call comfortable_motion#flick(g:cm_impulse * winheight(0) *  1.8 )<CR>
  nnoremap <silent> <C-b> :call comfortable_motion#flick(g:cm_impulse * winheight(0) * -1.8 )<CR>

  " --------------------------------------------------------------------------
  " ctrlsf
  let g:ctrlsf_auto_focus = {"at" : "start"}
  let g:ctrlsf_context = '-A 5 -B 2'
  let g:ctrlsf_default_root = 'project+fw'
  let g:ctrlsf_populate_qflist = 1
  let g:ctrlsf_default_view_mode = 'normal'
  let g:ctrlsf_position = 'left'
  let g:ctrlsf_winsize = '70'
  let g:ctrlsf_indent = 2

  nmap <Leader>i <Plug>CtrlSFCwordExec
  nmap <Leader>e <Plug>CtrlSFCCwordExec
  vmap <Leader>i <Plug>CtrlSFVwordExec

  " --------------------------------------------------------------------------
  " nerd tree

  let g:NERDTreeStatusline = 'Nerdtree'
  nnoremap <silent> <F3> :call NerdtreeToggle()<CR>
  nnoremap <silent> <F15> :call SwitchWindowTo("NERD_tree_*")<CR>
  nnoremap <silent> <leader>n :NERDTree<CR>

  "my theme fix
  augroup SetHighlightFunctionGroup
    autocmd ColorScheme * highlight link NERDTreeDir Directory
  augroup END

  " --------------------------------------------------------------------------
  " git

  "SIGNIFY
  let g:signify_vcs_list = ['git']
  let g:signify_sign_delete = '-'

  nmap <leader>j <plug>(signify-next-hunk)
  nmap <leader>k <plug>(signify-prev-hunk)

  "update without saving
  augroup SignifyRefresh
    autocmd!
    autocmd CursorHold * SignifyRefresh
    autocmd CursorHoldI * SignifyRefresh
    autocmd FocusGained * SignifyRefresh
  augroup END

  " --------------------------------------------------------------------------
  " tags

  " tagbar
  let g:tagbar_width = 30
  let g:tagbar_zoomwidth = 100
  let g:tagbar_hide_nonpublic = 1
  let g:tagbar_silent = 1
  "let g:tagbar_map_showproto = "t"
  let g:tagbar_autoshowtag = 1
  let g:tagbar_autofocus = 0
  nnoremap <silent> <F2> :TagbarToggle<CR>
  nnoremap <silent> <F14> :call SwitchWindowTo("__Tagbar__.*")<CR>

  "gutentags
  let g:gutentags_exclude_project_root = ['/home/vlad']
  let g:gutentags_add_default_project_roots = 0
  let g:gutentags_project_root = ['.git', '.gutMark']
  let g:gutentags_cache_dir = '~/.local/share/nvim/tags'
  let g:gutentags_file_list_command = 'fd --hidden --no-ignore --type file'

  " --------------------------------------------------------------------------
  " ui enchantments

  "devicons
  let g:WebDevIconsNerdTreeGitPluginForceVAlign = 0
  let g:WebDevIconsUnicodeDecorateFolderNodes = 1
  let g:DevIconsEnableFoldersOpenClose = 1
  let g:DevIconsEnableFolderExtensionPatternMatching = 1

  "diminactive
  let g:diminactive_buftype_blacklist = ['nofile', 'nowrite', 'acwrite', 'quickfix']
  let g:diminactive_filetype_blacklist = []

  "startify
  let g:startify_change_to_vcs_root = 1
  let g:startify_update_oldfiles = 1
  let g:startify_fortune_use_unicode = 1
  let g:startify_padding_left = 8
  let g:startify_session_dir = '~/.local/share/nvim/sessions/'
  let g:startify_session_persistence = 1
  let g:startify_session_sort = 1

  let g:startify_bookmarks = [
        \ {'c': '~/.config/nvim/init.vim'   },
        \ {'z': '~/.zshrc'                  },
        \ {'i': '~/.config/i3/config'       },
        \ {'b': '~/.config/i3blocks/config' }
        \ ]

  let g:startify_lists = [
        \ { 'type':'sessions',  'header': ['Sessions']       },
        \ { 'type':'bookmarks', 'header': ['Bookmarks']      },
        \ { 'type':'files',     'header': ['MRU']            },
        \ { 'type':'dir',       'header': ['MRU '. getcwd()] }
        \ ]

  let g:startify_session_before_save = [
        \ 'silent! NERDTreeClose',
        \ 'silent! TagbarClose'
        \ ]

  " --------------------------------------------------------------------------
  " editors

  "exchange
  let g:exchange_no_mappings = 1
  xmap x <Plug>(Exchange)
  nmap cx <Plug>(Exchange)
  nmap cxc <Plug>(ExchangeClear)
  nmap cxl <Plug>(ExchangeLine)

  "undotree
  nnoremap <F5> :UndotreeToggle<CR>
  let g:undotree_CustomUndotreeCmd  = 'topleft vertical 30 new'
  let g:undotree_CustomDiffpanelCmd = 'botright 7 new'
  let g:undotree_RelativeTimestamp = 1
  let g:undotree_ShortIndicators = 1
  let g:undotree_HelpLine = 0

  "sideways
  let b:sideways_skip_syntax = []
  nnoremap <silent> <Leader>, :SidewaysLeft<cr>
  nnoremap <silent> <Leader>. :SidewaysRight<cr>

  omap aa <Plug>SidewaysArgumentTextobjA
  xmap aa <Plug>SidewaysArgumentTextobjA
  omap ia <Plug>SidewaysArgumentTextobjI
  xmap ia <Plug>SidewaysArgumentTextobjI

  "nerdcommenter
  let g:NERDRemoveExtraSpaces = 1
  let g:NERDTrimTrailingWhitespace = 1
  let g:NERDCompactSexyComs = 1
  let g:NERDToggleCheckAllLines = 1

  "easy-aligm
  nmap ga <Plug>(EasyAlign)
  xmap ga <Plug>(EasyAlign)

  nmap gl <Plug>(LiveEasyAlign))
  xmap gl <Plug>(LiveEasyAlign))

  "auto-pairs
  let g:AutoPairsFlyMode = 1
  let g:AutoPairsShortcutJump = '<M-q>'

  "easymotion
  let g:EasyMotion_do_mapping = 0
  let g:EasyMotion_smartcase = 1
  let g:EasyMotion_use_smartsign_us = 1
  let g:EasyMotion_use_upper = 1
  let g:EasyMotion_keys = 'ASDGHKLQWERTYUIOPZXCVBNMFJ;'
  let g:EasyMotion_space_jump_first = 1

  map q <Plug>(easymotion-lineanywhere)

  nmap ss <Plug>(easymotion-overwin-f2)
  omap ss <Plug>(easymotion-s2)
  xmap ss <Plug>(easymotion-s2)
  map sS <Plug>(easymotion-sn)
  map sf <Plug>(easymotion-f)
  map sF <Plug>(easymotion-F)
  map st <Plug>(easymotion-t)
  map sT <Plug>(easymotion-T)
  map sw <Plug>(easymotion-w)
  map sW <Plug>(easymotion-W)
  map sb <Plug>(easymotion-b)
  map sB <Plug>(easymotion-B)
  map se <Plug>(easymotion-e)
  map sE <Plug>(easymotion-E)
  map sg <Plug>(easymotion-ge)
  map sG <Plug>(easymotion-gE)

  map sj <Plug>(easymotion-j)
  map sk <Plug>(easymotion-k)
  map sJ <Plug>(easymotion-eol-j)
  map sK <Plug>(easymotion-eol-k)
  nmap sl <Plug>(easymotion-overwin-line)
  omap sl <Plug>(easymotion-bd-jk)
  xmap sl <Plug>(easymotion-bd-jk)
  nmap so <Plug>(easymotion-overwin-w)
  omap so <Plug>(easymotion-bd-w)
  xmap so <Plug>(easymotion-bd-w)
  nmap sO <Plug>(easymotion-overwin-f)
  omap sO <Plug>(easymotion-bd-f)
  xmap sO <Plug>(easymotion-bd-f)
  map sn <Plug>(easymotion-next)
  map sp <Plug>(easymotion-prev)
  map s/ <Plug>(easymotion-bd-n)
  map sr <Plug>(easymotion-repeat)


  " --------------------------------------------------------------------------
  " other

  "cpp enhanced highlight
  "let g:cpp_class_scope_highlight = 1
  "let g:cpp_member_variable_highlight = 1
  "let g:cpp_class_decl_highlight = 1
  "let g:cpp_experimental_template_highlight = 1
  "let g:cpp_concepts_highlight = 1

  "limelight
  let g:limelight_conceal_guifg = '#446666'
  let g:limelight_paragraph_span = 2
  nnoremap <Leader>fl :Limelight!!<CR>

  "peekaboo
  let g:peekaboo_window = "vert bo 50new"

  "zoomwintab
  nnoremap <Leader>wo :ZoomWinTabToggle<CR>

  "highlighted yank
  let g:highlightedyank_highlight_duration = 200

  "rooter
  let g:rooter_silent_chdir = 1

  "notes
  let g:notes_directories = ['~/.local/share/nvim/notes']
  let g:notes_title_sync = 'rename_file'

endfunction
" }}}

" }}}
" ============================================================================

" ============================================================================
" Util Functions {{{

" ----------------------------------------------------------------------------
" Highlight
function! s:SetHighlight(hlName, hl)
  let l:mode = get(a:hl, 'mode', 'none')
  let l:fg = get(a:hl, 'fg', 'none')
  let l:bg = get(a:hl, 'bg', 'none')
  execute "highlight ".a:hlName." gui=".l:mode." guifg=".l:fg." guibg=".l:bg
  augroup SetHighlightFunctionGroup
    execute "autocmd ColorScheme * highlight ".a:hlName." gui=".l:mode." guifg=".l:fg." guibg=".l:bg
  augroup END
endfunction

" ----------------------------------------------------------------------------
" Comment line
function! AppendCommentLine(placeholder)
  "line width
  let l:text_width = &textwidth> 0? &textwidth : 80

  "widths
  let l:indent_width = indent(line('.'))
  let l:comment_string_width = len(substitute(&commentstring, '%s', '', '',))
  let l:placeholder_width = l:text_width - l:indent_width - l:comment_string_width - len(' ')

  "parts
  let l:indent_part = repeat(' ', l:indent_width)
  let l:placeholder_part = repeat(a:placeholder, l:placeholder_width)

  "line
  let l:line = l:indent_part . substitute(&commentstring, '%s', ' ' . l:placeholder_part, '')
  call append(line('.'), l:line)
endfunction

" ----------------------------------------------------------------------------
" Save/Load window
function! s:CheckNormalWindow(window_number)
  let l:buf = winbufnr(a:window_number)
  if l:buf == -1 | return 0 | endif
  if buflisted(l:buf) == 0 | return 0 | endif
  if empty(getbufvar(l:buf, "&buftype")) != 1 | return 0 | endif
  return 1
endfunction

function! s:GetNormalWindow()
  let l:i = 1
  while(l:i <= winnr('$'))
    if s:CheckNormalWindow(l:i)
      return l:i
    endif
    let l:i = l:i + 1
  endwhile
  return -1
endfun

let t:saved_window = '-1'
function! s:SaveWindow()
  let l:current_window = bufwinnr('%')
  if s:CheckNormalWindow(l:current_window)
    let t:saved_window = l:current_window
  endif
endfunction


function! s:EnableAutoSaveWindow()
  augroup PreviousNormalWindow
    autocmd!
    autocmd WinEnter * call s:SaveWindow()
  augroup END
endfunction
call s:EnableAutoSaveWindow()

function! s:DisableAutoSaveWindow()
  augroup PreviousNormalWindow
    autocmd!
  augroup END
endfunction


function! LoadWindow()
  if s:CheckNormalWindow(t:saved_window)
    execute t:saved_window . "wincmd w"
    return
  endif

  let l:window_number = s:GetNormalWindow()
  if l:window_number != -1
    exec l:window_number . 'wincmd w'
  else
    wincmd w
  endif
endfunction

" ----------------------------------------------------------------------------
" Windows swithing
function! SwitchWindowTo(bufexpr)
  let l:window_number = bufwinnr(a:bufexpr)
  if l:window_number == -1 | return | endif

  let l:current_window = bufwinnr('%')
  if l:current_window == l:window_number
    call LoadWindow()
    return
  endif

  execute l:window_number . "wincmd w"
endfunction

" ----------------------------------------------------------------------------
" Terminal toggle

function! TerminalToggle()
  let l:terminal_buffer = bufnr('Terminal')
  if terminal_buffer == -1
    execute "bot 15new"
    terminal
    setlocal bufhidden=hide
    setlocal nobuflisted
    setlocal winfixwidth
    setlocal winfixheight
    file Terminal
    return
  endif

  let l:terminal_window = bufwinnr(terminal_buffer)
  if terminal_window == -1
    execute "bot 15new +buffer".terminal_buffer
    setlocal winfixwidth
    setlocal winfixheight
  else
    if bufwinnr('%') == l:terminal_window
      call LoadWindow()
    endif
    execute "close ".terminal_window
  endif
endfunction

" ----------------------------------------------------------------------------
" nerdtree toggle

" NERDTreeToggle renumber windows
function! NerdtreeToggle()
  let l:buffer_number = winbufnr(t:saved_window)
  NERDTreeToggle
  let t:saved_window = bufwinnr(l:buffer_number)
  call LoadWindow()
endfunction
" }}}
" ============================================================================

call s:LoadPlugins()
call s:BasicSettings()
call s:ConfigureFZF()
call s:ConfigureYCM()
call s:ConfigureAirline()
call s:ConfigureUltiSnips()
call s:ConfigureOtherPlugins()
call s:ConfigureView()

