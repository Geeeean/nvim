return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.lsp.config("ts_ls", {})
            vim.lsp.enable({"ts_ls"})

            vim.lsp.config("pyright", {})
            vim.lsp.enable({"pyright"})

            vim.lsp.config("tailwindcss", {})
            vim.lsp.enable({"tailwindcss"})

            vim.lsp.config("clangd", {})
            vim.lsp.enable({"clangd"})

            vim.lsp.config("cssls", {})
            vim.lsp.enable({"cssls"})

            vim.lsp.config("lua_ls", {})
            vim.lsp.enable({"lua_ls"})
        end
    }
}
