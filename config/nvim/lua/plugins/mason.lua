return {
    "williamboman/mason.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "saghen/blink.cmp",
        "ibhagwan/fzf-lua",
    },
    config = function()

        require("mason").setup()

        local servers = {
            "lua_ls",
            "rust_analyzer",
            "clangd",
            "basedpyright",
        }

        -- Add keybindings for each server
        local on_attach = function(x, _)
            print("LSP Attached: " .. x.name)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set('n', 'gr', ":FzfLua lsp_references<CR>")
            vim.keymap.set('n', 'gs', ":FzfLua grep_cword<CR>")
            vim.keymap.set('n', 'gn', vim.lsp.buf.rename, {})
        end

        local blink_cmp = require("blink.cmp")

        -- Setup each server
        for _, server in ipairs(servers) do
            vim.lsp.config(server, {
                on_attach = on_attach,
                capabilities = blink_cmp.get_lsp_capabilities(),
                flags = {debounce_text_changes = 150},
            })
        end

        vim.lsp.enable(servers)

        -- Show the diag float on hover
        vim.api.nvim_create_autocmd({ "CursorHold" }, {
            pattern = "*",
            callback = function()
                for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
                    if vim.api.nvim_win_get_config(winid).zindex then
                        return
                    end
                end
                vim.diagnostic.open_float({
                    scope = "cursor",
                    focusable = false,
                    close_events = {
                        "CursorMoved",
                        "CursorMovedI",
                        "BufHidden",
                        "InsertCharPre",
                        "WinLeave",
                    },
                })
            end
        })

    end

}
