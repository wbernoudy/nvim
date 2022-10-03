require("nvim-lsp-installer").setup {}
local lspconfig = require("lspconfig")

lspconfig.sumneko_lua.setup {}

lspconfig.pylsp.setup {
    settings = {
        pylsp = {
            configurationSources = {"flake8"},
        }
    }
}
