-- csv.vim (chrisbra) configuration
-- Rainbow column highlighting
vim.g.csv_highlight_column = 'y'

-- Don't conceal delimiters (keep them visible)
vim.g.csv_no_conceal = 1

-- Auto-arrange columns on open for better readability
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "csv", "tsv" },
  callback = function()
    -- Set TSV delimiter
    if vim.bo.filetype == "tsv" or vim.fn.expand("%:e") == "tsv" then
      vim.b.csv_delimiter = "\t"
    end

    -- Auto-arrange columns for visual alignment
    vim.schedule(function()
      local line_count = vim.api.nvim_buf_line_count(0)
      if line_count <= 50000 then
        pcall(vim.cmd, "%ArrangeColumn!")
      end
    end)

    -- Keybinds for CSV navigation
    vim.keymap.set("n", "<leader>ch", "<cmd>Header<CR>", { buffer = true, desc = "CSV: Pin header" })
    vim.keymap.set("n", "<leader>cu", "<cmd>Header!<CR>", { buffer = true, desc = "CSV: Unpin header" })
    vim.keymap.set("n", "<leader>ca", "<cmd>%ArrangeColumn!<CR>", { buffer = true, desc = "CSV: Arrange columns" })
    vim.keymap.set("n", "<leader>cU", "<cmd>%UnArrangeColumn<CR>", { buffer = true, desc = "CSV: Unarrange columns" })
    vim.keymap.set("n", "<leader>cw", "<cmd>WhatColumn<CR>", { buffer = true, desc = "CSV: What column?" })
  end,
})
