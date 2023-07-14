-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  local nmap_lsp = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap_lsp('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap_lsp('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap_lsp('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap_lsp('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap_lsp('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap_lsp('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap_lsp('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap_lsp('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap_lsp('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap_lsp('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap_lsp('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap_lsp('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap_lsp('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap_lsp('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
  rust_analyzer = {},
  ansiblels = {
    filetypes = {
      "yaml.ansible"
    },
    settings = {
      ansible = {
        ansible = {
          path = "ansible",
          useFullyQualifiedCollectionNames = true
        },
        ansibleLint = {
          enabled = true,
          path = "ansible-lint"
        },
        executionEnvironment = {
          enabled = false
        },
        python = {
          interpreterPath = "python3"
        },
        completion = {
          provideRedirectModules = true,
          provideModuleOptionAliases = true
        }
      },
    },
  },
  bashls = {},
  gopls = {},
  docker_compose_language_service = {},
  dockerls = {},
  terraformls = {},
  yamlls = {},
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      diagnostics = {
        globals = { 'vim' }
      },
    },
  },
}

-- Setup neovim lua configuration
require('neodev').setup()
--
-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Setup mason so it can manage external tooling
require('mason').setup()

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}

-- Turn on lsp status information
require('fidget').setup()

