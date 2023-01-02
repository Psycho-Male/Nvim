vim.opt.directory="C:/tmp"
vim.opt.backupdir="C:/tmp"
vim.opt.undodir  ="C:/tmp"
if vim.fn.isdirectory("M:/GameMakerProjects") ~= 0 then
    vim.fn.chdir("M:/GameMakerProjects")
    --vim.fn.chdir("M:/GameMakerProjects/BlackRoad")
    --vim.fn.chdir("M:/GameMakerProjects/Dekamara")
    --vim.fn.chdir("M:/GameMakerProjects/Kingdom Lost Reborn")
    --vim.fn.chdir("M:/GameMakerProjects/Kalyzmyr")
else
    vim.fn.chdir("C:/Users/Manko/Documents/GameMakerStudio2")
    --vim.fn.chdir("C:/Users/Manko/Documents/GameMakerStudio2/BlackRoad")
    --vim.fn.chdir("C:/Users/Manko/Documents/GameMakerStudio2/Dekamara")
    --vim.fn.chdir("C:/Users/Manko/Documents/GameMakerStudio2/Kingdom-Lost")
    --vim.fn.chdir("C:/Users/Manko/Documents/GameMakerStudio2/Kingdom Lost Reborn")
    --vim.fn.chdir("C:/Users/Manko/Documents/GameMakerStudio2/Kalyzmyr")
end

vim.opt.filetype=on
--vim.opt.filetype_plugin=on
vim.opt.syntax=on
vim.cmd 'colorscheme  psycho'

vim.o.updatetime=1
vim.o.hidden=true --Don't delete unused buffers?
vim.o.wildmenu=true
vim.o.ignorecase=true --Use case insesitive search, except when using capital letters
vim.o.smartcase=true
vim.o.autoindent=true --If there is no flietype-specific indenting, imitate above line
vim.o.laststatus=2 --Always display status line
vim.o.confirm=true --Instead failing because file is not save, ask if you want to save first
vim.o.expandtab=true
vim.o.softtabstop=4 --disabled tabstop=4
vim.o.tabstop=4
vim.o.background=dark
vim.o.ruler=true
vim.o.hlsearch=true
vim.o.autoindent=true
vim.o.smartindent=true
vim.o.number=true
vim.o.shiftwidth=4
vim.o.cursorline=true
vim.o.cursorcolumn=true
--vim.opt.notitle=true
vim.opt.so=10 --Set cursor offset
vim.opt.incsearch=true
vim.opt.foldminlines=0
--vim.opt.foldmethod=marker
vim.opt.foldmarker='region,endregion'
vim.o.foldclose=all
vim.o.foldopen=all
vim.opt.foldnestmax=1
vim.opt.foldminlines=6
vim.opt.showcmd=true
vim.opt.relativenumber=true
vim.opt.conceallevel=2
vim.opt.ff=dos
vim.opt.ffs=dos

--vim.statusline="%{expand('%:p:h:t')}/%t[%n][%l,%c]%m%r"
--vim.guitablabel="%{GuiTabLabel()}"
--vim.opt.go+=e
vim.opt.guifont='Consolas:h9'
--vim.opt.winaltkeys=no

--vim.opt.guioptions-=m
--vim.opt.guioptions-=T
--vim.opt.guioptions-=r
--vim.opt.guioptions-=L
--vim.opt.t_Co=256 --256 color
