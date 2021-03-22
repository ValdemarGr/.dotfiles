let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!\.git/*"'
let $FZF_DEFAULT_OPTS="--ansi --layout reverse --preview 'bat --color always --style=header,grid --line-range :300 {}' --bind alt-a:select-all,alt-d:deselect-all"

let g:fzf_preview_window = 'right:48%'
let g:fzf_buffers_jump = 1
let g:fzf_layout = { 'window': 'enew' }

let g:coc_fzf_preview = 'right:0%'
let g:coc_fzf_opts = []

command! -bang -nargs=* RG
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

function s:AutoEnrich (F, bang)
    function! s:WithDir (dir) closure
        silent exec '!autojump -a ' . a:dir
        call a:F(a:dir, a:bang)
    endfunction
    return function('<SID>WithDir')
endfunction


let g:autojump_listing = 'autojump -s | sort -k1gr | awk ''$1 ~ /[0-9]:/ && $2 ~ /^\// { for (i=2; i<=NF; i++) { print $(i) } }'''
function s:AutoFZFFact (next, bang)
    call fzf#run(fzf#wrap({'source': g:autojump_listing, 'sink': s:AutoEnrich(a:next, a:bang), 'options': ['--no-preview']}, a:bang))
endfunction

function s:OpenFilesDir(dir, bang)
    call fzf#vim#files(a:dir, a:bang)
endfunction

function s:CdDir(dir, bang)
    exec 'cd ' . a:dir
endfunction

let g:watchDir = []
function s:AddWatchDir (bang)
    let l:extra = g:autojump_listing
    if len(g:watchDir) > 0
        let l:extra .= " | grep -Fv"
        for without in g:watchDir
            let l:extra .= ' -e ' . without
        endfor
    endif
    function! s:AddDir (item)
        call add(g:watchDir, a:item)
    endfunction
    call fzf#run(fzf#wrap({'source': l:extra, 'sink': function('<SID>AddDir'), 'options': ["--no-preview"]}), a:bang)
endfunction

function s:DelWatchDir (bang)
    function! s:RemItem (item)
        call filter(g:watchDir, 'v:val !~ "' . a:item . '"')
    endfunction
    call fzf#run(fzf#wrap({'source': g:watchDir, 'sink': function('<SID>RemItem'), 'options': ["--no-preview"]}), a:bang)
endfunction

function s:FilesIn (bang) 
    let l:concatter = ''
    for item in g:watchDir
        let l:concatter .= ' ' . item
    endfor
    call fzf#run(fzf#wrap({'source': 'find ' . l:concatter, 'sink': 'e ', 'options': ["--no-preview"]}), a:bang)
endfunction

command! -bang AutoFZF
    \ call s:AutoFZFFact(function('<SID>OpenFilesDir'), <bang>0)

command! -bang AutoFZFCD
    \ call s:AutoFZFFact(function('<SID>CdDir'), <bang>0)

command! -bang AutoAddDir
    \ call s:AddWatchDir(<bang>0)

"command! -bang DelWatchDir
    "\ call s:DelWatchDir(<bang>0)

"command! -bang WatchFiles
    "\ call s:FilesIn(<bang>0)


function! s:BuildQuickfixList(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

nnoremap <C-q> <Nop>
let g:fzf_action = {
  \ 'ctrl-q': function('<SID>BuildQuickfixList') }



" {
"   'file': '/home/valde/Git/ui-sandbox/src/store/HistoryStore.ts', 'lnum': 6, 'col': 33, 
"   'location': {'uri': 'file:///home/valde/Git/ui-sandbox/src/store/HistoryStore.ts', 
"   'range': {'end': {'character': 48, 'line': 5}, 'start': {'character': 32, 'line': 5}}}, 'level': 1, 
"   'message': '[tsserver 2307] Cannot find module ''./PendingState'' or its corresponding type declarations.', 'severity': 'Error'
" }

"function! s:format_diag (item) 
  "if has_key(a:item, 'file')
    "let file = substitute(a:item.file, getcwd() . "/" , "", "")
    "let msg = substitute(a:item.message, "\n", " ", "g")
    "let hl = get({'Error': 'cocerrorsign', 'Warning': 'cocwarningsign',
          "\ 'Information': 'cocinfosign', 'Hint': 'cochintsign'}, a:item.severity, '')
    
  "endif
"endfunction

"function! s:get_diag (bang)
  "let diags = CocAction('diagnosticList')
  "call fzf#run(fzf#wrap({
    "\  'source': l:diags,
    "\ 'sink': 'e'
  "\}), a:bang)
"endfunction

"command! -bang DiagFZF
  "\ call s:get_diag(<bang>0)
