-- Clear the highlighting from "hlsearch".
vim.keymap.set("n", "<Esc>", vim.cmd.nohlsearch)

-- Diagnostic keymaps.
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<Leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic error messages" })
vim.keymap.set("n", "<Leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic quickfix list" })

-- -- Disable arrow keys to force hjkl movement.
-- vim.keymap.set("n", "<Left>", "<NOP>")
-- vim.keymap.set("n", "<Down>", "<NOP>")
-- vim.keymap.set("n", "<Up>", "<NOP>")
-- vim.keymap.set("n", "<Right>", "<NOP>")

-- Use Control+hjkl for window switching. See `:help wincmd`.
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move to window to the left of the current one" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move to window below the current one" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move to window above the current one" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move to window to the right of the current one" })

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight yanked text",
    group = vim.api.nvim_create_augroup("text-yank-post", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.keymap.set("n", "Q", "<NOP>", { desc = "Do not replay last macro" })

vim.keymap.set("n", "J", function()
    return "mz" .. vim.v.count .. "J`z"
end, { desc = "Join lines, keep cursor position", expr = true })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down, center screen" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up, center screen" })

vim.keymap.set("n", "n", "nzzzv", { desc = "Repeat forward search, center screen, show cursor" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Repeat reverse search, center screen, show cursor" })
