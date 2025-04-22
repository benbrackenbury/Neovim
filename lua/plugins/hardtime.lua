return {
    "benbrackenbury/hardtime-precognition.nvim",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "tris203/precognition.nvim",
    },
    config = function()
        require("hardtime").setup()
    end
}
