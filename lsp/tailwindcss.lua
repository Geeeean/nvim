local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if ok then
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

return {
    cmd = { "tailwindcss-language-server", "--stdio" },
    filetypes = {
        "aspnetcorerazor", "astro", "astro-markdown", "blade", "clojure", "django-html", "htmldjango",
        "edge", "eelixir", "elixir", "ejs", "erb", "eruby", "gohtml", "gohtmltmpl", "haml",
        "handlebars", "hbs", "html", "html-eex", "heex", "jade", "leaf", "liquid", "markdown",
        "mdx", "mustache", "njk", "nunjucks", "php", "razor", "slim", "twig", "css", "less",
        "postcss", "sass", "scss", "stylus", "sugarss", "javascript", "javascriptreact", "reason",
        "rescript", "typescript", "typescriptreact", "vue", "svelte", "templ"
    },
    capabilities = capabilities,
    root_dir = function(fname)
        if type(fname) == "number" then
            fname = vim.api.nvim_buf_get_name(fname)
        end
        if not fname or fname == "" then
            fname = vim.loop.cwd()
        end

        local root_files = {
            'tailwind.config.js',
            'tailwind.config.cjs',
            'tailwind.config.mjs',
            'tailwind.config.ts',
            'postcss.config.js',
            'package.json',
            '.git',
        }

        local matches = vim.fs.find(root_files, {
            path = fname,
            upward = true,
            limit = 1
        })

        if matches and #matches > 0 then
            return vim.fs.dirname(matches[1])
        end
        return nil
    end,
    settings = {
        tailwindCSS = {
            classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
            lint = {
                cssConflict = "warning",
                invalidApply = "error",
                invalidConfigPath = "error",
                invalidScreen = "error",
                invalidTailwindDirective = "error",
                invalidVariant = "error",
                recommendedVariantOrder = "warning",
            },
            validate = true,
        },
    },
}
