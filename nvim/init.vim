language en_US

call plug#begin('~/.config/nvim/plugged')
  " Neosnippet
  Plug 'Shougo/neosnippet.vim'
  Plug 'Shougo/neosnippet-snippets'

  " Dark monochrome theme
  Plug 'fxn/vim-monochrome'

  " NERDTree directory tree
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

  " File searching
  Plug 'kien/ctrlp.vim'

  " Syntax
  Plug 'sheerun/vim-polyglot'

  " Fzf
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  " TypeScript
  " Plug 'HerringtonDarkholme/yats.vim'
  " Plug 'mhartington/nvim-typescript', {'do': './install.sh'}

  " Code Autocomplete
  " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  " Plug 'wokalski/autocomplete-flow'

  " For Denite features
  Plug 'Shougo/denite.nvim'

  " Coc
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" TypeScript configuration
let g:typescript_indent_disable = 1
let g:nvim_typescript#default_mappings = 1

" Deoplete configuration
set completeopt-=preview
let g:deoplete#enable_at_startup = 1

" Theme Configuration
let g:monochrome_italic_comments = 1
colorscheme monochrome

let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1
:hi NerdTreeFile guifg=#aaaaaa ctermfg=252
:hi NERDTreeExecFile guifg=#aaaaaa ctermfg=252
:hi Directory guifg=15 ctermfg=15

" Relative number line on
:set relativenumber
:set rnu

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

set number
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set nowrap

" Color of cursor
:hi MatchParen guifg=226 ctermfg=226 ctermbg=232 guibg=232

" Resizke key maps
map <C-l> :vertical resize +10<CR>
map <C-h> :vertical resize -10<CR>
map <C-j> :res +10<CR>
map <C-k> :res -10<CR>

" Hidden symbols
:set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

" Remap esc key for change modes
:imap jj <Esc>

" FZF key maps
map <C-f> :Files<CR>
map <C-g> :GGrep<CR>

" Coc key maps
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

imap <expr> <silent> <Tab> neosnippet#expandable_or_jumpable() ?
  \ "<Plug>(neosnippet_expand_or_jump)" :
  \ neocomplete#mappings#close_popup()."\<CR>"

augroup ProjectDrawer
  autocmd!
augroup END
