local map = require("core.utils").smap
return {
  "nvim-neotest/neotest",
  keys = {
    { "<leader>tn", map("neotest", "run.run") },
    { "<leader>ts", map("neotest", "summary.toggle") },
    { "<leader>tS", map("neotest", "run.stop") },
    { "<leader>to", map("neotest", "output.open") },
    { "<leader>tO", map("neotest", "output_panel.toggle") },
    { "]t", map("neotest", "jump.next") },
    { "[t", map("neotest", "jump.prev") },
    { "]T", map("neotest", "jump.next", "{status = 'failed'}") },
    { "[T", map("neotest", "jump.prev", "{status = 'failed'}") },
    { "<leader>tw", map("neotest", "watch.toggle") },
    {
      "<leader>tt",
      function()
        require("neotest").run.run(vim.fn.expand "%")
      end,
    },
  },
  dependencies = {
    { "roveo/neotest-go", branch = "feat/testify-suite" },
    "nvim-neotest/neotest-plenary",
    "nvim-treesitter",
  },
  config = function()
    local neotest_ns = vim.api.nvim_create_namespace "neotest"
    vim.diagnostic.config({
      virtual_text = {
        format = function(diagnostic)
          local message = diagnostic.message
            :gsub("\n", " ")
            :gsub("\t", " ")
            :gsub("%s+", " ")
            :gsub("^%s+", "")
          return message
        end,
      },
    }, neotest_ns)

    require("neotest").setup {
      adapters = {
        require "neotest-plenary",
        require "neotest-go" {
          experimental = { test_table = true },
          args = { "-count=1", "-timeout=60s" },
        },
      },
      icons = {
        expanded = "",
        child_prefix = "",
        child_indent = "",
        final_child_prefix = "",
        non_collapsible = "",
        collapsed = "",
        passed = "",
        running = "",
        failed = "",
        unknown = "",
      },
      summary = {
        mappings = {
          expand = { "l", "h", "<CR>" },
          stop = "s",
        },
      },
    }
  end,
}
