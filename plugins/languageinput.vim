function! EnterPrint()
    if &filetype == "java"
        return "System.out.println("
    elseif &filetype == "c"
        return "printf("
    elseif &filetype == "cpp"
        return "cout << "
    elseif &filetype == "python"
        return "print("
    else
    endif
endfunction
