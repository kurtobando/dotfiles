-- Helper for CoC documentation
local function show_documentation()
  if vim.fn.CocAction('hasProvider', 'hover') == 1 then
    vim.fn.CocActionAsync('doHover')
  else
    vim.api.nvim_feedkeys('K', 'in', false)
  end
end

-- Helper for backspace check (CoC tab completion)
local function check_backspace()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Window navigation
vim.keymap.set('n', '<C-Up>', '<C-w>k', { desc = 'Move to window above' })
vim.keymap.set('n', '<C-Down>', '<C-w>j', { desc = 'Move to window below' })
vim.keymap.set('n', '<C-Left>', '<C-w>h', { desc = 'Move to window left' })
vim.keymap.set('n', '<C-Right>', '<C-w>l', { desc = 'Move to window right' })

-- Buffer navigation
vim.keymap.set('n', '[b', ':bprevious<CR>', { silent = true, desc = 'Previous Buffer' })
vim.keymap.set('n', ']b', ':bnext<CR>', { silent = true, desc = 'Next Buffer' })
vim.keymap.set('n', '<leader>bd', ':bd<CR>', { silent = true, desc = 'Delete Buffer' })

-- Telescope
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'Find Files' })
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { desc = 'Live Grep' })
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { desc = 'Find Buffers' })
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { desc = 'Help Tags' })
vim.keymap.set('n', '<leader>fe', '<cmd>Telescope file_browser<cr>', { desc = 'File Browser' })

-- NvimTree
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { silent = true, desc = 'File Explorer' })

-- Quit
vim.keymap.set('n', '<leader>qq', ':q<CR>', { silent = true, desc = 'Quit' })

-- CoC navigation (remap required for <Plug>)
vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', { silent = true, remap = true, desc = 'Go to Definition' })
vim.keymap.set('n', 'gy', '<Plug>(coc-type-definition)', { silent = true, remap = true, desc = 'Go to Type Definition' })
vim.keymap.set('n', 'gi', '<Plug>(coc-implementation)', { silent = true, remap = true, desc = 'Go to Implementation' })
vim.keymap.set('n', 'gr', '<Plug>(coc-references)', { silent = true, remap = true, desc = 'Go to References' })

-- Documentation
vim.keymap.set('n', 'K', show_documentation, { silent = true, desc = 'Show Documentation' })
vim.keymap.set('n', '<C-Space>', show_documentation, { silent = true, desc = 'Show Documentation' })

-- CoC code actions
vim.keymap.set('n', '<leader>rn', '<Plug>(coc-rename)', { silent = true, remap = true, desc = 'Rename Symbol' })
vim.keymap.set('n', '<leader>ac', '<Plug>(coc-codeaction)', { silent = true, remap = true, desc = 'Code Action' })
vim.keymap.set('n', '<leader>aC', '<Plug>(coc-codeaction-cursor)', { silent = true, remap = true, desc = 'Code Action at Cursor' })
vim.keymap.set('v', '<leader>ac', '<Plug>(coc-codeaction-selected)', { silent = true, remap = true, desc = 'Code Action on Selection' })

-- Diagnostics
vim.keymap.set('n', '<leader>ca', ':<C-u>CocList diagnostics<cr>', { silent = true, desc = 'Show All Diagnostics' })
vim.keymap.set('n', '[g', '<Plug>(coc-diagnostic-prev)', { silent = true, remap = true, desc = 'Previous Diagnostic' })
vim.keymap.set('n', ']g', '<Plug>(coc-diagnostic-next)', { silent = true, remap = true, desc = 'Next Diagnostic' })

-- CoC lists
vim.keymap.set('n', '<leader>cc', ':<C-u>CocList commands<cr>', { silent = true, desc = 'Show Commands' })
vim.keymap.set('n', '<leader>co', ':<C-u>CocList outline<cr>', { silent = true, desc = 'Show Symbols Outline' })

