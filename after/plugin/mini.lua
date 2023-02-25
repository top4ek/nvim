local modules = {
  animate = {},
  bufremove = {},
  options = {
    ignore_blank_line = true,
    start_of_line = true
  },
  comment = {},
  cursorword = {
    delay = 500,
  },
  indentscope = {},
  pairs =  {}
}

for m, o in pairs(modules) do
  local ok, module = pcall(require, "mini." .. m)
  if ok then
    module.setup(o)
  end
end
