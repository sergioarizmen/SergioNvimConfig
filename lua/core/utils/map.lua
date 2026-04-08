-- Maps keypas with forced silen noremap.
-- @param mode Vim mode.
-- @param mapFrom Expected input to map from.
-- @param mapTo Output mapping.
-- @param description Mapping description, automatically mapped to options.desc.
-- @param options Options passed to the mapping, gets noremap and silent added.
local function map(mode, mapFrom, mapTo, description, options)
    description = description or ""
    local base_options = { noremap = true, silent = true, desc = description }
    if options then
        base_options = vim.tbl_extend("force", base_options, options)
    end
    vim.keymap.set(mode, mapFrom, mapTo, base_options)
end

return map
