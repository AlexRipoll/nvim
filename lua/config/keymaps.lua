local map = vim.keymap.set

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- use jk to exit insert mode
map("i", "jk", "<ESC>")

-- Remap for dealing with word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- vertical movement
map('n', '<C-u>', '<C-u>zz', { desc = 'Scroll half page up and recenter' })
map('n', '<C-d>', '<C-d>zz', { desc = 'Scroll half page down and recenter' })
map('n', '<C-f>', '<C-f>zz', { desc = 'Scroll page forward and recenter' })
map('n', '<C-b>', '<C-b>zz', { desc = 'Scroll page backward and recenter' })

-- tree explorer
map('n', '<leader>e', ':Neotree toggle reveal<CR>', { desc = 'Toggle tree explorer' })
map('n', '<leader>n', ':Neotree reveal<CR>', { desc = 'Reveal file in tree explorer' })

-- map('n', '<leader>gs', ':Neotree git_status float toggle<CR>', { desc = 'show git status' })

-- window management
map('n', '<leader>sx', ':close<CR>', { desc = 'Close current split window' })


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
map('i', '<C-h>', '<Left>', { desc = 'Move left' })
map('i', '<C-l>', '<Right>', { desc = 'Move right' })
map('i', '<C-j>', '<Down>', { desc = 'Move down' })
map('i', '<C-k>', '<Up>', { desc = 'Move up' })


-- map({ "n", "x" }, "gw", "*N", { desc = "Search word under cursor" })

-- Clear search with <esc>
map({ "i", "n" }, "<Esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- save file
map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- better indenting
map("v", "<", "<gv", { desc = "Indent to the left" })
map("v", ">", ">gv", { desc = "Indent to the right" })


-- Copy all
map('n', '<C-c>', '<cmd> %y+ <CR>', { desc = 'Copy whole file' })

--
-- LSP
-- map('n', '<leader>fm', vim.lsp.buf.format, { desc = "LSP formatting" })
map({ "n", "v" }, "<leader>fm", function()
  require('conform').format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  })
end, { desc = "Format file or range (in visual mode)" })
map('n', '<leader>rs', ':LspRestart<CR>', { desc = "LSP restart" })

--
-- TELESCOPE
-- See `:help telescope.builtin`
map('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

map('n', '<leader>fb', require('telescope.builtin').buffers, { desc = 'Find existing buffers' })
map('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = 'Search diagnostics' })
map('n', '<leader>ff', require('telescope.builtin').find_files, { desc = 'Search files' })
map('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = 'Search by grep' })
map('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = 'Search help' })
map('n', '<leader>fr', require('telescope.builtin').oldfiles, { desc = 'Search recently opened files' })
map('n', '<leader>fw', require('telescope.builtin').grep_string, { desc = 'Search current word' })
map('n', '<leader>gc', require('telescope.builtin').git_commits, { desc = 'Search Git commits' })
map('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search Git files' })
map('n', '<leader>gs', require('telescope.builtin').git_status, { desc = 'Search Git files' })


--
-- DIAGNOSTICS
map('n', 'gl', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
map('n', 'gn', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
map('n', 'gp', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
map('n', 'gq', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })


-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })


-- Terminal
--
map({ "n", "t" }, "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Open terminal in a floating window" })
map({ "n", "t" }, "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Open terminal horizontaly" })
map({ "n", "t" }, "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", { desc = "Open terminal verticaly" })

function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  map("t", "<esc><esc>", "<C-\\><C-n>", { desc = "Enter Normal Mode" })
  map("t", "jk", "<C-\\><C-n>", { desc = "Enter Normal Mode" })
  map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
  map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
  map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })
  map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to right window" })
  map('t', '<C-w>', [[<C-\><C-n><C-w>]], { desc = "Window" })
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')


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
-- map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
-- map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
-- map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
-- map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
-- map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
-- map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
-- map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
-- map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
-- map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
-- map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
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
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', { desc = "Order by number" })
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', { desc = "Order by directory" })
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', { desc = "Order by language" })
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', { desc = "Order by window number" })

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used

--
-- HARPOON keymaps
--
-- Mark file to revisit later
map('n', '<leader>ha', '<Cmd>lua require("harpoon.mark").add_file()<CR>', { desc = "Add new mark" })
-- File navigation
map('n', '<leader>hl', '<Cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', { desc = "List marks" })
map('n', '<A-1>', '<Cmd>lua require("harpoon.ui").nav_file(1)<CR>', { desc = "Switch to harpoon mark 1" })
map('n', '<A-2>', '<Cmd>lua require("harpoon.ui").nav_file(2)<CR>', { desc = "Switch to harpoon mark 2" })
map('n', '<A-3>', '<Cmd>lua require("harpoon.ui").nav_file(3)<CR>', { desc = "Switch to harpoon mark 3" })
map('n', '<A-4>', '<Cmd>lua require("harpoon.ui").nav_file(4)<CR>', { desc = "Switch to harpoon mark 4" })
map('n', '<A-n>', '<Cmd>lua require("harpoon.ui").nav_next()<CR>', { desc = "Switch to next harpoon mark" })


--
-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

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



--
-- GLOW keymaps
--
map('n', '<leader>p', '<Cmd>Glow<CR>', { desc = 'preview markdown in current buffer' })


--
-- Gopher keymaps
--
map('n', '<leader>ce', '<Cmd>GoIfErr<CR>', { desc = 'generate error handling' })
