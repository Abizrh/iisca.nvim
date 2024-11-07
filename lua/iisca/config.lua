local config = {}

config.default_config = {
}

config.options = {}

function config.setup(opts)
  config.options = vim.tbl_deep_extend("force", {}, config.options, opts or {})
end

return config
