local modules = {
  animate = {},
  bufremove = {},
  comment = {},
  cursorword = {
    delay = 500,
  },
  indentscope = {},
  pairs = {
    mappings = {
      ['('] = { action = 'open', pair = '()', neigh_pattern = '[^\\][^%)]' },
      ['['] = { action = 'open', pair = '[]', neigh_pattern = '[^\\][^%]]' },
      ['{'] = { action = 'open', pair = '{}', neigh_pattern = '[^\\][^%}]' },
    }
  }
}

for m, o in pairs(modules) do
  local ok, module = pcall(require, "mini." .. m)
  if ok then
    module.setup(o)
  end
end
