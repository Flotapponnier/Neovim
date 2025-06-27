return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      check_ts = true, -- active l'intégration avec Tree-sitter
    },
    config = function(_, opts)
      require("nvim-autopairs").setup(opts)

      -- Si tu utilises nvim-cmp (pour l'autocomplétion)
      local cmp_status_ok, cmp = pcall(require, "cmp")
      if cmp_status_ok then
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
      end
    end,
  },
}
