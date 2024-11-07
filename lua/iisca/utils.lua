local utils = {}
local previewers = require('telescope.previewers')
local log = require('iisca.log')

function utils.get_ext_files()
  local handle = io.popen('find "' ..
    vim.fn.getcwd() ..
    '" -type f \\( -name "*.svg" -o -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" -o -name "*.webp" -o -name "*.gif" -o -name "*.bmp" \\) ' ..
    ' -not \\( -path "*/.*" -o -path "*/node_modules/*" -o -path "*/vendor/*" -o -path "*/dist/*" -o -path "*/build/*" -o -path "*/.git/*" \\)')

  if handle == nil then
    log.error("Failed to get files")
    return {}
  end

  local result = handle:read("*a")
  handle:close()

  local files = {}
  for file in result:gmatch("[^\r\n]+") do
    local relative_path = file:gsub(vim.fn.getcwd() .. '/', '')
    table.insert(files, {
      path = file,
      display = relative_path
    })
  end

  return files
end

function utils.execute_tiv()
  local tiv_previewer = previewers.new_termopen_previewer({
    title = " 📷 Ascii Preview 📷",
    get_command = function(entry)
      return { 'tiv', '-w', '64', '-h', '32', entry.path }
    end
  })
  return tiv_previewer
end

return utils
