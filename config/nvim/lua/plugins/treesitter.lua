return {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    config = function()
        require('nvim-treesitter').install {
            "asm", "bash", "c", "c_sharp", "cmake", "cpp", "css", "csv", "desktop", "diff",
            "disassembly", "dockerfile", "git_config", "git_rebase", "gitcommit", "gitignore",
            "go", "helm", "hcl", "html", "ini", "java", "javascript", "jinja", "jinja_inline",
            "jq", "json", "lua", "markdown", "markdown_inline", "nginx", "objdump", "passwd",
            "php", "printf", "properties", "python", "regex", "rego", "robots_txt", "rust",
            "scala", "scss", "sql", "ssh_config", "strace", "terraform", "toml", "vimdoc",
            "xml", "yaml", "yang",
        }
    end
}
