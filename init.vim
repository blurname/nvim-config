set termguicolors
lua require('plugins')
lua require('feline-config')
lua require('colorizer').setup()
lua require('nightfox-config')
" ===
" === Basic Mappings
" ===
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   basic                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = " "
" noremap ; :
set exrc
set nobackup
set noswapfile
set secure
set number
set relativenumber
" set formatoptions
set cursorline
set ignorecase
set smartcase
set wrap
set showcmd
set wildmenu
set tabstop=2
set shiftwidth=2
set softtabstop=2
set foldenable
set autoindent
set ttimeoutlen=0
set modifiable
set signcolumn=yes:1
set pumblend=8
set cole=1
filetype plugin on
" set scrolloff

" set notimeout

" Save & quit
noremap <LEADER>w :w<CR>
noremap s <nop>
noremap <LEADER>re :source $MYVIMRC<CR>
" Open the vimrc file anytime
noremap <LEADER>rc :e $MYVIMRC<CR>
" let a = stdpath("config")

noremap <LEADER>rv :e ~/.config/nvim/lua/plugins.lua<CR>

" move key
noremap W 5w
noremap B 5b
noremap H 0
noremap L $
" Copy to system clipboard
vnoremap <LEADER>y "+y
noremap <LEADER>p "+p


" Resize splits with arrow keys
noremap <down> :res -5<CR>
noremap <up> :res +5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>

" ===
" === Use <space> + new arrow keys for moving the cursor around windows
" ===
noremap <A-j> <C-w>j
noremap <A-k> <C-w>k
noremap <A-h> <C-w>h
noremap <A-l> <C-w>l

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sj :set splitbelow<CR>:split<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sl :set splitright<CR>:vsplit<CR>
" Press <SPACE> + q to close the window below the current window
noremap <LEADER>q <C-w>:q<CR>


" ===
" === Tab management
" ===
" Create a new tab with tl

noremap tl :tabe<CR>
" Move around tabs with tn and ti
noremap tk :-tabnext<CR>
noremap tj :+tabnext<CR>
" Move the tabs with tmn and tmi
" noremap tmn :-tabmove<CR>
" noremap tmi :+tabmove<CR>

" Search
noremap <LEADER><CR> :nohlsearch<CR>

" ===
" === terminalHelp
" ===
let g:terminal_shell = 'elvish'

let g:closetag_filetypes = 'html,jsx,tsx'
let g:closetag_xhtml_filetypes = 'html,jsx,tsx'

" ===
" === coc.nvim
" ===
let g:coc_global_extensions = ['coc-json',
			\ 'coc-vimlsp',
			\ 'coc-html',
			\ 'coc-css',
			\ 'coc-tsserver',
			\ 'coc-explorer',
			\ 'coc-rust-analyzer',
			\ 'coc-yank',
			\ 'coc-emmet',
			\ 'coc-snippets',
			\ 'coc-pyright',
			\ 'coc-prettier',
			\'coc-sumneko-lua']
let g:coc_default_semantic_highlight_groups = 0

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	elseif (coc#rpc#ready())
		call CocActionAsync('doHover')
	else
		execute '!' . &keywordprg . " " . expand('<cword>')
	endif
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

nnoremap <silent> K :call <SID>show_documentation()<CR>
" nnoremap <c-p> <c-^>

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent><nowait><expr> <A-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <A-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <A-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <A-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <A-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <A-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)


" Find symbol of current document.
nnoremap <silent><nowait> <space>l  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Highlight the symbol and its references when holding the cursor.
"autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

nmap <silent> g[ <Plug>(coc-diagnostic-prev)
nmap <silent> g] <Plug>(coc-diagnostic-next)

" nmap <leader>qf  <Plug>(coc-fix-current)
nmap  <leader>ac <plug>(coc-codeaction)

" Show all diagnostics.

" filetree

noremap  <leader>v  :CocCommand explorer<CR>

"nnoremap <C-n> <cmd>RnvimrToggle<cr>
"
noremap <leader>fi :Prettier<CR>
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Useful commands
nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>

" ===
" === asyncrun ===
" ===

"noremap <silent><f5> :AsyncTask file-build<cr>
"noremap <silent><f6> :AsyncTask file-run<cr>
"noremap <silent><f7> :AsyncTask project-build<cr>
"noremap <silent><f10> :AsyncTask project-run<cr>
"let g:asynctasks_term_pos = 'bottom'
"let g:asyncrun_open = 3


"""""""""""""
"  Leaderf  "
"""""""""""""


let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_ShortcutF = "<leader>fl"
let g:Lf_fuzzyEngine_C = 1
let g:Lf_StlColorscheme = 'popup'
let g:Lf_PopupColorscheme = 'default'
let g:Lf_CursorBlink = 0
" let g:Lf_WorkingDirectory = finddir('.git', '.;')

let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WildIgnore = {
			\ 'dir': ['.svn','.git','.hg','node_modules'],
			\ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
			\}

noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>

noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>

noremap <leader>f; :Leaderf cmdHistory<CR>
noremap <leader>fr :<C-U>Leaderf! rg --recall<CR>

noremap <LEADER>fh :LeaderfHelp<CR>


