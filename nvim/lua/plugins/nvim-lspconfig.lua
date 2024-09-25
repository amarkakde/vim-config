local on_attach = require("util.lsp").on_attach

local config = function()
    require("neoconf").setup({})
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local lspconfig = require("lspconfig")

    local signs = {
            Error = "✖",
            Warn = "⚠",
            Info = "ℹ",
            Hint = "➤",
        }
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = ""})
    end

    local capabilities = cmp_nvim_lsp.default_capabilities()
    
    -- python configuration
    lspconfig.pyright.setup{
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
            pyright = {
                disableOrganizeImports = false,
                analysis = {
                    useLibraryCodeForTypes = true,
                    autoSearchPaths = true,
                    diagnosticMode = "workspace",
                    autoImportCompletions = true,
                },
            },
        },

    }

    --python linter formatter
    local flake8 = require("efmls-configs.linters.flake8")
    local black  = require("efmls-configs.formatters.black")

    -- javascript and typescript configuration
    lspconfig.ts_ls.setup({
        on_attach = on_attach,
        capabilities = capabilites,
        filetypes = {
            "typescript",
            "javascript",
        },
        root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
    })

    -- typescript linter & formatter
    local eslint_d = require("efmls-configs.linters.eslint_d")
    local prettierd = require("efmls-configs.formatters.prettier_d")

    -- configure efm server
    lspconfig.efm.setup({
        filetypes = {
            "python",
            "typescript",
            "javascript",
        },
        init_options = {
            documentFormatting = true,
            documentRangeFormatting = true,
            hover = true,
            documentSymbol = true,
            codeActions = true,
            completion = true,
        },
        settings = {
            langauges = {
                python = {flake8, black },
                typescript = {eslint_d, prettier_d}
            },
        },

    })

    -- format on save
    local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingzGroup", {})
    vim.api.nvim_create_autocmd("BufWritePost", {
        group = lsp_fmt_group,
        callback =  function()
            local efm = vim.lsp.get_active_clients({name = "efm"})

            if vim.tbl_isempty(efm) then
                return
            end

            vim.lsp.buf.format({name = "efm"})
        end,
    })

end


return {
    "neovim/nvim-lspconfig",
    config = config,
    lazy = false,
    dependencies = {
        "windwp/nvim-autopairs",
        "williamboman/mason.nvim",
        "creativenull/efmls-configs-nvim",
    },
}
