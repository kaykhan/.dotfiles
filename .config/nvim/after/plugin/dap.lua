vim.keymap.set("n", "<F5>", "<Cmd>lua require'dap'.continue()<CR>", { silent = true })
vim.keymap.set("n", "<F10>", "<Cmd>lua require'dap'.step_over()<CR>", { silent = true })
vim.keymap.set("n", "<F11>", "<Cmd>lua require'dap'.step_into()<CR>", { silent = true })
vim.keymap.set("n", "<F12>", "<Cmd>lua require'dap'.step_out()<CR>", { silent = true })
vim.keymap.set("n", "<Leader>b", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", { silent = true })
vim.keymap.set(
	"n",
	"<Leader>B",
	"<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
	{ silent = true }
)
vim.keymap.set(
	"n",
	"<Leader>lp",
	" <Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
	{ silent = true }
)
vim.keymap.set("n", "<Leader>dr", "<Cmd>lua require'dap'.repl.open()<CR>", { silent = true })
vim.keymap.set("n", "<Leader>dl", "<Cmd>lua require'dap'.run_last()<CR>", { silent = true })
vim.keymap.set("n", "<Leader>dt", "<Cmd>lua require'dap'.terminate()<CR>", {})

require("nvim-dap-virtual-text").setup()
require("dapui").setup()
require('telescope').load_extension('dap')

local dap, dapui = require("dap"), require("dapui")

dap.set_log_level('TRACE')
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

require("dap-vscode-js").setup({
  -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
  -- debugger_path = "/home/kay/vscode-js-debug", -- Path to vscode-js-debug installation.
  -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
  adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
  -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
  -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
  -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
})

for _, language in ipairs({ "typescript", "javascript" }) do
  dap.configurations[language] = {
  {
    type = "pwa-node",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    cwd = "${workspaceFolder}",
	protocol = "inspector",
	console = "integratedTerminal",
	runtimeExecutable = "${workspaceFolder}/node_modules/.bin/jest",
    resolveSourceMapLocations = { "${workspaceFolder}/dist/**/*.js", "${workspaceFolder}/**", "!**/node_modules/**" },
    --skipFiles = { "<node_internals>/**", "**/node_modules/**" },
    port = 9229,
    sourceMaps = true
  },
  {
    type = "pwa-node",
    request = "attach",
    name = "Attach",
    processId = require'dap.utils'.pick_process,
    cwd = "${workspaceFolder}",
	protocol = "inspector",
	console = "integratedTerminal",
    resolveSourceMapLocations = { "${workspaceFolder}/dist/**/*.js", "${workspaceFolder}/**", "!**/node_modules/**" },
    port = 9229,
    sourceMaps = true

  }
}
end

-- hl groups not working
local set_namespace = vim.api.nvim__set_hl_ns or vim.api.nvim_set_hl_ns
local namespace = vim.api.nvim_create_namespace("dap-hl")
vim.api.nvim_set_hl(namespace, 'DapBreakpoint', { fg='#eaeaeb', bg='#ffffff' })
vim.api.nvim_set_hl(namespace, 'DapLogPoint', { fg='#eaeaeb', bg='#ffffff' })
vim.api.nvim_set_hl(namespace, 'DapStopped', { fg='#eaeaeb', bg='#ffffff' })

vim.fn.sign_define('DapBreakpoint', { text='', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointCondition', { text='ﳁ', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointRejected', { text='', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl= 'DapBreakpoint' })
vim.fn.sign_define('DapLogPoint', { text='', texthl='DapLogPoint', linehl='DapLogPoint', numhl= 'DapLogPoint' })
vim.fn.sign_define('DapStopped', { text='', texthl='DapStopped', linehl='Search', numhl= 'DapStopped' })
