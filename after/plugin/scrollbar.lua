local ok, scrollbar = pcall(require, "scrollbar")
if not ok then return end

scrollbar.setup()

local ok, gitsigns = pcall(require, "scrollbar.handlers.gitsigns")
if not ok then return end

gitsigns.setup()
