"New windo command
command! -nargs=+ -complete=command Windo
    \ let s:currentWindow = winnr() |
    \ execute "windo <args>" |
    \ execute s:currentWindow . "wincmd w"
command! -nargs=+ -complete=command Syndo
    \ let s:currentWindow = winnr() |
    \ execute "tabdo windo <args>" |
    \ execute s:currentWindow . "wincmd w"
"VIMGREP
"\ execute 'filetype plugin off' | " Doesn't really change search speed
command! -nargs=+ Vrep
    \ execute "Ag -G .gml /<args>/" | vert copen |
command! -nargs=+ Vrepjson
    \ execute "Ag -G .json /<args>/" | vert copen |
command! -nargs=+ Vrepyy
    \ execute "Ag -G .yy /<args>/" | vert copen |

function DeleteHiddenBuffers()
    let tpbl=[]
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
        silent execute 'bwipeout' buf
    endfor
endfunction


"let g:ackprg = 'ag --nogroup --nocolor --column'
"if executable('ag')
"  let g:ackprg = 'ag --vimgrep'
"endif
"Which has the same effect but will report every match on the line.
"
"fun! s:checktime(timer_id)
"    checktime
"endfun
"command! -nargs=* -complete=command Term
"            \execute split|resize20|term
"func Term()
"    split|resize20|term
"endfunc
"func UpdateFile(timer)
"    $
"endfunc
func SetLogBelow1()
    below sp
    if isdirectory("C:/Users/Psy")
        view C:\Users\Psy\Appdata\Roaming\Kingdom_Lost_Reborn\output.log
    else
        view C:\Users\Manko\Appdata\Roaming\Kingdom_Lost_Reborn\output.log
    endif
    setlocal autoread
    set syntax=logger
    set concealcursor=n
    "set nocuc
    "set nocul
    resize10
    set winfixheight
endfunc
func SetLog1()
    if isdirectory("C:/Users/Psy")
        view C:\Users\Psy\Appdata\Roaming\Kingdom_Lost_Reborn\output.log
    else
        view C:\Users\Manko\Appdata\Roaming\Kingdom_Lost_Reborn\output.log
    endif
    setlocal autoread
    set syntax=logger
    au CursorHold * checktime
    set concealcursor=n
    set nocuc
    set nocul
    let timer=timer_start(500,'UpdateFile',{'repeat':-1})
    call timer_start(500,function('s:checktime'),{'repeat':-1})
endfunc
func SetLog2()
    if isdirectory("C:/Users/Psy")
        view C:\Users\Psy\Appdata\Roaming\Kalyzmyr\output.log
    else
        view C:\Users\Manko\Appdata\Roaming\Kalyzmyr\output.log
    endif
    setlocal autoread
    set syntax=logger
    au CursorHold * checktime
    set concealcursor=n
    set nocuc
    set nocul
    let timer=timer_start(500,'UpdateFile',{'repeat':-1})
    call timer_start(500,function('s:checktime'),{'repeat':-1})
endfunc
func SetLog3()
    if isdirectory("C:/Users/Psy")
        view C:\Users\Psy\Appdata\Roaming\Dekamara\output.log
    else
        view C:\Users\Manko\Appdata\Roaming\Dekamara\output.log
    endif
    setlocal autoread
    set syntax=logger
    au CursorHold * checktime
    set concealcursor=n
    set nocuc
    set nocul
    let timer=timer_start(500,'UpdateFile',{'repeat':-1})
    call timer_start(500,function('s:checktime'),{'repeat':-1})
endfunc
func SetLog4()
    if isdirectory("C:/Users/Psy")
        view C:\Users\Psy\Appdata\Roaming\BlackRoad\output.log
    else
        view C:\Users\Manko\Appdata\Roaming\BlackRoad\output.log
    endif
    setlocal autoread
    set syntax=logger
    au CursorHold * checktime
    set concealcursor=n
    set nocuc
    set nocul
    let timer=timer_start(500,'UpdateFile',{'repeat':-1})
    call timer_start(500,function('s:checktime'),{'repeat':-1})
endfunc
"Buffer command taken from: https://vim.fandom.com/wiki/Easier_buffer_switching
"Provides easier buffer switching method, but it's not like Nerdtree or
"something....
command -nargs=? -bang Buffer if <q-args> != '' | exe 'buffer '.<q-args> | else | ls<bang> | let buffer_nn=input('Which one: ') | if buffer_nn != '' | exe buffer_nn != 0 ? 'buffer '.buffer_nn : 'enew' | endif | endif
:command! BW :bn|:bd#

"AG The Silver Seacher
"let g:ackprg='ag --nogroup --nocolor --column'
au FocusGained,BufEnter * :silent! !



lua <<EOF
require "settings"
require "mappings"
require "plugs"
require "cmd"



require('telescope').setup()
require('nvim-tree').setup()




-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true


vim.opt.completeopt=menu,menuone,noselect

-- Setup nvim-cmp.
local cmp = require('cmp')
local cmp_buffer = require('cmp_buffer')

cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<S-TAB>'] = cmp.mapping.select_prev_item(),
      ['<TAB>'] = cmp.mapping.select_next_item(),
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'cmp-buffer' },
      { name = 'vsnip' }, -- For vsnip users.
    }, {
      { name = 'buffer' },
    })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
})




--AG The Silver Seacher
vim.g.ackprg="ag --nogroup --nocolor --column"
require('telescope').load_extension("ag")


EOF
