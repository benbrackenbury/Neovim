return {
    cmd = { "tailwindcss-language-server" },
    filetypes = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte", "markdown", "php" },
    root_markers = {
        "tailwind.config.js",
        "tailwind.config.cjs",
        "tailwind.config.mjs",
        "tailwind.config.ts",
        "postcss.config.js",
        "postcss.config.cjs",
        "postcss.config.mjs",
        "postcss.config.ts",
    },
    telemetry = { enabled = false },
    formatters = {
        ignoreComments = false,
    },
}
