return {
    'b0o/incline.nvim',
    config = function()
        require('incline').setup({
            hide = {
                cursorline = false,
                focused_win = false,
                only_win = true
            }, 
        })
    end,
    -- Optional: Lazy load Incline
    event = 'VeryLazy',
}
