local overrides = require "custom.plugins.overrides"

vim.opt.list = true
vim.opt.listchars:append "space:⋅"

return {

  -- ["goolord/alpha-nvim"] = { disable = false } -- enables dashboard

  -- Override plugin definition options
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end
  },

  -- overrde plugin configs
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter
  },

  ["williamboman/mason.nvim"] = {override_options = overrides.mason},

  -- Install a plugin
  ["max397574/better-escape.nvim"] = {
    event = "InsertEnter",
    config = function() require("better_escape").setup() end
  },

  -- code formatting, linting etc
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function() require "custom.plugins.null-ls" end
  },

  ["akinsho/toggleterm.nvim"] = {
    config = function()
      require("toggleterm").setup({open_mapping = [[<c-\>]]})
    end
  },

  ["ray-x/lsp_signature.nvim"] = {
    config = function()
      cfg = {
        doc_lines = 10,
        max_height = 12,
        max_width = 80,
        wrap = true,
        floating_window = true,
        floating_window_above_cur_line = true,
        toggle_key = "<M-x>"
      }
      require("lsp_signature").setup(cfg)
    end
  },
  ["simrat39/rust-tools.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      local rt = require("rust-tools")

      rt.setup({
        server = {
          on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
          end,
        },
      })

    end
  },
  ["danymat/neogen"] = {
    requires = "nvim-treesitter/nvim-treesitter",
    config = function ()
      require('neogen').setup {
        languages = {
          ['cpp.doxygen'] = require('neogen.configurations.cpp')
        },
      }
    end,
  },
  ["rcarriga/nvim-dap-ui"] = {
    requires = {"mfussenegger/nvim-dap"},
  },
  ["ldelossa/nvim-dap-projects"] = {
    requires = "rcarriga/nvim-dap-ui",
    config = function ()
      local ndp = require('nvim-dap-projects')
      ndp.search_project_config()
    end
  }

  -- remove plugin
  -- ["hrsh7th/cmp-path"] = false,
}
