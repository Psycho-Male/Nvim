"Plugin Manager: https://github.com/junegunn/vim-plug"
call plug#begin(stdpath("config") . "/plug")
"
"https://github.com/nvim-telescope/telescope.nvim
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'BurntSushi/ripgrep'
Plug 'sharkdp/fd'

"https://github.com/hrsh7th/nvim-cmp
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
"Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
"
"https://github.com/hrsh7th/vim-vsnip
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

"https://github.com/petertriho/cmp-git
Plug 'petertriho/cmp-git'

"https://github.com/nvim-treesitter/nvim-treesitter
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"https://github.com/windwp/nvim-autopairs
"Plug 'windwp/nvim-autopairs'

"https://github.com/kyazdani42/nvim-tree.lua
"Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
"Plug 'kyazdani42/nvim-tree.lua'

"https://github.com/mileszs/ack.vim
Plug 'mileszs/ack.vim'

"https://github.com/GameMakerDiscord/gml-tools-langserver
"Plug 'GameMakerDiscord/gml-tools-langserver'

"https://github.com/jlanzarotta/bufexplorer
Plug 'jlanzarotta/bufexplorer'


"Auto save https://github.com/Pocco81/auto-save.nvim
Plug 'Pocco81/auto-save.nvim'

call plug#end()


"nvim-cmp----------------------------------------------------------------------------------\\
"https://github.com/hrsh7th/nvim-cmp
set completeopt=menu,menuone,noselect
lua <<EOF
--require("nvim-tree").setup()
--require("nvim-autopairs").setup {}
--require('nvim-autopairs').remove_rule('{') -- remove rule (
--require("cmp_git").setup()
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

  ---- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  --cmp.setup.cmdline('/', {
  --  mapping = cmp.mapping.preset.cmdline(),
  --  sources = {
  --    { name = 'buffer' }
  --  }
  --})

  ---- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  --cmp.setup.cmdline(':', {
  --  mapping = cmp.mapping.preset.cmdline(),
  --  sources = cmp.config.sources({
  --    { name = 'path' }
  --  }, {
  --    { name = 'cmdline' }
  --  })
  --})

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  --require('lspconfig')['gml-tools-langserver'].setup {
  --  capabilities = capabilities
  --}
EOF
"------------------------------------------------------------------------------------------//
":se backup? backupdir? backupext?
"http://vim.wikia.com/wiki/Remove_swap_and_backup_files_from_your_working_directory
" vim's vimrc_example and msvim already sets up backup and swap
" set swap(.swp),backup(~),undo(.udf) directory to vim installation
" Please make sure the directory exists otherwise current directory will be used
" Remember the undo history for file, doesn't work with file collisions
"Taken from http://vim.wikia.com/wiki/Example_vimrc

"-------------------------------------------------------------------------------------------\\
"Setting                                                                                    ||
"-------------------------------------------------------------------------------------------//
"SETTERS-----------------------------------------------------------------------------------\\
    lua <<EOF
if vim.fn.isdirectory("M:/GameMakerProjects")==TRUE then
    vim.opt.directory="M:/Programs/Vim/tmp"
    vim.opt.backupdir="M:/Programs/Vim/tmp"
    vim.opt.undodir  ="M:/Programs/Vim/tmp"
    vim.fn("cd M:/GameMakerProjects/Dekamara")
    --cd M:/GameMakerProjects/Kingdom-Lost
    --cd M:/GameMakerProjects/Kalyzmyr
else
    vim.opt.directory="C:/tmp"
    vim.opt.backupdir="C:/tmp"
    vim.opt.undodir  ="C:/tmp"
    vim.fn.chdir("C:/Users/Manko/Documents/GameMakerStudio2/Dekamara")
    --vim.fn.chdir("C:/Users/Manko/Documents/GameMakerStudio2/Kingdom-Lost")
    --vim.fn.chdir("C:/Users/Manko/Documents/GameMakerStudio2/Kalyzmyr")
end
EOF
    set updatetime=1
    "set nocompatible
    set hidden "Don't delete unused buffers?
    set wildmenu
    set ignorecase "Use case insesitive search, except when using capital letters
    set smartcase
    set autoindent "If there is no flietype-specific indenting, imitate above line
    set laststatus=2 "Always display status line
    set confirm "Instead failing because file is not save, ask if you want to save first
    set expandtab
    set softtabstop=4 "disabled tabstop=4
    "set autochdir
    "set tabstop=4
    "set cmdheight=2 "set command windows to 2 lines
    filetype on
    filetype plugin on
    syntax on
    colorscheme psycho
    set background=dark
    set ruler
    set hlsearch
    set autoindent
    set smartindent
    set number
    set shiftwidth=4
    set cursorline
    set cursorcolumn
    "set guitablabel=%N/\ %t\ %M
    "set guitablabel=%N-\%M
    set notitle
    set so=10 "Set cursor offset
    set incsearch
    set foldminlines=0
    set foldmethod=indent
    set foldexpr=getline(v:lnum)=~'^\\s*$'&&getline(v:lnum+1)=~'\\S'?'<1':1
    set foldclose=all
    set foldopen=all
    set foldnestmax=1
    set showcmd
    set relativenumber
    set conceallevel=2
    "Removing Unix from fileformats to prevent vim read .gml files as Unix instead
    set ff=dos
    set ffs=dos
    "set wrap
    "set textwidth=128
    "p=percentage l=line number f=filepath n=buffer number m=modified r=readonly
    "set statusline=%F[%n]%m%r
    "set statusline=
    set statusline=%{expand('%:p:h:t')}/%t[%n][%l,%c]%m%r
    "Set custom tab name
    "Usage: :let t:mytablabel = 'my_tab_name'
    function! GuiTabLabel()
      return exists('t:mytablabel') ? t:mytablabel : ''
    endfunction
    set guitablabel=%{GuiTabLabel()}
    set go+=e
    set guifont=Consolas:h9
    set winaltkeys=no
    au GUIEnter * simalt ~x "Start gvim in fullscreen mode
    au BufRead * set autoread
    "Disable blinking autocmd version
    "set noerrorbells visualbell t_vb=
    "if has('autocmd')
    "    autocmd GUIEnter * set visualbell t_vb=
    "    autocmd BufNew,BufNewFile,BufRead,BufWinEnter * set cuc
    "    autocmd BufNew,BufNewFile,BufRead,BufWinEnter * set cul
    "    autocmd BufNew,BufNewFile,BufRead,BufWinEnter * set buftype=""
    "endif
    "windows toolbar
    if has("gui_running")
        set guioptions-=m
        set guioptions-=T
        set guioptions-=r
        set guioptions-=L
        set t_Co=256 "256 color
    endif
"------------------------------------------------------------------------------------------//
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
    \ execute "Ack -G .gml /<args>/" | vert copen |
command! -nargs=+ Vrepjson
    \ execute "Ack -G .json /<args>/" | vert copen |
command! -nargs=+ Vrepyy
    \ execute "Ack -G .yy /<args>/" | vert copen |

"--------------------------------------------------------------------------------------------\\
"Mappings                                                                                    ||
"--------------------------------------------------------------------------------------------//
    "inoremap ( ()<LEFT>
    "inoremap " ""<LEFT>
    "inoremap [ []<LEFT>
    inoremap {  {<CR>}<ESC><UP>
    inoremap <C-S-CR> {}<LEFT>
    inoremap <M-[> []<LEFT>
    inoremap <M-'> ""<LEFT>
    inoremap <C-CR>  {<CR>}else{<CR>}<ESC><UP><UP>
    inoremap <S-CR>  {<CR>}<ESC>O
    inoremap <C-SPACE> <TAB>=
    inoremap <S-SPACE> _
    "inoremap <C-> <SPACE>{<CR>}i else {<CR>}<ESC> {
    inoremap <S-ESC> <ESC>:w<CR>
    map <C-o> i/*<ESC>
    map <C-c> a*/<ESC>
    map <C-s> :setlocal spell!<cr>
    map <S-k> <Nop>
    map mm :nohl<ENTER>
    "map <M-j> zj
    "map <M-k> zk
    map <M-j> <DOWN>zj<UP>
    map <M-k> zk<UP>
    map <M-u> [z
    map <M-d> ]z
    map <leader>ti i["+string(i)+"]<ESC>
"--------------------------------------------------------------------------------------------\\
"Normal maps                                                                                 ||
"--------------------------------------------------------------------------------------------//
    "nnoremap <Left>  :expand("%:p:h")<TAB><CR>
    "nnoremap <Right> :expand("%:p:h")<S-TAB><CR>
    nnoremap <leader>vv :execute "Ack " expand("<cword>")<CR>
    nnoremap <leader>gff :e scripts\<c-r><c-w>\<c-r><c-w>.gml<CR>
    nnoremap <leader>gfv :vs scripts\<c-r><c-w>\<c-r><c-w>.gml<CR>
    nnoremap <leader>gfs :sp scripts\<c-r><c-w>\<c-r><c-w>.gml<CR>
    nnoremap <Space> @
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-H> <C-W><C-H>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>
    nnoremap <S-H> gT
    nnoremap <S-L> gt
    nnoremap <silent> <C-T> :tabe<CR>
    nnoremap <silent> <S-T> :tabclose<CR>
    nnoremap <M-s> :m .+1<CR>==
    nnoremap <M-w> :m .-2<CR>==
    nmap <leader>bd :call DeleteHiddenBuffers()<CR>
    nmap <leader>sda :cd %:p:h<CR>:cd<CR>
    nmap <leader>sdw :lcd %:p:h<CR>:cd<CR>
    nmap <leader>//  /\<\><LEFT><LEFT>
    nmap <leader>/f  /function 
    nmap <leader>ltb b:let timer=timer_start(500,'UpdateFile',{'repeat':-1})<CR>
    nmap <leader>lte :call timer_stopall()<CR>
    nmap <leader>eko1 :call SetLog1()<CR>
    nmap <leader>eko2 :call SetLog2()<CR>
    nmap <leader>eko3 :call SetLog3()<CR>
    nmap <leader>ogml :term ++curwin datafiles\Gmlive\gmlive-server.exe<CR>
    nmap + <C-w>+
    nmap - <C-w>-
    nmap z- :set foldnestmax=1<CR>
    nmap z+ :set foldnestmax=2<CR>
    nmap <leader>bw :BW<CR>
    nmap <silent> <leader>sv :so $MYVIMRC<CR>:Syndo filetype detect<CR>
    nmap <silent> <leader>ev :e $MYVIMRC<CR>
    nmap <leader>ve :e C:\Program Files (x86)\Vim\Vimfiles\
    nmap <silent> <leader>eg :e C:\Users\Psy\AppData\Local\nvim\syntax\gml.vim<CR>
    nmap <leader>ek :e C:\Users\Psy\Appdata\Roaming\Kingdom_Lost\
    nmap <silent> <leader>oo :only<CR>
    "nmap gx gf<CR>:vs<CR>:e #<CR>
    nmap <F6> :w<ENTER>:!%<ENTER>
    nmap <F2> :Syndo filetype detect<CR>
    nmap <F3> :let t:mytablabel = ''<Left>
    "GAMEMAKER MACROS
    nmap <silent> <leader>tt yiwiTrace("<ESC>A: "+string());<ESC>hhP
    nmap <silent> <leader>td yiwiGuiTrace("<ESC>A: ",);<ESC>hP
    nmap <silent> <leader>to yiwiTrace("<ESC>A: "+object_get_name());<ESC>hhP
    nmap <silent> <leader>ts yiwiTrace("<ESC>A: "+sprite_get_name());<ESC>hhP
    nmap <silent> <leader>tc yiwiTrace("<ESC>A: "+script_get_name());<ESC>hhP
    nmap <silent> <leader>ta yiwiTrace("<ESC>A: "+audio_get_name());<ESC>hhP
    nmap <silent> <leader>tr yiwiTrace("<ESC>A: "+room_get_name());<ESC>hhP
    nmap <silent> <leader>tb yiwiTrace("<ESC>A: "+rb());<ESC>hhP
    nmap <silent> <leader>cd o_text = "<ESC>pa: " + string(<ESC>pa);<CR>draw_text_transformed(_tx, _ty, _tt, .25, .25, 0);<ESC>
    nmap <silent> <leader>cv oTrace_string("<ESC>pa");<ESC>kdd
    nmap <silent> <leader>cz oTrace(": " + string());<ESC>2F"pf(p<UP>dd<DOWN>f:
    nmap <silent> <leader>sd oTrace("");<ESC>2hi
    nmap <silent> <leader>cx oTrace(""+string());<ESC>F"i
    nmap <silent> <leader>cs oTrace("--CALLSTACK--");for(var i=0,cs=debug_get_callstack();i<array_length(cs);i++) Trace(cs[i]);<ESC>
    nmap <silent> <leader>tp ^eaPop<ESC>
    nmap <silent> <leader>ww o//<ESC>90a-<ESC>a\\<CR>//<ESC>90a<SPACE><ESC>a\|\|<ESC>o//<ESC>90a-<ESC>A//<ESC>kk^ll
    "R@PsychoMale

    nmap <silent> <leader>wd v$3hxjjv$3hx

    nmap <silent> <leader>fi ofor(var i=0;i<;i++){2f;i
    nmap <silent> <leader>fj ofor(var j=0;j<;j++){2f;i
    nmap <silent> <leader>fk ofor(var k=0;k<;k++){2f;i
    nmap <silent> <leader>fl ofor(var l=0;l<;l++){2f;i
    nmap <silent> <leader>fm ofor(var i=ds_map_find_first(_map);IsDefined(i);i=ds_map_find_next(_map,i)){o

    nmap <silent> <leader>br oBreakpoint();<ESC>

    nmap <silent> <leader>cw f"lvf"h~
    nmap <leader> <mks> :mks! C:\sess\
    nmap <leader> <src> :source! C:\sess\
    nmap <F1>     :mks! C:\sess\1.vim<CR>
    nmap <silent> <leader>s1 :source C:\sess\1.vim<CR>
    "nmap <silent> <leader>s2 :source 2<CR>
    "nmap <silent> <leader>s3 :source 3<CR>
    "nmap <silent> <leader>s4 :source 4<CR>
    nmap <silent> <leader>vw :vs<CR>
    nmap <silent> <leader>sw :sp<CR>

    nmap <silent> <leader>fl vBxafor(var i=0;i<ds_list_size(<ESC>pa);i++){o
    nmap <silent> <leader>fa vBxafor(var i=0;i<array_length(<ESC>pa);i++){o
    nmap <silent> <leader>fw vBxafor(var i=0;i<ds_grid_width(<ESC>pa);i++){o
    nmap <silent> <leader>fh vBxafor(var i=0;i<ds_grid_height(<ESC>pa);i++){o

    nmap <silent> <leader>te otry{jacatch(e){oTraceException(e);<ESC>
    "ESC MAPS
    "GAMEMAKER FILE EDITING
    nmap <ESC>eo :e  objects\
    nmap <ESC>vo :vs objects\
    nmap <ESC>so :sp objects\

    nmap <ESC>es :e  scripts\
    nmap <ESC>vs :vs scripts\
    nmap <ESC>ss :sp scripts\

    nmap <ESC>er :e  rooms\
    nmap <ESC>vr :vs rooms\
    nmap <ESC>sr :sp rooms\

    nmap <ESC>ed :e  datafiles\
    nmap <ESC>vd :vs datafiles\
    nmap <ESC>sd :sp datafiles\

    nmap <ESC>ea :e  shaders\
    nmap <ESC>va :vs shaders\
    nmap <ESC>sa :sp shaders\

    nmap <ESC>eu :e  sounds\
    nmap <ESC>vu :vs sounds\
    nmap <ESC>su :sp sounds\

    nmap <ESC>en :e  notes\
    nmap <ESC>vn :vs notes\
    nmap <ESC>sn :sp notes\

    nmap <ESC>to :tabe objects\
    nmap <ESC>ts :tabe scripts\
    nmap <ESC>tr :tabe rooms\
    nmap <ESC>td :tabe datafiles\
    nmap <ESC>ta :tabe shaders\
    nmap <ESC>tn :tabe notes\

    "nmap <ESC><C-e> :E<CR>:set buftype=""<CR>:set bf=""<CR>
    "nmap <ESC>s<C-v> :vs<CR>:E<CR>:set buftype=""<CR>:set bf=""<CR>
    "nmap <ESC>s<C-s> :sp<CR>:E<CR>:set buftype=""<CR>:set bf=""<CR>

    nmap <leader>,e :e <C-R>=expand("%:p:h") . "\\" <CR>
    nmap <leader>,s :split <C-R>=expand("%:p:h") . "\\" <CR>
    nmap <leader>,v :vs <C-R>=expand("%:p:h") . "\\" <CR>
    nmap <leader>,t :tabe <C-R>=expand("%:p:h") . "\\" <CR>

    nmap <C-_>- <C-W>-
    "Cursor line/column highlight toggle
    nmap <silent> <TAB>cc    :Windo set cuc<CR>:Windo set cul<CR>
    nmap <silent> <TAB>ch    :Windo set nocuc<CR>:Windo set nocul<CR>
    "Quick Indent/Unindent
    nmap <TAB>ik kvj^f{%j>
    nmap <TAB>ij jvk^f{%k>
    nmap <TAB>uk kvj^f{%j<
    nmap <TAB>uj jvk^f{%k<
    nmap <TAB>kz V$%zf
    nmap <TAB>jz V$%zf
    nmap <TAB><CR> s{ja<CR><ESC>ddkP>>
    nmap <leader>str a={ofunc:function(){ja,<ESC>2kI
    nmap dq df_
    nmap dQ dt_
    nmap Q  :E %:h../..<CR>
    nmap <leader>drw idraw_sprite(sprite_index,image_index,x,y);<ESC>
    nmap <leader>dre idraw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);<ESC>
    nmap <leader>gml Oif(live_call()) return live_result;<ESC>
    " Find files using Telescope command-line sugar.
    nnoremap <leader>ff <cmd>Telescope find_files<cr>
    nnoremap <leader>fg <cmd>Telescope live_grep<cr>
    nnoremap <leader>fb <cmd>Telescope buffers<cr>
    nnoremap <leader>fh <cmd>Telescope help_tags<cr>
    " NVim Tree
    nnoremap <leader>ntt <cmd>NvimTreeToggle<cr>
    nnoremap <leader>ntf <cmd>NvimTreeFocus<cr>
    nnoremap <leader>ntc <cmd>NvimTreeCollapse<cr>
"-------------------------------------------------------------------------------------------\\
"Visual maps                                                                                ||
"-------------------------------------------------------------------------------------------//
    vnoremap <leader>vv y:execute "Ack -G .gml <C-R>""<CR>
    vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
    vnoremap <leader>p "_dP
    vmap <silent> <leader>tt   yiTrace("<ESC>A: "+string());<ESC>hhP
    vmap <silent> <leader>td   yiGuiTrace("<ESC>A: ",);<ESC>hP
    vmap <silent> <leader>to   yiTrace("<ESC>A: "+object_get_name());<ESC>hhP
    vmap <silent> <leader>ts   yiTrace("<ESC>A: "+sprite_get_name());<ESC>hhP
    vmap <silent> <leader>tc   yiTrace("<ESC>A: "+script_get_name());<ESC>hhP
    vmap <silent> <leader>ta   yiTrace("<ESC>A: "+audio_get_name());<ESC>hhP
    vmap <silent> <leader>tr   yiTrace("<ESC>A: "+room_get_name());<ESC>hhP
    vmap <silent> <leader>tb   yiTrace("<ESC>A: "+rb());<ESC>hhP
    vmap <S-x> :s/y/x/g<CR>:nohl<CR>
    vmap <S-y> :s/x/y/g<CR>:nohl<CR>
"-------------------------------------------------------------------------------------------\\
"Insert maps                                                                                ||
"-------------------------------------------------------------------------------------------//
function DeleteHiddenBuffers()
    let tpbl=[]
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
        silent execute 'bwipeout' buf
    endfor
endfunction


"let g:ackprg = 'ag --nogroup --nocolor --column'
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
"Which has the same effect but will report every match on the line.
"
fun! s:checktime(timer_id)
    checktime
endfun
func UpdateFile(timer)
    $
endfunc
func SetLog1()
    if isdirectory("C:\Users\Psy")
        view C:\Users\Psy\Appdata\Roaming\Kingdom_Lost\output.log
    else
        view C:\Users\Manko\Appdata\Roaming\Kingdom_Lost\output.log
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
    if isdirectory("C:\Users\Psy")
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
    if isdirectory("C:\Users\Psy")
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
"Buffer command taken from: https://vim.fandom.com/wiki/Easier_buffer_switching
"Provides easier buffer switching method, but it's not like Nerdtree or
"something....
command -nargs=? -bang Buffer if <q-args> != '' | exe 'buffer '.<q-args> | else | ls<bang> | let buffer_nn=input('Which one: ') | if buffer_nn != '' | exe buffer_nn != 0 ? 'buffer '.buffer_nn : 'enew' | endif | endif
:command! BW :bn|:bd#

"AG The Silver Seacher
let g:ackprg='ag --nogroup --nocolor --column'
