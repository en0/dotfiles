return {
    'nvim-lualine/lualine.nvim',
    dependencies = {'nvim-tree/nvim-web-devicons'},
    opts = {
        extentions = { "nvim-tree" },
        options = {
            icons_enabled = true,
            theme = 'auto',
            section_separators = { left = '', right = '' },
            component_separators = { left = '', right = '' },
        }
    }

}
