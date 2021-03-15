let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!\.git/*"'
let $FZF_DEFAULT_OPTS="--ansi --layout reverse --preview 'bat --color always --style=header,grid --line-range :300 {}'"

let g:fzf_preview_window = 'right:48%'
let g:fzf_buffers_jump = 1

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


function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

nnoremap <C-q> <Nop>
let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list') }
