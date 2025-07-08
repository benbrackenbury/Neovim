return {
    cmd = { "intelephense", "--stdio" },
    filetypes = { "php", "blade" },
    root_markers = { "composer.json", ".git" },
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
                "polylang",
                "laravel",          -- Add Laravel stub
                "laravel-framework" -- Add Laravel framework stub
            },
            environment = {
                includePaths = {
                    '~/.composer/vendor/php-stubs/',
                    './vendor/laravel/framework/src/Illuminate' -- Laravel source path
                }
            },
            files = {
                maxSize = 5000000,
            },
        },
    }
}
