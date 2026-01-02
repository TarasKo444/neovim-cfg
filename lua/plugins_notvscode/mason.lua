return {
  "mason-org/mason.nvim",
  lazy = false,
  opts = {},
  config = function ()
    require("mason").setup({
      registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
      },
    })
  end
}
