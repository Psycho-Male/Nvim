if vim.fn.isdirectory("M:/GameMakerProjects") ~= 0 then
    vim.opt.directory="M:/Programs/Vim/tmp"
    vim.opt.backupdir="M:/Programs/Vim/tmp"
    vim.opt.undodir  ="M:/Programs/Vim/tmp"
    vim.fn.chdir("M:/GameMakerProjects")
    --vim.fn.chdir("M:/GameMakerProjects/BlackRoad")
    --vim.fn.chdir("M:/GameMakerProjects/Dekamara")
    --vim.fn.chdir("M:/GameMakerProjects/Kingdom Lost Reborn")
    --vim.fn.chdir("M:/GameMakerProjects/Kalyzmyr")
else
    vim.opt.directory="C:/tmp"
    vim.opt.backupdir="C:/tmp"
    vim.opt.undodir  ="C:/tmp"
    vim.fn.chdir("C:/Users/Manko/Documents/GameMakerStudio2")
    --vim.fn.chdir("C:/Users/Manko/Documents/GameMakerStudio2/BlackRoad")
    --vim.fn.chdir("C:/Users/Manko/Documents/GameMakerStudio2/Dekamara")
    --vim.fn.chdir("C:/Users/Manko/Documents/GameMakerStudio2/Kingdom-Lost")
    --vim.fn.chdir("C:/Users/Manko/Documents/GameMakerStudio2/Kingdom Lost Reborn")
    --vim.fn.chdir("C:/Users/Manko/Documents/GameMakerStudio2/Kalyzmyr")
end

vim.o.filetype on
vim.o.filetype plugin on
vim.o.syntax on
vim.o.colorscheme psycho

vim.o.set updatetime=1
vim.o.set hidden --Don't delete unused buffers?
vim.o.set wildmenu
vim.o.set ignorecase --Use case insesitive search, except when using capital letters
vim.o.set smartcase
vim.o.set autoindent --If there is no flietype-specific indenting, imitate above line
vim.o.set laststatus=2 --Always display status line
vim.o.set confirm --Instead failing because file is not save, ask if you want to save first
vim.o.set expandtab
vim.o.set softtabstop=4 --disabled tabstop=4
vim.o.set tabstop=4
vim.o.set background=dark
vim.o.set ruler
vim.o.set hlsearch
vim.o.set autoindent
vim.o.set smartindent
vim.o.set number
vim.o.set shiftwidth=4
vim.o.set cursorline
vim.o.set cursorcolumn
vim.o.set notitle
vim.o.set so=10 --Set cursor offset
vim.o.set incsearch
vim.o.set foldminlines=0
vim.o.set foldmethod=marker
vim.o.set foldmarker=region,endregion
vim.o.set foldclose=all
vim.o.set foldopen=all
vim.o.set foldnestmax=1
vim.o.set showcmd
vim.o.set relativenumber
vim.o.set conceallevel=2
vim.o.set ff=dos
vim.o.set ffs=dos

vim.o.statusline=%{expand('%:p:h:t')}/%t[%n][%l,%c]%m%r
--vim.o.guitablabel=%{GuiTabLabel()}
vim.o.set go+=e
vim.o.set guifont=Consolas:h9
vim.o.set winaltkeys=no
au GUIEnter * simalt ~x --Start gvim in fullscreen mode
au BufRead * set autorea--

vim.o.set guioptions-=m
vim.o.set guioptions-=T
vim.o.set guioptions-=r
vim.o.set guioptions-=L
vim.o.set t_Co=256 "256 color
