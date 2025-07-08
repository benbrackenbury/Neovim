return {
    cmd = { "csharp-ls" },
    filetypes = { "cs" },
    root_markers = {
        "*.sln",
        "*.slnx",
        "*.csproj",
    },
    telemetry = { enabled = false },
    formatters = {
        ignoreComments = false,
    },
    settings = {
        AutomaticWorkspaceInit = true,
    },
}
