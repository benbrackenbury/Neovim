return {
    cmd = { "docker-compose-langserver", "--stdio" },
    filetypes = {
        "yaml.docker-compose",
        "yml",
        "yaml",
    },
    root_markers = {},
    telemetry = { enabled = false },
    formatters = {
        ignoreComments = false,
    },
}
