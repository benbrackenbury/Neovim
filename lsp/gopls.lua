return {
    cmd = { "gopls" },
    filetypes = {
        "go",
    },
    root_markers = { "go.work", "go.mod", ".vim/", ".git/", ".hg/" },
    telemetry = { enabled = false },
    formatters = {
        ignoreComments = false,
    },
}