-- Formatting
vim.keymap.set('n', '<leader>Ff', ':Format<CR>', { silent = true, desc = 'Format File' })
vim.keymap.set('n', '<leader>FF', ':FormatWrite<CR>', { silent = true, desc = 'Format and Save' })
vim.keymap.set('v', '<leader>Fs', '<Plug>(coc-format-selected)', { silent = true, remap = true, desc = 'Format Selected' })

-- Folding
vim.keymap.set('n', '<leader>=', 'za', { desc = 'Toggle Fold' })
vim.keymap.set('n', '<leader>+', 'zR', { desc = 'Open All Folds' })
vim.keymap.set('n', '<leader>-', 'zM', { desc = 'Close All Folds' })

-- Git (Fugitive)
vim.keymap.set('n', '<leader>gs', ':Git<CR>', { silent = true, desc = 'Git Status' })
vim.keymap.set('n', '<leader>gb', ':Git blame<CR>', { silent = true, desc = 'Git Blame' })
vim.keymap.set('n', '<leader>gd', ':Gdiffsplit<CR>', { silent = true, desc = 'Git Diff' })
vim.keymap.set('n', '<leader>gl', ':Git log<CR>', { silent = true, desc = 'Git Log' })
vim.keymap.set('n', '<leader>gc', ':Git commit<CR>', { silent = true, desc = 'Git Commit' })
vim.keymap.set('n', '<leader>gp', ':Git push<CR>', { silent = true, desc = 'Git Push' })
vim.keymap.set('n', '<leader>gP', ':Git pull<CR>', { silent = true, desc = 'Git Pull' })
vim.keymap.set('n', '<leader>gf', ':Git fetch<CR>', { silent = true, desc = 'Git Fetch' })
vim.keymap.set('n', '<leader>gr', ':Gread<CR>', { silent = true, desc = 'Git Read' })
vim.keymap.set('n', '<leader>gw', ':Gwrite<CR>', { silent = true, desc = 'Git Write' })
vim.keymap.set('n', '<leader>ge', ':Gedit<CR>', { silent = true, desc = 'Git Edit' })
vim.keymap.set('n', '<leader>gm', ':Git merge<CR>', { silent = true, desc = 'Git Merge' })

-- Clear search highlight
vim.keymap.set('n', '<Esc>', ':noh<CR>', { silent = true, desc = 'Clear Search Highlight' })

-- Insert mode: CoC completion refresh
vim.keymap.set('i', '<C-Space>', 'coc#refresh()', { expr = true, silent = true, desc = 'Trigger completion' })

-- Insert mode: CoC completion navigation
vim.keymap.set('i', '<Tab>', function()
  if vim.fn['coc#pum#visible']() == 1 then
    return vim.fn['coc#pum#next'](1)
  elseif check_backspace() then
    return '<Tab>'
  else
    return vim.fn['coc#refresh']()
  end
end, { expr = true, silent = true, replace_keycodes = true })

vim.keymap.set('i', '<S-Tab>', function()
  if vim.fn['coc#pum#visible']() == 1 then
    return vim.fn['coc#pum#prev'](1)
  else
    return '<C-h>'
  end
end, { expr = true, silent = true, replace_keycodes = true })

vim.keymap.set('i', '<CR>', function()
  if vim.fn['coc#pum#visible']() == 1 then
    return vim.fn['coc#pum#confirm']()
  else
    return '<C-g>u<CR><c-r>=coc#on_enter()<CR>'
  end
end, { expr = true, silent = true, replace_keycodes = true })

-- Copilot
vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false, silent = true, script = true, desc = 'Accept Copilot suggestion' })
vim.keymap.set('i', '<C-n>', '<Plug>(copilot-next)', { remap = true, silent = true, desc = 'Next Copilot suggestion' })
vim.keymap.set('i', '<C-p>', '<Plug>(copilot-previous)', { remap = true, silent = true, desc = 'Previous Copilot suggestion' })
vim.keymap.set('i', '<C-\\>', '<Plug>(copilot-dismiss)', { remap = true, silent = true, desc = 'Dismiss Copilot' })
