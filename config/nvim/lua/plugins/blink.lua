return {
    'saghen/blink.cmp',
    version = '1.*',
    opts = {

        appearance = {nerd_font_variant = 'JetBrainsMonoNerdFont'},
        sources = {default = { 'lsp', 'path', 'snippets', 'buffer'}},
        fuzzy = {implementation = "prefer_rust_with_warning"},
        signature = {enabled=true},

        completion = {

            menu = {draw={treesitter={'lsp'}}},

            documentation = {
                auto_show = true,
                auto_show_delay_ms = 30,
            },

            list = {
                selection = {
                    preselect = false,
                    auto_insert = true,
                }
            }
        },

        keymap = {
            preset = 'enter',
            ['<S-Tab>'] = { 'select_prev', 'fallback' },
            ['<Tab>'] = { 'select_next', 'fallback' },
        },
    },
}
