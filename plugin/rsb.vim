" Vim plugin to support rsb
" Author : nishidy@outlook.com

noremap <silent> <Leader>rsb :call Run_rsb()<CR>
 
function! Run_rsb()
    let number = input("Please input the maximum level for depth search: ")
    let @a = system("/usr/local/bin/rsb ".expand("%")." ".line(".")." . ".number." --vim")
    new 
    normal "ap 
	" Delete the first line
	normal gg
	normal dd
    w! /tmp/result.vimrsb
endfunction
 
noremap <silent> <ENTER> :call Open_rsb()<CR>
 
function! Open_rsb()
    if expand("%:e") == "vimrsb"
        let line = getline(".")
        let filenames = split(split(line,"@L")[0]," ")
        let linenums  = split(split(line,"@L")[1]," ")
        let filename = filenames[len(filenames)-1]
        let linenum = linenums[0]
 
        vnew
        exe "e ".filename
        exe "normal ".linenum."gg"
    endif
endfunction

