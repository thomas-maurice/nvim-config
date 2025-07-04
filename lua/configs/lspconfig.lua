return {
    setup = function()
        local enabled_lsps = {
            "ansiblels",
            "bashls",
            "buf_ls",
            "docker_compose_language_service",
            "dockerls",
            "gh_actions_ls",
            "golangci_lint_ls",
            "gopls",
            "graphql",
            "helm_ls",
            "jsonls",
            "lua_ls",
            "pylsp",
            "pyre",
            "sqls",
            "terraformls",
            "ts_ls",
            "vuels",
            "yamlls",
        }

        for _, lsp in ipairs(enabled_lsps) do
            vim.lsp.enable(lsp)
        end
    end
}