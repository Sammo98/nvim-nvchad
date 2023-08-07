---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["q"] = { "", opts = { nowait = true } },
    ["<leader>wi"] = { "<C-w>", opts = { nowait = true } },
    ["<leader>A"] = { "gg<S-v>G", opts = { nowait = true } },
    ["C-d"] = { "<C-d>zz", opts = { nowait = true } },
    ["C-u"] = { "<C-u>zz", opts = { nowait = true } },
  },
  x = {
    ["p"] = { "P", opts = { nowait = true} },
  },
}

-- more keybinds!

return M
