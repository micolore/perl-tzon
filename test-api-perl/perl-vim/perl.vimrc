" http://blog.sina.com.cn/s/blog_4d3a41f40100jszu.html
" qyliu's vimrc file
" version 3.0
" 2003-2-19

"**************************
" copied from vimrc_example
"**************************

" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"             for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"           for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set autoindent          " always set autoindenting on
if has("vms")
  set nobackup          " do not keep a backup file, use versions instead
else
  set backup            " keep a backup file
endif
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set incsearch           " do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
  
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

endif " has("autocmd")

"*****************************************
" qyliu's personal settings (perl setting)
"*****************************************
if has('autocmd') 
        " when event "set filetype" occurs (see :help filetype)
        autocmd Filetype perl call PerlDetected()
endif

"map some useful hotkeys
" map=Normal mode+Visual mode+Operator-pending mode
"<F12> to switch between windows
map <F12> <C-W>w
"<F2> to increase window width, <F3> to decrease
map <F2> <C-W>>
map <F3> <C-W><
"<F10> to increase window height, <F11> to decrease 
map <F10> <C-W>+
map <F11> <C-W>-

"----------mapping my insert commands-----------
"----------i called them ";-command" 'cause you've the least hesitation
" between you type the ";" and the following <Space> or <CR>

"<;a> for Auto-completion using dictionary
imap ;a <C-X><C-K>
"then use <C-N> to match the next keywords, and <C-P> the previous one
" map!=imap+cmap (i=insert mode, c=:command mode)
" a) imap <Space><Space> xx also can work, but not good
" b) i cannot map <M-x> or <M-Space>, why?
" c) Ctrl-Space <=> Ctrl-@

" <F5> ================= set filetype to perl (Filetype event occurs)
" To see what is "set fo=", exec :help formatoptions
" This line of commands first disable to auto insert "comment leader (#)", then write some usual sentences for working.
" use ":set comments" command to see the comment-leaders for such file
map <F5> :set fo-=r<CR>i#!/usr/bin/perl -w<CR><CR>#$Id$<CR><CR><Esc>:set filetype=perl<CR>:set fo+=r<CR>

func PerlDetected()
        "<F4> == see perldoc for current word under cursor
        map <F4> :call PerlDoc(expand("<cword>"))<CR>
        
        "<F7> for perl debugging
        map <F7> :w<CR>:!perl -wd "%"<CR>
        "<F8> for perl syntax checking (autosave first)
        map <F8> :w<CR>:!perl -wc "%"<CR>
        "<F9> to run by perl (autosave first) "",'' are both ok
        map <F9> :w<CR>:!perl '%'<CR>
        " set dictionary for perl keywords completion
        set dictionary=$HOME/.perl.dictionary
        
        "set autoindent depth
        set shiftwidth=4
        "set tabstop
        set tabstop=4
        
        "when write buffer, set it executable
        "autocmd does not need the <CR>!!!
        autocmd BufUnload * call SetPerlExecutable() 
endfunc

func SetPerlExecutable()
        if synIDattr(synID(1,1,1),"name")=="perlSharpBang" 
                exec ':!(if [ \! -x '.expand("<afile>").' ]; then chmod +x '.expand("<afile>").'; fi)'
        endif
endfunc 

func PerlDoc(keyword)
        if a:keyword=~"::"
                "module name;
                exec ':!perldoc '.a:keyword
        elseif a:keyword=~"^perl"
                "perl pod
                exec ':!perldoc '.a:keyword
        else
                "perl function
                exec ':!perldoc -f '.a:keyword
        endif
endfunc

--
