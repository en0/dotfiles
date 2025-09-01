return {
    'nvim-treesitter/nvim-treesitter',
    config = function()
        require('nvim-treesitter.configs').setup({
            ensure_installed = {
                "asm", "bash", "c", "c_sharp", "cmake", "cpp", "css", "csv", "desktop", "diff",
                "disassembly", "dockerfile", "git_config", "git_rebase", "gitcommit", "gitignore",
                "go", "helm", "hcl", "html", "ini", "java", "javascript", "jinja", "jinja_inline",
                "jq", "json", "lua", "markdown", "markdown_inline", "nginx", "objdump", "passwd",
                "php", "printf", "properties", "python", "regex", "rego", "robots", "rust",
                "scala", "scss", "sql", "ssh_config", "strace", "terraform", "toml", "vimdoc",
                "xml", "yaml", "yang",
            },
            sync_install = true,
            auto_install = true,
            highlight = {enable = true}
        })
    end
}
