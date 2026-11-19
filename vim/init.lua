vim.opt.runtimepath:prepend(vim.env.HOME .. '/.vim')
vim.opt.runtimepath:append(vim.env.HOME .. '/.vim/after')
vim.opt.packpath = vim.opt.runtimepath:get()

vim.cmd('source ~/.vimrc')

vim.cmd [[
  highlight Normal guibg=NONE
  highlight NonText guibg=NONE
]]

vim.fn.sign_define('DiagnosticSignError', { text = '🔥', texthl = 'DiagnosticError' })
vim.fn.sign_define('DiagnosticSignWarn',  { text = '❗️', texthl = 'DiagnosticWarn' })
vim.fn.sign_define('DiagnosticSignInfo',  { text = '✨', texthl = 'DiagnosticInfo' })
vim.fn.sign_define('DiagnosticSignHint',  { text = '💡', texthl = 'DiagnosticHint' })

vim.cmd("highlight Cursor guibg=#928374 guifg=NONE")

 local screenkey_available = vim.fn.has("nvim-0.8") == 1
   and vim.fn.getenv("NVIM_SCREENKEY") ~= nil
   and pcall(require, "Screenkey")

if screenkey_available then
   vim.g.screenkey_statusline_component = 1
   vim.o.winbar = "%{%v:lua.require('screenkey').get_keys()%}"
   vim.api.nvim_set_keymap("n", "sc", ":Screenkey<CR>", { noremap = true, silent = true })
   require("screenkey").setup({
     win_opts = {
       width = 90,
     },
   })
end

local ok, screenkey = pcall(require, "screenkey")
if ok then
  screenkey.setup({
    win_opts = {
      width = 90,
    },
    -- Escape '%' so it doesn't break winbar formatting
    keys = {
      ["%"] = "%%",
    },
  })

  -- Enable statusline/winbar mode on startup (or toggle via keymap)
  screenkey.toggle_statusline_component()

  vim.o.winbar = "%{%v:lua.require('screenkey').get_keys()%}"

  -- Force winbar redraw when keys update or clear
  vim.api.nvim_create_autocmd("User", {
    pattern = { "ScreenkeyUpdated", "ScreenkeyCleared" },
    callback = function()
      vim.cmd("redrawstatus")
    end,
  })

  -- Toggle the winbar output with 'sc' (use "<cmd>Screenkey<CR>" for the floating window)
  vim.keymap.set("n", "sc", function()
    screenkey.toggle_statusline_component()
  end, { silent = true, desc = "Toggle Screenkey winbar" })
end


-- requires >0.11
require("nvim-treesitter-textobjects").setup({
  select = {
    lookahead = true,
  },
})

vim.keymap.set({ "x", "o" }, "af", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
end)

vim.keymap.set({ "x", "o" }, "if", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
end)
