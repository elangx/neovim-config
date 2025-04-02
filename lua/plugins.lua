local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- onedarkpro theme
  -- {
  --   "olimorris/onedarkpro.nvim",
  --   priority = 1000,
  -- },
  -- solarized
  {
    'ishan9299/nvim-solarized-lua',
    lazy = false,
    priority = 1000,
    ---@type solarized.config
    opts = {},
    config = function(_, opts)
      -- vim.o.background = "dark" -- or "light" for light mode
      vim.cmd([[colorscheme solarized]])
    end,
  },
  -- Vscode-like pictograms
  {
    "onsails/lspkind.nvim",
    event = { "VimEnter" },
  },
  -- Auto-completion engine
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "lspkind.nvim",
      "hrsh7th/cmp-nvim-lsp", -- lsp auto-completion
      "hrsh7th/cmp-buffer", -- buffer auto-completion
      "hrsh7th/cmp-path", -- path auto-completion
      "hrsh7th/cmp-cmdline", -- cmdline auto-completion
    },
    config = function()
      require("config.nvim-cmp")
    end,
  },
  -- Code snippet engine
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
  },
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  -- Treesitter-integration
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("config.nvim-treesitter")
    end,
  },
  -- Nvim-treesitter text objects
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("config.nvim-treesitter-textobjects")
    end,
  },
  -- Git integration
  "tpope/vim-fugitive",
  -- Git decorations
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("config.gitsigns")
    end,
  },
  -- UI decorate
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- Add any options here
    },
    dependencies = {
      -- If you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  },
  -- Show indentation and blankline
  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  --   main = "ibl",
  --   config = function()
  --     require("config.indent-blankline")
  --   end,
  -- },
  -- Smart motion
  -- Usage: Enter a 2-character search pattern then press a label character to
  --        pick your target.
  --        Initiate the sesarch with `s`(forward) or `S`(backward)
  {
    "ggandor/leap.nvim",
    config = function()
      -- See `:h leap-custom-mappings` for more details
      require("leap").create_default_mappings()
    end,
  },
  -- Make surrounding easier
  -- ------------------------------------------------------------------
  -- Old text                    Command         New text
  -- ------------------------------------------------------------------
  -- surr*ound_words             gziw)           (surround_words)
  -- *make strings               gz$"            "make strings"
  -- [delete ar*ound me!]        gzd]            delete around me!
  -- remove <b>HTML t*ags</b>    gzdt            remove HTML tags
  -- 'change quot*es'            gzc'"           "change quotes"
  -- delete(functi*on calls)     gzcf            function calls
  -- ------------------------------------------------------------------
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    -- You can use the VeryLazy event for things that can
    -- load later and are not important for the initial UI
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- To solve the conflicts with leap.nvim
        -- See: https://github.com/ggandor/leap.nvim/discussions/59
        keymaps = {
          insert = "<C-g>z",
          insert_line = "gC-ggZ",
          normal = "gz",
          normal_cur = "gZ",
          normal_line = "gzgz",
          normal_cur_line = "gZgZ",
          visual = "gz",
          visual_line = "gZ",
          delete = "gzd",
          change = "gzc",
        },
      })
    end,
  },
  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("config.lualine")
    end,
  },
  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },
    config = function()
      require("config.nvim-tree")
    end,
  },
  -- Better terminal integration
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("config.toggleterm")
    end,
  },
  -- Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("config.telescope")
    end,
  },
  -- A pretty list for showing diagnostics, references, telescope results, quickfix and location lists
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
    opts = function()
      require("config.trouble")
    end,
  },
  -- Improve the performance of big file
  {
    "pteroctopus/faster.nvim",
  },
  -- Style the buffer manage
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function() 
      vim.opt.termguicolors = true
      require("bufferline").setup{
        options = {
          mode = "buffer",
          -- 显示id
          numbers = "ordinal",
          highlight = {
            underline = true,
          },
          indicatoer = {
            style = "underline"
          },
          buffer_close_icon = '󰅖',
          modified_icon = '● ',
          close_icon = ' ',
          left_trunc_marker = ' ',
          right_trunc_marker = ' ',
          -- 使用 nvim 内置lsp
          diagnostics = "nvim_lsp",
          -- 左侧让出 nvim-tree 的位置
          offsets = {{
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left"
          }}
        }
      }
    end,
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
  },
  {
    "FabijanZulj/blame.nvim",
    lazy = false,
    config = function()
      require('blame').setup {}
    end,
    opts = {
      blame_options = { '-w' },
  },
  {
      "ray-x/go.nvim",
      config = function()
        require("go").setup()
      end,
      event = {"CmdlineEnter"},
      ft = {"go", 'gomod'},
      build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
    }
  }
})