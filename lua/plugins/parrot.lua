return {
    "frankroeder/parrot.nvim",
    dependencies = { 'ibhagwan/fzf-lua', 'nvim-lua/plenary.nvim' },
    -- optionally include "rcarriga/nvim-notify" for beautiful notifications
    config = function()
        require("parrot").setup {
            -- Providers must be explicitly added to make them available.
            providers = {
                xai = {
                    api_key = "xai-i6y0ICFOVzolKVQr2hiDv9BsZBgsH75zDhnyH7mAkZjoP11ohuSH9TNZDtnX1j7N3Kdol3p1vxrh38oZ",
                },
            },
        }
    end,
}
