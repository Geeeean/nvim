return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        require("nvim-treesitter").setup({
            ensure_installed = { "fsharp", "lua", "vim", "vimdoc" },
            highlight = { enable = true },
        })
    end,
}
