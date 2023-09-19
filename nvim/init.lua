-- Super basic NeoVim configuration.
-- Author: LuxÆterna. Requirements: NeoVim 0.9.0+, patched fonts, and whatever Telescope likes to have available on the system.
-- Enables: Lazy, TokyoNight theme, relative line numbers, indentation with four spaces. Also Lualine.

-- Options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = ''
vim.opt.fileencoding = 'utf-8'
vim.opt.hlsearch = true
vim.opt.cursorline = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.showmode = false
vim.opt.showmatch = true

-- Lazy.nvim and plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

local plugins = {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    {
   	    'nvim-telescope/telescope.nvim', tag = '0.1.3',
 	    dependencies = { {'nvim-lua/plenary.nvim'} }
    },{
        'nvim-lualine/lualine.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons', opt = true },
     }

}

require("lazy").setup(plugins)

-- Enable colorscheme
vim.cmd[[colorscheme tokyonight]]

-- Enable lualine
require("lualine").setup()

-- Keymappings
vim.g.mapleader = ' '
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>ft', builtin.current_buffer_fuzzy_find, {})

