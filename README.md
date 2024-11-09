
# 🖼️ iisca.nvim
> ✨ Convert your images to ascii art in neovim

![hero](https://raw.githubusercontent.com/Abizrh/iisca.nvim/main/preview.png)


## ⚠️ Requirements
- [tiv](https://github.com/stefanhaustein/TerminalImageViewer) for converting images into ASCII character

```bash
git clone https://github.com/stefanhaustein/TerminalImageViewer.git
cd TerminalImageViewer/src
make

# To move the tiv binary into your PATH (hopefully), also do
sudo make install
```

- Neovim version 0.10.0 or higher.


## 📦 Installation  

### 💤 Lazy

```lua
  {
    "Abizrh/iisca.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    }
  },
```


## Usage

| Command               | Description                                             |
| --------------------- | ------------------------------------------------------- |
| `:ShowIisca`      | Search image in current file                               |

## 👀 Similar projects

- **Advance:**
  - [image.nvim](https://github.com/3rd/image.nvim)
  - [image_previewer](https://github.com/adelarsq/image_preview.nvim)
  - [image.nvim](https://github.com/samodostal/image.nvim) convert to ASCII character - *archived*