"""""""""""""""""""
"  AutoSave.nvim  "
"""""""""""""""""""

lua << EOF
local autosave = require("autosave")
autosave.setup(
{
enabled = true,
execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),

events = {"InsertLeave"},
events = ("TextChanged"),
conditions = {
	exists = true,
	filetype_is_not = {},
	modifiable = true
	},
write_all_buffers = false,
on_off_commands = true,
clean_command_line_interval = 2500
}
)
EOF
""""""""""""""""""
"  nvim-hlslens  "
""""""""""""""""""
noremap <silent> n <Cmd>execute('normal! ' . v:count1 . 'n')<CR>
			\<Cmd>lua require('hlslens').start()<CR>
noremap <silent> N <Cmd>execute('normal! ' . v:count1 . 'N')<CR>
			\<Cmd>lua require('hlslens').start()<CR>
"noremap * *<Cmd>lua require('hlslens').start()<CR>
"noremap # #<Cmd>lua require('hlslens').start()<CR>
"noremap g* g*<Cmd>lua require('hlslens').start()<CR>
"noremap g# g#<Cmd>lua require('hlslens').start()<CR>

map *  <Plug>(asterisk-z*)<Cmd>lua require('hlslens').start()<CR>
map #  <Plug>(asterisk-z#)<Cmd>lua require('hlslens').start()<CR>
map g* <Plug>(asterisk-gz*)<Cmd>lua require('hlslens').start()<CR>
map g# <Plug>(asterisk-gz#)<Cmd>lua require('hlslens').start()<CR>
aug VMlens
	au!
	au User visual_multi_start lua require('vmlens').start()
	au User visual_multi_exit lua require('vmlens').exit()
aug END

""""""""""""""""
"  treesitter  "
"""""""""""""""""
lua <<EOF
require'nvim-treesitter.configs'.setup {
ensure_installed = {"rust","javascript","typescript"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
highlight = {
enable = true,              -- false will disable the whole extension
-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
-- Using this option may slow down your editor, and you may see some duplicate highlights.
additional_vim_regex_highlighting = false,
},
}
EOF

""""""""""""""
"  nvim-bqf  "
""""""""""""""
let g:coc_enable_locationlist = 0
aug Coc
	au!
	au User CocLocationsChange ++nested call Coc_qf_jump2loc(g:coc_jump_locations)
aug END
aug Coc
	au!
	au User CocLocationsChange ++nested call Coc_qf_jump2loc(g:coc_jump_locations)
aug END

nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> <leader>d <Cmd>call Coc_qf_diagnostic()<CR>

function! Coc_qf_diagnostic() abort
	let diagnostic_list = CocAction('diagnosticList')
	let items = []
	let loc_ranges = []
	for d in diagnostic_list
		let text = printf('[%s%s] %s', (empty(d.source) ? 'coc.nvim' : d.source),
					\ (d.code ? ' ' . d.code : ''), split(d.message, '\n')[0])
		let item = {'filename': d.file, 'lnum': d.lnum, 'col': d.col, 'text': text, 'type':
					\ d.severity[0]}
		call add(loc_ranges, d.location.range)
		call add(items, item)
	endfor
	call setqflist([], ' ', {'title': 'CocDiagnosticList', 'items': items,
				\ 'context': {'bqf': {'lsp_ranges_hl': loc_ranges}}})
	botright copen
endfunction

function! Coc_qf_jump2loc(locs) abort
	let loc_ranges = map(deepcopy(a:locs), 'v:val.range')
	call setloclist(0, [], ' ', {'title': 'CocLocationList', 'items': a:locs,
				\ 'context': {'bqf': {'lsp_ranges_hl': loc_ranges}}})
	let winid = getloclist(0, {'winid': 0}).winid
	if winid == 0
		aboveleft lwindow
	else
		call win_gotoid(winid)
	endif
endfunction

"NERDCommenter
let g:NERDCreateDefaultMappings = 0
"map <LEADER>cl <plug>NERDCommenterToggle
"map <c-_> instead of <c-/>
map <c-_> <plug>NERDCommenterToggle

" Enable alignment globally
let g:neoformat_basic_format_align = 1

" Enable tab to spaces conversion globally
"let g:neoformat_basic_format_retab = 1

let g:neoformat_basic_format_trim = 1

" Enable trimmming of trailing whitespace globally
"let g:neoformat_javascript_prettier = {
			"\ 'exe':'prettier',
			"\ 'args':['--no-semi']
			"\}
let g:neoformat_typescript_prettier = {
			\ 'exe':'prettier',
			\ 'args': ['--parser', 'typescript','--no-semi','--single-quote'],
			\}
			"\ 'args':['--no-semi']
			"\ 'stdin': 1

"let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_enabled_typescript = ['prettier']
let g:neoformat_enabled_json = ['prettier']
let g:neoformat_enabled_yaml = ['prettier']

let g:neoformat_enabled_rust = ['rustfmt']
"let g:neoformat_verbose = 1 "
noremap <leader>gg :G<CR>
noremap <leader>gl :diffget //3<CR>
noremap <leader>gh :diffget //2<CR>
