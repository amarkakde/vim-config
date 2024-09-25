local keymap = vim.keymap

local M = {}

M.on_attach = function(client, bufnr)
    local opts = {noremap = true, silent = true, buffer = bufnr }

    keymap.set("n", "<leader>gD", "<cmd>Lspsaga goto_definition<CR>", opts) -- go to definition
    keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
    keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
    keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show diagnostic for line
    keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show cursor diagnostics
    keymap.set("n", "<leader>pd", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to prev diagnostic
    keymap.set("n", "<leader>nd", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic
    keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show docs for what is under cursor

    if client.name == "pyright" then
        keymap.set("n", "<leader>oi", "<cmd>PyrightOrganizeImports<CR>", opts)
    end
end

return M
