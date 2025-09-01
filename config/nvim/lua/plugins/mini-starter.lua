return {
    'echasnovski/mini.starter',
    version = '*',
    dependencies = { 'echasnovski/mini.sessions' },
    config = function()

        vim.keymap.set("n", "<Leader>so", ":lua MiniStarter.open()<CR>")

        local starter = require('mini.starter')

        starter.setup({

            autoopen = true,
            evaluate_single = true,
            silent = false,

            items = {
                starter.sections.sessions(5, true),
                starter.sections.recent_files(5, true, false),
                { name = 'Plugin Manager', action = ':Lazy', section = "Plugin Management" },
                { name = 'LSP Servers', action = ':Mason', section = "Plugin Management" },
            },

            header =
                "\n" ..
                "888b    888                  888     888 d8b\n" ..
                "8888b   888                  888     888 Y8P\n" ..
                "88888b  888                  888     888\n" ..
                "888Y88b 888  .d88b.   .d88b. Y88b   d88P 888 88888b.d88b.\n" ..
                "888 Y88b888 d8P  Y8b d88''88b Y88b d88P  888 888 '888 '88b\n" ..
                "888  Y88888 88888888 888  888  Y88o88P   888 888  888  888\n" ..
                "888   Y8888 Y8b.     Y88..88P   Y888P    888 888  888  888\n" ..
                "888    Y888  'Y8888   'Y88P'     Y8P     888 888  888  888\n" ..
                "\n",

            footer = "<C-c> to close startup screen.",

            content_hooks = {
                function(content)
                    local blank_content_line = {{ type = "empty", string = "" }}
                    local section_coords = starter.content_coords(content, 'section')
                    -- Insert backwards to not affect coordinates
                    for i = #section_coords, 1, -1 do
                        table.insert(content, section_coords[i].line + 1, blank_content_line)
                    end
                    return content
                end,
                starter.gen_hook.adding_bullet("  "),
                starter.gen_hook.aligning('center', 'center'),
            },

            query_updaters = 'abcdefghijklmnopqrstuvwxyz0123456789_-.',

        })
    end
}
