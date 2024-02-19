return {
  "williamboman/mason.nvim",
  cond = not os.getenv("LIGHT_NVIM"),
  config = true
}
