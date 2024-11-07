local config = {}

function config.setup(opts)
  config = vim.tbl_deep_extend("force", {}, config, opts or {})
end

return config
