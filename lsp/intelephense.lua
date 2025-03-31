return {
    cmd = { "intelephense", "--stdio" },
    filetypes = {
        "php",
        "blade"
    },
    root_markers = { "composer.json" },
    telemetry = { enabled = false },
    formatters = {
        ignoreComments = false,
    },
    settings = {
        intelephense = {
            stubs = {
                "bcmath",
                "bz2",
                "calendar",
                "Core",
                "curl",
                "zip",
                "zlib",
                "wordpress",
                "woocommerce",
                "acf-pro",
                "wordpress-globals",
                "wp-cli",
                "genesis",
                "polylang"
            },
            environment = {
                includePaths =
                '~/.composer/vendor/php-stubs/'
            },
            files = {
                maxSize = 5000000,
            },
        },
    }
}
