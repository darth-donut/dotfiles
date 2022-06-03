" Dependencies:
"  1. get rustup installed and install the rust-analyzer component, make sure rust-analyzer is in your path
"  2. get clippy installed 
"  3. nerdfont for jetbrains mono https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono/Ligatures/Regular/complete
"  4. inital setup :PlugInstall (treesitter's post install script will fail but that's ok)
"  5. installed the CodeLLDB vscode extension in a linux-like environment
"   	link: https://marketplace.visualstudio.com/items?itemName=vadimcn.vscode-lldb
"
"  Documentation:
"     za -> fold area
"     zR -> unfold document
"     zM -> fold document
"     [g and ]g -> show next/prev diagnostic
"     [c and ]c -> show next/prev git hunk
"     <C-p> and <C-n> -> nvim-cmp's scroll UP/DOWN when popup appears
"     <C-d> and <C-f> -> nvim-cmp's documentation scroll UP/DOWN when popup appears
"
"     Commands:
"       Tree -> opens tree
"       RTree -> opens tree and sets cursor at filename (see nvim-tree documentation for shortcuts on treefinder)
"       Lines -> search within file
"       BLines -> search within all open buffers
"       Rg -> search everywhere
"       Reg -> regex search everywhere
"       Files -> search by filename
"       Buffers -> shows open buffer
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" Collection of common configurations for the Nvim LSP client
Plug 'neovim/nvim-lspconfig'

" Completion framework
Plug 'hrsh7th/nvim-cmp'
" LSP completion source for nvim-cmp
Plug 'hrsh7th/cmp-nvim-lsp'
" Other usefull completion sources
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
" function signature/parameter pop-up help
Plug 'ray-x/lsp_signature.nvim'

" Snippet completion source for nvim-cmp
Plug 'hrsh7th/cmp-vsnip'
" Snippet engine
Plug 'hrsh7th/vim-vsnip'

" To enable more of the features of rust-analyzer, such as inlay hints and more!
Plug 'simrat39/rust-tools.nvim'
" Supoprt debugging -- not working yet as of 03/06/22 -- go to rust-tools
" github page to try again
Plug 'nvim-lua/plenary.nvim'
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'


" Themes
Plug 'savq/melange'

" Comments
Plug 'tpope/vim-commentary'
" surrounds word with adjective
Plug 'tpope/vim-surround'
" . now has repeat on steroids
Plug 'tpope/vim-repeat'
" [e ]b [<space> etc. (just try it)
Plug 'tpope/vim-unimpaired'
" more % functions
Plug 'tmhedberg/matchit'
" () pair
Plug 'jiangmiao/auto-pairs'
" ctrl-n multi cursor
Plug 'terryma/vim-multiple-cursors'
" nav between tmux and vim splits with ctrl-hjkl
Plug 'christoomey/vim-tmux-navigator'
" for file icons
Plug 'kyazdani42/nvim-web-devicons'
" File tree
Plug 'kyazdani42/nvim-tree.lua'
" Powerline
Plug 'nvim-lualine/lualine.nvim'
" Tree-sitter (for better language support)
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Gitgutter
Plug 'lewis6991/gitsigns.nvim'
" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c

" Configure LSP through rust-tools.nvim plugin.
" rust-tools will configure and enable certain LSP features for us.
" See https://github.com/simrat39/rust-tools.nvim#configuration
lua <<EOF
local nvim_lsp = require'lspconfig'
-- this assumes you've installed the CodeLLDB vscode extension in a linux-like environment
--  link: https://marketplace.visualstudio.com/items?itemName=vadimcn.vscode-lldb
--  TODO: update the version below! (as of this writing, 1.7.0 doesn't work, try 1.6.10)
local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.6.10/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.dylib'

local opts = {
    tools = { -- rust-tools options
        autoSetHints = true,
        hover_with_actions = true,
        -- inlay_hints = {
        --     show_parameter_hints = false,
        --     parameter_hints_prefix = "",
        --     other_hints_prefix = "",
        -- },
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
    server = {
        -- on_attach is a callback called when the language server attaches to the buffer
	on_attach = function(client, bufnr)
		require("lsp_signature").on_attach({
		  hint_prefix = " ",
		}, bufnr)
	end,
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy"
                },
            }
        }
    },
    dap = {
      adapter = require('rust-tools.dap').get_codelldb_adapter(codelldb_path, liblldb_path)
    },
}

require('rust-tools').setup(opts)
EOF

" Setup Completion
" See https://github.com/hrsh7th/nvim-cmp#basic-configuration
lua <<EOF
local cmp = require'cmp'
cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },

  -- Installed sources
  sources = {
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'buffer' },
    { name = 'vsnip' },
  },
})
EOF

" Code navigation shortcuts
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gi    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <leader>r    <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>

" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300
" Show diagnostic popup on cursor hold
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })

" format-on-write (timeout = 200ms)
autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 200)

" Goto previous/next diagnostic warning/error
nnoremap <silent> [g <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent> ]g <cmd>lua vim.diagnostic.goto_next()<CR>

" have a fixed column for the diagnostics to appear in
" this removes the jitter when warnings/errors flow in
" set signcolumn=yes

set incsearch
set nowrap
set nu
set rnu
set guicursor=i:block
" nvim-tree: this variable must be enabled for colors to be applied properly
set termguicolors
" colourscheme
colorscheme melange

" Default indent settings
autocmd FileType rust setlocal shiftwidth=2 tabstop=2

command Tree NvimTreeToggle
" reverse lookup: finds file in tree
command RTree NvimTreeFindFile

" a list of groups can be found at `:help nvim_tree_highlight`
" nvim-tree setup
" See https://github.com/kyazdani42/nvim-tree.lua#setup
lua <<EOF
require'nvim-tree'.setup {
  diagnostics = {
    enable = true,
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  update_cwd = true,
  renderer = {
    highlight_git = true,
    indent_markers = {
        enable = true,
    },
    icons = {
      glyphs = {
        git = {
          untracked = "U",
          unstaged = "M",
        },
      },
    },
  },
  view = {
    mappings = {
      custom_only = false,
      list = {
        { key = "v", action = "vsplit" },
        { key = "s", action = "split" },
        { key = "O", action = "close_node" },
        { key = "o", action = "expand_all" },
        { key = "t", action = "tabnew" },
        { key = "m", action = "rename" },
        { key = "R", action = "refresh" },
        { key = "dd", action = "remove" },
        { key = "a", action = "create" },
        { key = "y", action = "copy_name" },
        { key = "yy", action = "copy_absolute_path" },
      },
    },
  },
}
EOF

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "rust" },
  highlight = {
    enable = true,
  },
  sync_install = false,
}
EOF

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
" don't fold on file open
set foldlevel=99

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>


lua <<EOF
require('lualine').setup()
EOF

lua <<EOF
require('gitsigns').setup()
EOF

nnoremap <silent> [c :Gitsigns prev_hunk <cr> :Gitsigns preview_hunk <cr>
nnoremap <silent> ]c :Gitsigns next_hunk <cr> :Gitsigns preview_hunk <cr>

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang Reg call RipgrepFzf(<q-args>, <bang>0)

lua <<EOF
require("dapui").setup()
EOF
map <F9> <cmd> lua require'dap'.toggle_breakpoint() <CR>
