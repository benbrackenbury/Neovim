return {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
        require("hardtime").setup({
            restricted_keys = {
                ["h"] = { "n", "x" },
                ["j"] = { "n", "x" },
                ["k"] = { "n", "x" },
                ["l"] = { "n", "x" },
                ["+"] = { "n", "x" },
                ["gj"] = { "n", "x" },
                ["gk"] = { "n", "x" },
                ["w"] = { "n", "x" },
                ["b"] = { "n", "x" },
                ["e"] = { "n", "x" },
                ["W"] = { "n", "x" },
                ["B"] = { "n", "x" },
                ["E"] = { "n", "x" },
            },
        })
    end
}
