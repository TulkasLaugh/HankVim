# HankVim

My personal VIM settings I intend to make portable and be able to update and sync anywhere. 
** Designed for hardcore VIM users who can touch type at 100+wpm **

4 major philosophies I stick to in making modifications:
1.) 1 stroke movement, 1 stroke execution
2.) Alternatives that allow you to stay in the homerow will always be preferred
3.) Make sure Caps-Lock is mapped to be Esc when tapped and Ctrl when held
4.) Good ergonomics is everything

Good resource on changing your CAPSLOCK to be more useful for VIM. 

http://www.economyofeffort.com/2014/08/11/beyond-ctrl-remap-make-that-caps-lock-key-useful/

Remapping Caps Lock on Windows using this tool:

https://github.com/randyrants/sharpkeys

Useful resource on how to use vim for merge conflicts in git (replace vimdiff with gvimdiff if using GVIM):

http://www.rosipov.com/blog/use-vimdiff-as-git-mergetool/

Note: Might have to modify gvim path if on Windows (replace which mvimdiff with path of your gvim.exe)
(git config --global difftool.gvimdiff.path `which mvimdiff`; git config --global mergetool.gvimdiff.path `which mvimdiff`)
