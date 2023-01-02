--New windo command
--function Windo(opts)
--    local currentWindow = winnr()
--    execute("windo <args>")
--    execute("s:currentWindow" , "wincmd w")
--end
--function Syndo(opts)
--    local currentWindow = winnr()
--    execute("tabdo windo 'args'")
--    execute("currentWindow wincmd w")
--end

--function _G.Vrep(args)
--    execute("Ack! -G .gml 'args' | vert copen")
--end
--function _G.Vrepyy(args)
--    execute("Ack! -G .yy 'args' | vert copen")
--end

--function _G.DeleteHiddenBuffers()
--    vim.cmd [[
--        local tpbl=[]
--        call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
--        for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1') do
--            silent execute 'bwipeout' buf
--        end
--    ]]
--end

function _G.SetLog(name)
    local path=""
    if vim.fn.isdirectory("C:/Users/Psy") == 1 then
        path="C:/Users/Psy/Appdata/Roaming/"..name.."/output.log"
    else
        path="C:/Users/Manko/Appdata/Roaming/" .. name .. "/output.log"
    end
    vim.cmd[[
        sp
        set autoread
        syntax=logger
        set concealcursor=n
        set nocuc
        set nocul
        set winfixwidth
        resize20
    ]]
    vim.cmd.view{path}
end

vim.api.nvim_create_user_command(
    'Term',
    'split | resize20 | term',
    {}
)
