local modules = {
  'mini.animate',
  'mini.bufremove',
  'mini.comment',
  'mini.cursorword',
  'mini.indentscope',
  'mini.pairs'
}

for i, m in ipairs(modules) do
  local ok, module = pcall(require, m)
  if ok then
    module.setup()
  end
end
