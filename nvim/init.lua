-- Super basic NeoVim configuration.
-- Author: LuxÆterna. Requirements: NeoVim 0.8.2+, patched fonts, and whatever Telescope likes to have available on the system.
-- Enables: Packer, TokyoNight theme, relative line numbers, indentation with four spaces. Also Lualine and Leap.

local packer = require('packer')

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

-- Theme
vim.cmd[[colorscheme tokyonight]]

-- Bootstrapping of Packer and plugins.
return packer.startup(function(use)
   -- Packer.
    use 'wbthomason/packer.nvim'

    -- Theme.
    use 'folke/tokyonight.nvim'

    -- Telescope.
    use {
  	    'nvim-telescope/telescope.nvim', tag = '0.1.0',
	    requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Lualine.
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    }

    -- Leap.
    use 'ggandor/leap.nvim'

    local lualine = require('lualine')
    local builtin = require('telescope.builtin')
    local leap = require('leap').add_default_mappings()
 
    lualine.setup()

    -- Packer sync.
    if packer_bootstrap then
	    require('packer').sync()
    end

    -- Keymappings
    vim.g.mapleader = ' '
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    vim.keymap.set('n', '<leader>c', ':bd<cr>')
end)

