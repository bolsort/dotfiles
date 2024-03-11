return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function () 
    local configs = require("nvim-treesitter.configs")
    configs.setup({
        ensure_installed = {
          "c", "cpp", "nasm", "rust", "go", "lua", "make", "zig",
          "bash", "latex", "lua", "python", "regex",
          "json", "terraform", "toml", "yaml",
          "javascript", "html", "typescript",
          "gitcommit", "gitignore", "markdown",
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },  
      })
  end
}
