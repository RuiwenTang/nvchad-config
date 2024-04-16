-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  config = function ()
    -- code
    require("nvim-treesitter.install").prefer_git = true

    require("nvim-treesitter.configs").setup({
      ensure_installed = {"c", "lua", "cpp"},
      highlight = { enable = true },
    })
  end
}
