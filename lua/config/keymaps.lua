local map = vim.keymap.set

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- use jk to exit insert mode
map("i", "jk", "<ESC>")

-- Remap for dealing with word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

map('n', '<leader>rrnn', '<cmd> set rnu! <CR>', { desc = 'toggle relative number' })
map('n', ';', ':', { desc = 'enter command mode' })

-- vertical movement
map('n', '<C-u>', '<C-u>zz', { desc = 'scroll half page up and recenter' })
map('n', '<C-d>', '<C-d>zz', { desc = 'scroll half page down and recenter' })
map('n', '<C-f>', '<C-f>zz', { desc = 'scroll page forward and recenter' })
map('n', '<C-b>', '<C-b>zz', { desc = 'scroll page backward and recenter' })

-- tree explorer
map('n', '<leader>e', ':Neotree toggle<CR>', { desc = 'toggle tree explorer' })

map('n', '<leader>gs', ':Neotree git_status float toggle<CR>', { desc = 'show git status' })

-- window management
map('n', '<leader>sx', ':close<CR>', { desc = 'close current split window' })


-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- navigate within insert mode
map('i', '<C-h>', '<Left>', { desc = 'move left' })
map('i', '<C-l>', '<Right>', { desc = 'move right' })
map('i', '<C-j>', '<Down>', { desc = 'move down' })
map('i', '<C-k>', '<Up>', { desc = 'move up' })


-- map({ "n", "x" }, "gw", "*N", { desc = "Search word under cursor" })

-- Clear search with <esc>
map({ "i", "n" }, "<Esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- save file
map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "save file" })

-- better indenting
map("v", "<", "<gv", { desc = "indent to the left" })
map("v", ">", ">gv", { desc = "indent to the right" })


-- Copy all
map('n', '<C-c>', '<cmd> %y+ <CR>', { desc = 'copy whole file' })


--
-- LSP
map('n', '<leader>fm', vim.lsp.buf.format, { desc = "lsp formatting" })



--
-- TELESCOPE
-- See `:help telescope.builtin`
map('n', '<leader>sr', require('telescope.builtin').oldfiles, { desc = '[S]earch [R]ecently opened files' })
map('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
map('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

map('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
map('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
map('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
map('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
map('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
map('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

--
-- DIAGNOSTICS
map('n', 'gp', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
map('n', 'gn', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
map('n', 'gl', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
map('n', 'gq', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })


-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })



--
-- BARBAR keymaps
--
local opts = { noremap = true, silent = true }
-- Move to previous/next
map('n', '<A-h>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-l>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<S-Tab>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<Tab>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map('n', '<leader>x', '<Cmd>BufferClose<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used


--
-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

--
-- -- Terminal Mappings
-- map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
-- map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
-- map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
-- map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })
-- map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to right window" })
-- map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
-- map("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })
--
-- -- windows
-- map("n", "<leader>ww", "<C-W>p", { desc = "Other window", remap = true })
-- map("n", "<leader>wd", "<C-W>c", { desc = "Delete window", remap = true })
-- map("n", "<leader>w-", "<C-W>s", { desc = "Split window below", remap = true })
-- map("n", "<leader>w|", "<C-W>v", { desc = "Split window right", remap = true })
-- map("n", "<leader>-", "<C-W>s", { desc = "Split window below", remap = true })
-- map("n", "<leader>|", "<C-W>v", { desc = "Split window right", remap = true })

--
-- -- Clear search, diff update and redraw
-- -- taken from runtime/lua/_editor.lua
-- map(
--   "n",
--   "<leader>ur",
--   "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
--   { desc = "Redraw / clear hlsearch / diff update" }
-- )
