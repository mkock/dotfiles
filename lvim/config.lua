-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.shell = "/usr/bin/fish"

-- Custom tab switching
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<m-h>", "<cmd>BufferLineCyclePrev<cr>", opts)
vim.keymap.set("n", "<m-l>", "<cmd>BufferLineCycleNext<cr>", opts)

-- Nice shortcuts for marks
vim.keymap.set("n", "<space>sm", "<cmd>Telescope marks<cr>", opts)

lvim.plugins = {
    { "leoluz/nvim-dap-go" },
    { "ggandor/leap.nvim" },
}

-- The "lunar" colorscheme is a bit too dark for my taste
lvim.colorscheme = "tokyonight"
lvim.builtin.lualine.options.theme = "tokyonight"

-- Always enable git commit information on the current line
lvim.builtin.gitsigns.opts.current_line_blame = true

-- Configure leap
require("leap").add_default_mappings(true)

require("dap-go").setup {
    -- Additional dap configurations can be added.
    -- dap_configurations accepts a list of tables where each entry
    -- represents a dap configuration. For more details do:
    -- :help dap-configuration
    dap_configurations = {
        {
            -- Must be "go" or it will be ignored by the plugin
            type = "go",
            name = "Attach remote",
            mode = "remote",
            request = "attach",
        },
    },
    -- delve configurations
    delve = {
        -- the path to the executable dlv which will be used for debugging.
        -- by default, this is the "dlv" executable on your PATH.
        path = "/home/marty/go/bin/dlv",
        -- time to wait for delve to initialize the debug session.
        -- default to 20 seconds
        initialize_timeout_sec = 20,
        -- a string that defines the port to start delve debugger.
        -- default to string "${port}" which instructs nvim-dap
        -- to start the process in a random available port
        port = "${port}",
        -- additional args to pass to dlv
        args = {},
        -- the build flags that are passed to delve.
        -- defaults to empty string, but can be used to provide flags
        -- such as "-tags=unit" to make sure the test suite is
        -- compiled during debugging, for example.
        -- passing build flags using args is ineffective, as those are
        -- ignored by delve in dap mode.
        build_flags = "",
    },
}

-- Add shortcut for LSP goto type definition, and a corresponding which-key mapping
vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, opts)

local which_key = require "which-key"
local mappings = {
    g = {
        y = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Goto type definition" }
    }
}
local wk_opts = {
    mode = "n",     -- Normal mode
    buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true,  -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
}
which_key.register(mappings, wk_opts)
