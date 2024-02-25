return {
  "williamboman/mason.nvim",
  name = "mason",
  config = function()
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "",
          package_pending = "",
          package_uninstalled = "",
        },
      }
    })
  end
}
