-- intentionally no cwd: this runs in neovim's own process cwd rather than
-- file's directory, so a file opened from outside its own repo just gets no signs
local function changed_lines(diff_output, line_count)
    local lines = {}
    for line in diff_output:gmatch('[^\n]+') do
        local old_start, old_count, new_start, new_count = line:match('^@@ %-(%d+),?(%d*) %+(%d+),?(%d*) @@')
        if not old_start then goto continue end

        old_count = tonumber(old_count) or 1
        new_start = tonumber(new_start)
        new_count = tonumber(new_count) or 1

        if new_count == 0 then -- del
            local sign = new_start==0 and 'removed_above' or 'removed_below'
            local lnum = new_start==0 and 1 or math.min(new_start, line_count)
            lines[#lines+1] = {sign, lnum, old_count}
        elseif old_count == 0 then -- pure add
            for lnum = new_start, math.min(new_start+new_count-1, line_count) do lines[#lines+1] = {'added', lnum} end
        elseif old_count > new_count then -- changed, with extra old lines deleted on top
            local deleted_count = old_count - new_count
            local prev_line_available = new_start > 1
            if prev_line_available then
                lines[#lines+1] = {'removed_below', math.min(new_start-1, line_count), deleted_count}
            end
            for offset = 0, new_count-1 do
                local lnum = new_start + offset
                if lnum > line_count then break end
                local sign = (not prev_line_available and offset == 0) and 'change_delete' or 'changed'
                lines[#lines+1] = {sign, lnum}
            end
        else -- old_count==new_count: pure change. old_count<new_count: changed, with extra new lines added
            for offset = 0, old_count-1 do
                local lnum = new_start + offset
                if lnum > line_count then break end
                lines[#lines+1] = {'changed', lnum}
            end
            for offset = old_count, new_count-1 do
                local lnum = new_start + offset
                if lnum > line_count then break end
                lines[#lines+1] = {'added', lnum}
            end
        end -- {sign_name, line_number, deleted_count?}
        ::continue::
    end -- e.g. @@ -12,3 +12,5 @@
    return lines
end

local ns = vim.api.nvim_create_namespace('diffsign')
local signs = {
    removed_above = {sign_text = '^', sign_hl_group = 'Removed'},
    added = {sign_text = '+', sign_hl_group = 'Added'},
    changed = {sign_text = '!', sign_hl_group = 'Changed'},
    change_delete = {sign_text = '!^', sign_hl_group = 'Changed'}, -- changed with no line above to host the delete count
}

-- like vim-signify's sign_show_count: glyph alone for 1, glyph+count for 2-99,
-- glyph+'>' beyond that, trimmed from the front to fit the 2-cell sign column
local function removed_below_sign(count)
    local text
    if count > 99 then text = '_>'
    elseif count < 2 then text = '_'
    else text = '_' .. tostring(count) end
    while vim.fn.strwidth(text) > 2 do text = text:sub(2) end
    return {sign_text = text, sign_hl_group = 'Removed'}
end

-- per-buffer counter so a slower, older git process can't overwrite a newer refresh's signs
local seqs = {}

local function refresh(buf)
    local file = vim.api.nvim_buf_get_name(buf)
    if file=='' or vim.bo[buf].buftype~='' or vim.fn.isdirectory(file)==1 then return end

    local seq = (seqs[buf] or 0) + 1
    seqs[buf] = seq

    pcall(vim.system, {'git', 'diff', '--no-ext-diff', '-U0', '--', file}, {stdout=true}, function(out)
        if out.code ~= 0 or seqs[buf] ~= seq then return end
        vim.schedule(function()
            if not vim.api.nvim_buf_is_valid(buf) or seqs[buf] ~= seq then return end
            vim.api.nvim_buf_clear_namespace(buf, ns, 0, -1)
            local marks = changed_lines(out.stdout, vim.api.nvim_buf_line_count(buf))
            for _, mark in ipairs(marks) do
                local sign, lnum, deleted = mark[1], mark[2], mark[3]
                local opts = sign=='removed_below' and removed_below_sign(deleted) or signs[sign]
                vim.api.nvim_buf_set_extmark(buf, ns, lnum-1, 0, opts)
            end -- place signs
        end)
    end) -- pcall: git not on PATH; leave existing signs as-is
end

vim.api.nvim_create_autocmd({'BufEnter', 'BufWritePost'}, {
    group = vim.api.nvim_create_augroup('diffsign', {clear=true}),
    callback = function(args) refresh(args.buf) end,
})
