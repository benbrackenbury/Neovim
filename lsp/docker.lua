return {
    cmd = { "docker-langserver", "--stdio" },
    filetypes = {
        "dockerfile",
    },
    root_markers = {},
    telemetry = { enabled = false },
    formatters = {
        ignoreComments = false,
    },
}
