<div align="center">

# lazykube.nvim

## A neovim wrapper for `lazykube` to effortlessly interact with kubernetes within neovim 🔌

</div>

<div align="center">

![Lua](https://img.shields.io/badge/Made%20with%20Lua-blueviolet.svg?style=for-the-badge&logo=lua&logoColor=white)

</div>

<div align="center">

![License](https://img.shields.io/badge/License-MIT-brightgreen?style=flat-square)
![Status](https://img.shields.io/badge/Status-Stable-informational?style=flat-square)
![Neovim](https://img.shields.io/badge/Neovim-0.11+-green.svg?style=flat-square&logo=Neovim&logoColor=white)

</div>

## Overview

`lazykube.nvim` is a [`lazykube` plugin](https://github.com/TNK-Studio/lazykube) for neovim that allows you to manage your kubernetes clusters with ease without leaving your neovim workspace. It draws inspiration from [`lazydocker.nvim`](https://github.com/mgierada/lazydocker.nvim). `lazykube` is a terminal UI client for interacting with `kubernetes`.

## ✨ Features

- **Integrated Kubernetes TUI**: Access `lazykube` directly within a floating terminal in Neovim.
- **Full Kubernetes Management**: Manage pods, services, and more with ease.
- **Seamless Navigation**: Quick toggle with a keymap and easy exit.
- **Customizable**: Change the trigger keymap to suit your preference.

## ⚡️ Requirements

- **Neovim**: 0.11+
- **lazykube**: Installed and available in your `$PATH`.
- **toggleterm.nvim**: Required as a plugin dependency.

## 💻 Installation

### 1. Install `lazykube`

You can install the `lazykube` CLI in several ways:

- Via Go get

  ```bash
  go get -u github.com/TNK-Studio/lazykube
  ```

- **On MacOS with Homebrew**:

  ```bash
  brew install tnk-studio/tools/lazykube
  ```

- **On Linux (curl must be installed)**:

  ```bash
  curl https://raw.githubusercontent.com/TNK-Studio/lazykube/main/scripts/install_update_linux.sh | bash
  ```

- **On Windows**:

  > Go to the [releases page](https://github.com/TNK-Studio/lazykube/releases/latest) and download the latest version of `lazykube`.

### 2. Install `lazykube.nvim`

**[Lazy.nvim](https://github.com/folke/lazy.nvim)**

```lua
return {
  "georgesnoe/lazykube.nvim",
  dependencies = { "akinsho/toggleterm.nvim" },
  event = "VeryLazy",
  opts = {},
}
```

## ⚙️ Customization

You can configure the plugin by passing a table to the `setup` function.

```lua
require("lazykube").setup({
  keymap = "<leader>lk",    -- Keymap to open Lazykube (default: <leader>lk)
  cmd = "lazykube",          -- Command to run lazykube (default: lazykube)
  border = "single",        -- Border style: "single", "double", "shadow", or "curved" (default: single)
})
```

## 🔌 Available commands

- `:Lazykube` — Open the `lazykube` floating window.

## Default keymaps

- `<leader>lk` — Open `lazykube` in floating window.
- `q` — Close the floating window (while focused).

## 🧪 Compatibility

This plugin has been tested and verified on:

- **Neovim**: 0.11.0
- **lazykube**: 0.10.3

## License

This project is licensed under the MIT License.
