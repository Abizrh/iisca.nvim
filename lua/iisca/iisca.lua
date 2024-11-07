local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local conf = require('telescope.config').values
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')
local utils = require('iisca.utils')
local log = require('iisca.log')

local config = {}

local M = {}

function M.open()
  local ext_files = utils.get_ext_files()

  local picker = pickers.new({}, {
    prompt_title = "Image Files",
    finder = finders.new_table({
      results = ext_files,
      entry_maker = function(entry)
        return {
          value = entry,
          display = entry.display,
          path = entry.path,
          ordinal = entry.display
        }
      end
    }),
    sorter = conf.generic_sorter({}),
    previewer = utils.execute_tiv(),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        if selection then
          log.info("Opening: " .. selection.path)
          vim.cmd('edit ' .. selection.path)
        end
      end)

      map('i', '<C-p>', function()
        local selection = action_state.get_selected_entry()
        if selection then
          log.info("Opening: " .. selection.path)
        end
      end)

      return true
    end,
  })

  picker:find()
end

local function register_cmds()
  vim.api.nvim_create_user_command('ShowIisca', function()
    M.open()
  end, {})
end

local function initialize(opts)
  config = vim.tbl_deep_extend("force", config, opts or {})
end


function M.setup(opts)
  initialize(opts)
  register_cmds()
end

return M
