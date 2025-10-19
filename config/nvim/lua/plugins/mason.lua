return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "clangd",
                "basedpyright",
            }
        })

        -- Keybindings for LSP
        local on_attach = function(client, bufnr)
            print("LSP Attached: " .. client.name)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
            vim.keymap.set("n", "gr", ":FzfLua lsp_references<CR>", { buffer = bufnr })
            vim.keymap.set("n", "gs", ":FzfLua grep_cword<CR>", { buffer = bufnr })
            vim.keymap.set("n", "gn", vim.lsp.buf.rename, { buffer = bufnr })
        end

        -- Auto-start LSP servers
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "python",
            callback = function()
                vim.lsp.start({
                    name = "basedpyright",
                    cmd = { "basedpyright-langserver", "--stdio" },
                    on_attach = on_attach,
                })
            end,
        })

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "lua",
            callback = function()
                vim.lsp.start({
                    name = "lua_ls",
                    cmd = { "lua-language-server" },
                    on_attach = on_attach,
                })
            end,
        })

        -- Diagnostic float on hover
        vim.api.nvim_create_autocmd({ "CursorHold" }, {
            pattern = "*",
            callback = function()
                vim.diagnostic.open_float({
                    scope = "cursor",
                    focusable = false,
                })
            end
        })
    end
}
