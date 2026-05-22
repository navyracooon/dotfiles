vim.filetype.add({
    pattern = {
        [".*%.sh%.tmpl"] = "sh",
        [".*%.bash%.tmpl"] = "sh",
        [".*%.zsh%.tmpl"] = "zsh",
        [".*zshrc%.tmpl"] = "zsh",
        [".*bashrc%.tmpl"] = "sh",
        [".*bash_profile%.tmpl"] = "sh",
        [".*profile%.tmpl"] = "sh",
        [".*%.toml%.tmpl"] = "toml",
        [".*%.ya?ml%.tmpl"] = "yaml",
        [".*%.json%.tmpl"] = "json",
        [".*%.md%.tmpl"] = "markdown",
        [".*gitconfig%.tmpl"] = "gitconfig",
    },
})
