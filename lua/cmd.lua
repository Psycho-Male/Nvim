--New windo command
function Windo(opts)
    local currentWindow = winnr()
    execute("windo <args>")
    execute("s:currentWindow" , "wincmd w")
end
function Syndo(opts)
    local currentWindow = winnr()
    execute("tabdo windo 'args'")
    execute("currentWindow wincmd w")
end

function Vrep(args)
    execute("Ack! -G .gml 'args' | vert copen")
end
function Vrepyy(args)
    execute("Ack! -G .yy 'args' | vert copen")
end

DeleteHiddenBuffers=function()
    vim.cmd [[
        local tpbl=[]
        call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
        for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1') do
            silent execute 'bwipeout' buf
        end
    ]]
end


function SetLog(name)
    if vim.fn.isdirectory("C:/Users/Psy") ~= 0 then
        local path="C:/Users/Psy/Appdata/Roaming/"+name+"/output.log"
    else
        local path="C:/Users/Manko/Appdata/Roaming/"+name+"/output.log"
    end
    execute("sp")
    execute("view.path")
    vim.o.setlocal.autoread=true
    vim.o.setlocal.concealcursor=n
    vim.o.setlocal.nocuc=true
    vim.o.setlocal.nocul=true
    vim.o.setlocal.winfixwidth=true
    execute('resize20')
    --set au CursorHold * checktime | call feedkeys("lh")
    --let timer=timer_start(500,'UpdateFile',{'repeat':-1})
    --call timer_start(500,function('s:checktime'),{'repeat':-1})
end
function SetLog1()
    execute('SetLog("Kingdom_Lost_Reborn")')
end

Term=function()
    execute("split|resize20|term")
end
function UpdateFile()
    execute("$")
end
function Checktime(timer_id)
    execute("checktime")
end
