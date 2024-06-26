function SetColorScheme(color)
    color = color or "rose-pine-main"
    vim.cmd.colorscheme(color)
    vim.o.background = "dark"
    vim.cmd("TransparentEnable")
end

SetColorScheme()
