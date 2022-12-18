local ok, neoscroll = pcall(require, "neoscroll")
if not ok then return end

neoscroll.setup {
  hide_cursor = false,
  easing_function = "sine"
}
