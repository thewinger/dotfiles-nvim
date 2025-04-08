return {
  "stevearc/overseer.nvim",
  config = function()
    vim.api.nvim_create_user_command("OverseerRestartLast", function()
      local overseer = require("overseer")
      local tasks = overseer.list_tasks({ recent_first = true })
      if vim.tbl_isempty(tasks) then
        vim.notify("No tasks found", vim.log.levels.WARN)
      else
        overseer.run_action(tasks[1], "restart")
      end
    end, {})

    require("overseer").setup()
  end,
  keys = {
    { "<leader>or", "<cmd>OverseerRun<CR>", desc = "Run Overseer" },
    { "<leader>orl", "<cmd>OverseerRestartLast<CR>", desc = "Run last Overseer task" },
  },
}
