" Pathogen to install bundles for vim
execute pathogen#infect()
syntax on
filetype plugin indent on


" Start Nerd Tree when you enter VIM
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Keep nerd tree open in across tabs
autocmd BufWinEnter * NERDTreeMirror

" Close nerd tree if there are no open files after closing the last one
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Shortcut to open or close Nerd Tree
map <S-z>z :NERDTreeToggle<CR>

" set color scheme for vim editor
" colors xterm16 
colors mango

" set line numbers in the editor
set number

map <F2> :echo 'Current time is ' . strftime('%c')<CR>
 
" The Silver Searcher
"if executable('ag')
" " Use ag over grep
"   set grepprg=ag\ --nogroup\ --nocolor
"
"     " Use ag in CtrlP for listing files. Lightning fast and respects
"     " .gitignore
"       let g:ctrlp_user_command = 'ag %s -l -g ""'
"
" "ag is fast enough that CtrlP doesn't need to cache
"   let g:ctrlp_use_caching = 0
"endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" space bar to move page down
nnoremap <Space> 
" tab to move bunch of lines left or right
vnoremap <Tab> >
vnoremap <S-Tab> <

" formatting different file types - install js beautify from pathogen
autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>

" ctrl a for select all in normal mode 
map <C-a> <esc>ggVG<CR>

" Setting tabstop and autoindent to 2 spaces in vim
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2

" move line up or down
nnoremap mj :m .+1<CR>==
nnoremap mk :m .-2<CR>==
" To enclose in single or double quoates
nnoremap q" ciw""<Esc>P
nnoremap q' ciw''<Esc>P

" copy to and from clipboard 
vmap cy :w! /tmp/vitmp<CR>                                                                   
nmap cp :r! cat /tmp/vitmp<CR>

" format json content
nmap fj :<C-U>call FormatJSON(v:count)<CR>

function FormatJSON(...) 
	let code="\"
				\ var i = process.stdin, d = '';
				\ i.resume();
				\ i.setEncoding('utf8');
				\ i.on('data', function(data) { d += data; });
				\ i.on('end', function() {
				\     console.log(JSON.stringify(JSON.parse(d), null, 
				\ " . (a:0 ? a:1 ? a:1 : 2 : 2) . "));
				\ });\""
	execute "%! node -e " . code 
endfunction

" Ctrl P settings
let g:ctrlp_by_filename = 1
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_user_command = ['.git', 'git -c %s ls-files --exclude-standard --others --cached' ]
let g:ctrlp_use_caching = 1
let g:ctrlp_by_filename = "true"
set runtimepath^=~/.vim/bundle/ctrlp.vim

let g:nerdtree_tabs_autoclose=0
" *********  vim help **********

" i.e iab msf Microsoft  - will convert msf to Microsoft when you type in
" insert mode

" go to a tab
" 1gt - go to first tab, 2gt - go to second tab

" adding file in nerdtree - press m
" navigate between split screens in nerd - press ctrl w + (h,j,k,l) to
" navigate left, down, up, right
" to close a split screen press ctrl wq

" to record templates press q and the key, to play the recording press @ and
" the key
