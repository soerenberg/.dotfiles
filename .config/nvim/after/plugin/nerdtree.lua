-- local builtin = require('nerdtree')
vim.keymap.set('n', '<C-t>', ':NERDTreeToggle<CR>')
vim.cmd('let NERDTreeShowHidden=1')

-- " let nerdtree ignore .pyc files
vim.cmd("let NERDTreeIgnore=['\\.pyc$', '\\~$']")
-- "ignore files in NERDTree')

