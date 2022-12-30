--New windo command
vim.api.nvim_create_user_command(
"Windo",
function(opts)
    vim.o.let s:currentWindow = winnr()
    execute("windo <args>")
    execute(s:currentWindow . "wincmd w")
end,
{nargs=+}
)
--Syndo
vim.api.nvim_create_user_command(
"Syndo",
function(opts)
    local s:currentWindow = winnr()
    execute("tabdo windo <args>")
    execute(s:currentWindow . "wincmd w")
end,
{nargs=+}
)

vim.api.nvim_create_user_command("Vrep"    ,"Ack! -G .gml /<args>/ | vert copen")
vim.api.nvim_create_user_command("Vrepjson","Ack! -G .json /<args>/ | vert copen")
vim.api.nvim_create_user_command("Vrepyy"  ,"Ack! -G .yy /<args>/ | vert copen")

DeleteHiddenBuffers=function()
    local tpbl=[]
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1') do
        silent execute 'bwipeout' buf
    end
end


if executable('ag') then
  let g:ackprg = 'ag --vimgrep'
end

SetLog=function(name)
    sp
    if vim.api.isdirectory("C:/Users/Psy") then
        local path="C:/Users/Psy/Appdata/Roaming/"+name+"/output.log"
    else
        local path="C:/Users/Manko/Appdata/Roaming/"+name+"/output.log"
    end
    view path
    vim.o.setlocal autoread
    vim.o.setlocal concealcursor=n
    vim.o.setlocal nocuc
    vim.o.setlocal nocul
    vim.o.setlocal winfixwidth
    resize20
    --set au CursorHold * checktime | call feedkeys("lh")
    --let timer=timer_start(500,'UpdateFile',{'repeat':-1})
    --call timer_start(500,function('s:checktime'),{'repeat':-1})
end
SetLog1=function(){
    call SetLog("Kingdom_Lost_Reborn")
}

Term=function()
    split|resize20|term
end
UpdateFile=function()
    $
end
Checktime=function(timer_id)
    checktime
end
