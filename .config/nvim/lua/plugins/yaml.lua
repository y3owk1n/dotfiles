return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                yamlls = {
                    settings = {
                        yaml = {
                            schemaStore = {
                                enable = true,
                                url = "https://www.schemastore.org/api/json/catalog.json",
                            },
                            schemas = {
                                ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                            },
                            validate = true,
                            completion = true,
                            hover = true,
                        },
                    },
                },
            },
        },
    },
}
