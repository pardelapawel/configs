colorscheme koehler "readable with a dark terminal

set laststatus=2 "always display status line
set statusline="%f%m%r%h%w [%Y] [0x%02.2B]%< %F%=%4v,%4l %3p%% of %L"
set re=1 " for faster ruby highlighting (it was unbearably slow
set cursorline " underscore the whole line
set sc "show intereting stuff (number of lines in visual, etc)
set number "numbers on the left
set relativenumber "waaay more convinient (shows numbers relative to my line)

set showcmd " show me what i'm typing (in the last line

" tabs, spaces, indentations
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4
set clipboard=unnamedplus

" tagbar for tags!!
nnoremap <silent> <Leader>b :TagbarToggle<CR>

" i'm doing these typow waaaay too often
:command WQ wq
:command Wq wq
:command W w
:command Q qa





"search for visually selected text
vnoremap // y/<C-R>"<CR>

"easier moving between split
nmap <c-h> <c-w>h<c-w><Bar>
nmap <c-l> <c-w>l<c-w><Bar>
nmap <c-j> <c-w>j<c-w><Bar>
nmap <c-k> <c-w>k<c-w><Bar>

"New split on right or below
set splitbelow
set splitright

"Make ; free to assign (don't wait ages for a key press)
nnoremap , ;

" faster search&destroy
noremap ;; :%s:::g<Left><Left><Left>
noremap ;' :%s:::gc<Left><Left><Left><Left>

"run PathoGen
execute pathogen#infect()

runtime plugin/ranger.vim

if &diff
    set wrap
    set diffopt+=iwhite
    set diffexpr=""
    set noreadonly
else
    "unset adding new line at the end of a file
    "set binary % this NO expands tab!!!! why? "https://github.com/avelino/vim-bootstrap/issues/193
    set noeol

    "Closing NERDTree if the last window
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

    "Closing quickfix if the last window
    autocmd bufenter * if (winnr("$") == 1 && &buftype=="quickfix") | q | endif
    "Toggling NERDTree
    map <C-m> :NERDTreeToggle<CR>

    "Create file templates
    "au BufNewFile * :  exec ":0r ~/.vim/templates/".&ft
    au BufNewFile *.py 0r ~/.vim/templates/python
    au BufNewFile *.sh 0r ~/.vim/templates/bash
    au BufNewFile *.pl 0r ~/.vim/templates/perl


    "Syntax highlighting
    syntax on
    filetype plugin indent on
    highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
    match ExtraWhitespace /\s\+\%#\@<!$/
    set listchars=nbsp:¬,eol:$,tab:>-,trail:~,extends:>,precedes:<
    set list

    "Linters
    autocmd BufWritePost *.py call Flake8()
    autocmd BufWritePost *.hs GhcModCheckAndLintAsync
    let g:ghcmod_hlint_options = ['--ignore=Use camelCase']

    "some not-vim standard filetypes
    au BufRead,BufNewFile *.grm set filetype=thraxgrm
    au BufRead,BufNewFile *.jsgf set filetype=jsgf
    au BufRead,BufNewFile *.tpg set filetype=tpg
    au BufRead,BufNewFile *.psv set filetype=psv


    " 101st column is magenta if there is a char there (no more than 100 chars
    autocmd BufNewFile,BufRead *.py highlight ColorColumn ctermbg=magenta
    autocmd BufNewFile,BufRead *.py call matchadd('ColorColumn', '\%100v', 100)


    "jump to the last position when reopening a file
    if has("autocmd")
      au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal! g'\"" | endif
    endif

    "check english spelling
    :command Enspell setlocal spell spelllang=en_us
endif