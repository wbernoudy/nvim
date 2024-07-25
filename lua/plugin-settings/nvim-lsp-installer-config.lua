require("nvim-lsp-installer").setup({
    ensure_installed = { "pylsp", "clangd" },
    automatic_installation = true,
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

local lspconfig = require("lspconfig")
require('lspconfig').pylsp.setup {
    -- on_attach = on_attach,

    capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    settings = {
        pylsp = {
            configurationSources = { "flake8" },
            plugins = {
                flake8 = { enabled = true },
                black = { enabled = true, preview = true },
                mccabe = { enabled = true },

                pylsp_mypy = { 
                    enabled = true,
                    -- live_mode = false,
                    -- dmypy = true,
                },

                yapf = { enabled = false },
                pycodestyle = { enabled = false },
                pyflakes = { enabled = false },
            }
        }
    }
}

require('lspconfig').clangd.setup {
    -- on_attach = on_attach,

    capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    settings = {
        clangd = {
        }
    }
}

require('lspconfig').julials.setup {
}
