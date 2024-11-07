local utils = {}

function utils.get_svg_files()
  local handle = io.popen('find "' ..
    vim.fn.getcwd() ..
    '" -type f \\( -name "*.svg" -o -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" -o -name "*.webp" -o -name "*.gif" -o -name "*.bmp" \\) ' ..
    ' -not \\( -path "*/.*" -o -path "*/node_modules/*" -o -path "*/vendor/*" -o -path "*/dist/*" -o -path "*/build/*" -o -path "*/.git/*" \\)')

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

return utils
