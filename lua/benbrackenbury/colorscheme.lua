function SetColorScheme(color)
    color = color or "catppuccin-macchiato"
    vim.cmd.colorscheme(color)
    vim.cmd("TransparentDisable")
end

SetColorScheme()
