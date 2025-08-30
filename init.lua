-- =====================================================
-- General settings
-- ====================================================
vim.o.number = false         -- do not show line numbers
vim.o.relativenumber = false -- disable relative line numbers
vim.o.errorbells = true      -- enable audible error bells
vim.o.wrap = false           -- disable line wrapping
vim.o.linebreak = true       -- wrap lines at word boundaries
vim.o.wildmenu = true        -- enhanced command-line completion menu
vim.o.expandtab = true       -- convert tabs to spaces
vim.o.exrc = true            -- allow local .exrc or .nvimrc files
vim.o.backspace = "2"        -- allow more flexible backspace
vim.o.hlsearch = false       -- disable search highlight
vim.o.incsearch = true       -- enable incremental search
vim.o.ignorecase = true      -- ignore case in search
vim.o.ruler = true           -- show cursor position
vim.o.splitbelow = true      -- new splits open below
vim.o.softtabstop = 4        -- insert mode tab = 4 spaces
vim.o.tabstop = 4            -- tab character width
vim.o.shiftwidth = 4         -- number of spaces for autoindent
vim.o.smartindent = true     -- smart indentation
vim.o.autoindent = true      -- copy indent from current line
vim.o.lazyredraw = true      -- improve performance for macros
vim.o.clipboard = "unnamed"  -- use system clipboard
vim.o.winborder = "rounded"
vim.o.guicursor = ""

vim.cmd [[
  syntax on
  hi StatusLine guibg=NONE ctermbg=NONE
  hi StatusLineNC guibg=NONE ctermbg=NONE
]]

-- =====================================================
-- Key mappings
-- =====================================================
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Visual line movement with j/k
map('n', 'j', 'gj', opts)
map('n', 'k', 'gk', opts)

-- Leader key
vim.g.mapleader = " "

-- Center screen after scrolling
map('n', '<C-u>', '<C-u>zz', opts)
map('n', '<C-d>', '<C-d>zz', opts)

-- Move selected lines up/down in visual mode
map('v', 'J', ":m '>+1<CR>gv=gv", opts)
map('v', 'K', ":m '<-2<CR>gv=gv", opts)

-- Paste without overwriting default register
map('x', 'p', '"_dP', opts)

-- Window navigation
map('n', '<leader>h', '<C-w>h', opts)
map('n', '<leader>j', '<C-w>j', opts)
map('n', '<leader>k', '<C-w>k', opts)
map('n', '<leader>l', '<C-w>l', opts)

-- File explorer
map('n', '<leader>pv', ':Oil<CR>', opts)

-- Open terminal
map('n', '<C-t>', ':terminal<CR>', opts)
map("n", "<leader>pf", ":Pick files<CR>", opts)
map("n", "<leader>pg", ":Pick grep_live<CR>", opts)

map('n', '<leader>o', ':update<CR> :source<CR>', opts)
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)

vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
vim.keymap.set('n', 'gr', vim.lsp.buf.references)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)

-- =====================================================
-- netrw settings
-- =====================================================
vim.g.netrw_sort_by = "name"
vim.g.netrw_banner = false

-- =====================================================
-- plugins
-- =====================================================
vim.pack.add({
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/nvim-mini/mini.pick" },
    -- { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

require("mason").setup()
require("oil").setup()
require("mini.pick").setup()
--require("nvim-treesitter.configs").setup({
--    ensure_installed = {
--        "lua",
--        "python",
--        "javascript",
--        "typescript",
--        "html",
--        "css",
--        "json",
--        "bash",
--        "c",
--        "cpp",
--        "rust"
--    },
--    highlight = { enable = true }
--})

-- =====================================================
-- lsp config
-- =====================================================
vim.lsp.enable({ "lua_ls", "pyright", "clangd" })
vim.diagnostic.config({
    signs = false,
})
