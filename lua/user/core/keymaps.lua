local opts = { noremap = true, silent = true }
local map = vim.keymap.set

vim.g.mapleader = " "

map("n", "<leader><leader>", function()
	vim.cmd("so")
end)

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })

map("n", "<leader>ee", "<cmd>Neotree toggle<CR>")

map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
map("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "<C-s>", ":w<CR>", { desc = "save file" })

map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- paste over selection without loosing yanked
map("x", "p", [["_dP]])

-- yank to system clipboard
map("n", "<leader>Y", [["+Y]], opts)

-- leader d delete wont remember as yanked/clipboard when delete pasting
map({ "n", "v" }, "<leader>d", [["_d]])

-- ctrl c as escape cuz Im lazy to reach up to the esc key
map("i", "<C-c>", "<Esc>")
map("n", "<C-c>", ":nohl<CR>", { desc = "Clear search hl", silent = true })
-- format without prettier using the built in
-- map("n", "<leader>f", vim.lsp.buf.format)

-- Unmaps Q in normal mode
map("n", "Q", "<nop>")

--Stars new tmux session from in here
map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- prevent x delete from registering when next paste
map("n", "x", '"_x', opts)

-- Replace the word cursor is on globally
map(
	"n",
	"<leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace word cursor is on globally" }
)
-- Executes shell command from in here making file executable
map("n", "<leader>X", "<cmd>!chmod +x %<CR>", { silent = true, desc = "makes file executable" })

-- tab stuff
map("n", "<leader>to", "<cmd>tabnew<CR>") --open new tab
map("n", "<leader>tx", "<cmd>tabclose<CR>") --close current tab
map("n", "<leader>tn", "<cmd>tabn<CR>") --go to next
map("n", "<leader>tp", "<cmd>tabp<CR>") --go to pre
map("n", "<leader>tf", "<cmd>tabnew %<CR>") --open current tab in new tab

--split management
map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
-- split window vertically
map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
-- split window horizontally
map("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
-- close current split window
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Copy filepath to the clipboard
map("n", "<leader>fp", function()
	local filePath = vim.fn.expand("%:~")
	vim.fn.setreg("+", filePath)
	print("File path copied to clipboard: " .. filePath)
end, { desc = "Copy file path to clipboard" })

-- restart
map("n", "<leader>re", "<cmd>restart<cr>", {
	desc = "Restart Neovim (:restart)",
})
