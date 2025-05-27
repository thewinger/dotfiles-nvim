# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This repository contains a Neovim (nvim) configuration setup, structured as a modular dotfiles configuration. It's organized using the lazy.nvim plugin manager with a focus on web development, particularly JavaScript/TypeScript.

## Repository Structure

- `init.lua`: Entry point that simply requires the core module
- `/lua/core/`: Core configuration files
  - `init.lua`: Loads the core modules
  - `lazy.lua`: Package manager configuration 
  - `options.lua`: Neovim settings and preferences
  - `keymaps.lua`: Key mappings and shortcuts
  - `autocommands.lua`: Automatic commands for events
- `/lua/plugins/`: Plugin configurations, each in its own file
  - `lsp.lua`: Language Server Protocol configuration
  - `formatting.lua`: Code formatting with conform.nvim
  - `linting.lua`: Linting with nvim-lint
  - `nvim-treesitter.lua`: Syntax highlighting and parsing

## Key Features

1. **Plugin Management**: Uses lazy.nvim for plugin management
2. **LSP Integration**: Configured for multiple languages with focus on JavaScript/TypeScript
3. **Code Formatting**: Uses conform.nvim with prettierd/prettier for JS/TS and stylua for Lua
4. **Linting**: Uses nvim-lint with eslint for JavaScript/TypeScript
5. **Syntax Highlighting**: Treesitter for enhanced syntax highlighting and parsing

## Development Commands

### Plugin Management

- `:Lazy` - Open the lazy.nvim plugin manager interface
- `:LazyUpdate` - Update all plugins
- `:LazySync` - Sync plugins (install/clean/update)

### LSP

- `:Mason` - Open Mason (LSP server installer) interface
- `:LspInfo` - Show information about active language servers
- `:LspRestart` - Restart language servers

### Formatting

- `:ConformInfo` - Show information about available formatters
- `<leader>ft` - Format the current buffer

### Customizing Configuration

1. To add a new plugin:
   - Create a new file in `/lua/plugins/` with a table return
   - Use the lazy.nvim format for plugin configuration

2. To modify key mappings:
   - Edit `/lua/core/keymaps.lua`

3. To change editor options:
   - Edit `/lua/core/options.lua`

### Important Keymaps

- `<Space>` - Leader key
- `<leader>ft` - Format current buffer
- `<leader>s` - Search and replace word under cursor
- `<leader>d` - Show diagnostics for current line
- `<leader>ca` - Code actions
- `<leader>rn` - Rename symbol

## LSP Configuration

The configuration uses Mason to manage LSP servers with primary support for:
- TypeScript/JavaScript (ts_ls)
- Lua (lua_ls)
- ESLint
- Tailwind CSS

## Formatting and Linting

- **Formatting**: conform.nvim with prettierd/prettier for web development files and stylua for Lua
- **Linting**: nvim-lint configured with eslint for JavaScript/TypeScript
- Format on save is enabled with a 500ms timeout

## Debugging

- If LSP is not working, check:
  - `:LspInfo` to see active servers
  - `:checkhealth` for general Neovim health
  - Mason for properly installed language servers