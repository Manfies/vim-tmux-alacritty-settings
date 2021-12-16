language en_US
let theme = "dark"

call plug#begin()
  " Autocomplite code
  if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'wokalski/autocomplete-flow'
    " You will also need the following for function argument completion:
    Plug 'Shougo/neosnippet'
    Plug 'Shougo/neosnippet-snippets'
  else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
  endif
  let g:deoplete#enable_at_startup = 1
  " Grayscale color dark theme
  Plug 'fxn/vim-monochrome'
  " Grayscale color light theme
  Plug 'evanram/nodistract'
  " NERDTree directory tree
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  " File searching
  Plug 'kien/ctrlp.vim'
  " Syntax
  Plug 'sheerun/vim-polyglot'
  " Fzf
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
call plug#end()

" Start NERDTree for default
autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>

" Set hotkey for file search & ignore system files & directory
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip 

" Search in file content
command! -bang -nargs=* GGrep
  \ call fzf#vim#ag(
  \   <q-args>,
  \   {'options': '--delimiter : --nth 4..'},
  \   <bang>0
  \ )

" Neosnippet maps
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

let g:UltiSnipsExpandTrigger='<tab>'
" shortcut to go to next position
let g:UltiSnipsJumpForwardTrigger='<c-j>'
" shortcut to go to previous position
let g:UltiSnipsJumpBackwardTrigger='<c-k>'

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

set number
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set nowrap

if theme == 'dark'
  " Settings for monochrome dark theme color sheme
  let g:monochrome_italic_comments = 1
  colorscheme monochrome
  " Windows borders
  hi StatusLine ctermfg=231 ctermbg=236 guibg=LightGrey
  hi StatusLineNC ctermfg=231 ctermbg=236 guibg=LightGrey
  hi VertSplit ctermfg=15 ctermbg=15 guibg=LightGrey
  " Deoplete customization
  :hi Pmenu ctermbg=254 ctermfg=16 guibg=#cccccc
  " NERDTree customization
  let NERDTreeMinimalUI = 1
  let NERDTreeShowHidden = 1
  :hi NerdTreeFile guifg=#aaaaaa ctermfg=252
  :hi NERDTreeExecFile guifg=#aaaaaa ctermfg=252
  :hi Directory guifg=15 ctermfg=15
endif
if theme == 'light'
  " Settings for monochrome light theme color sheme
  colorscheme nodistract
  " Windows borders
  hi StatusLine ctermfg=231 ctermbg=236 guibg=LightGrey
  hi StatusLineNC ctermfg=231 ctermbg=236 guibg=LightGrey
  hi VertSplit ctermfg=236 ctermbg=236 guibg=LightGrey
  " Deoplete customization
  :hi Pmenu ctermbg=254 guibg=#cccccc
  " NERDTree customization
  let NERDTreeMinimalUI = 1
  let NERDTreeShowHidden = 1
  :hi NerdTreeFile guifg=#777777 ctermfg=102
  :hi NERDTreeExecFile guifg=#777777 ctermfg=102
  :hi Directory guifg=236 ctermfg=236
endif

" Color of cursor
:hi MatchParen guifg=10 ctermfg=10

" Relative number line on
:set relativenumber
:set rnu

" Hidden symbols
:set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

" Remap esc key for change modes
:imap jj <Esc>

" FZF key maps
map <C-f> :Files<CR>
map <C-g> :GGrep<CR>
map <C-l> :vertical resize +10<CR>
map <C-h> :vertical resize -10<CR>
map <C-j> :res +10<CR>
map <C-k> :res -10<CR>

augroup ProjectDrawer
  autocmd!
augroup END
