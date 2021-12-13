local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function (server)
  local opts = {}
  opts.capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
--  opts.capabilities = require('coq').lsp_ensure_capabilities(vim.lsp.protocol.make_client_capabilities())
  server:setup(opts) -- this :setup() function is exactly[1] the same as lspconfig's setup() function
    vim.cmd [[ do User LspAttachBuffers ]]
end)

-- Provide settings first!
lsp_installer.settings {
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
}


