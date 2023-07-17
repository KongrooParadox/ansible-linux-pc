-- LSP settings.
-- This function gets run when an LSP connects to a particular buffer.
-- Thank you TJ Devries !
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

return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            {
                'neovim/nvim-lspconfig',
            },
            {
                -- Additional lua configuration, makes nvim stuff amazing
                'folke/neodev.nvim',
                config = true,
                lazy = true,
            },
            {
                -- Automatically install LSPs to stdpath for neovim
                'williamboman/mason.nvim',
                config = true,
            },
            {
                'williamboman/mason-lspconfig.nvim',
            },
            {
                'hrsh7th/nvim-cmp',
                dependencies = {
                    'hrsh7th/cmp-nvim-lsp',
                    'hrsh7th/cmp-nvim-lua',
                    'L3MON4D3/LuaSnip',
                    'saadparwaiz1/cmp_luasnip',
                },
            },
        },
        config = function()
            local lsp = require("lsp-zero")
            lsp.preset("recommended")
            lsp.ensure_installed({
                "ansiblels",
                "bashls",
                "gopls",
                "docker_compose_language_service",
                "dockerls",
                "terraformls",
                "yamlls",
                "lua_ls"
            })

            require("lspconfig").ansiblels.setup {
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
            }
            -- require("mason").setup()
            -- require("mason-lspconfig").setup({
            --     ensure_installed = vim.tbl_keys(servers),
            -- })
            require("neodev").setup()
            lsp.nvim_workspace()

            local cmp = require('cmp')
            local cmp_select = {behavior = cmp.SelectBehavior.Select}
            local cmp_mappings = lsp.defaults.cmp_mappings({
                ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            })

            lsp.setup_nvim_cmp({
                mapping = cmp_mappings
            })

            lsp.on_attach = on_attach
            lsp.setup()
            vim.diagnostic.config({
                virtual_text = true
            })
            -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
            -- require('mason-lspconfig').setup_handlers {
            --     function(server_name)
            --         require('lspconfig')[server_name].setup {
            --             capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities),
            --             on_attach = on_attach,
            --             settings = servers[server_name],
            --         }
            --     end,
            -- }
        end
    },
    -- Useful status updates for LSP
    {
        'j-hui/fidget.nvim',
        tag = 'legacy',
        config = function()
            require("fidget").setup()
        end
    },
    {
        'jay-babu/mason-nvim-dap.nvim',
        cmd = { 'DapInstall', 'DapUninstall' },
        opts = {
            automatic_installation = true,
            handlers = {},
            ensure_installed = {
                'codelldb',
            },
        }
    },
    {
        'mfussenegger/nvim-ansible'
    }
}
