local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local function in_mathzone()
    -- Check for $ ... $ or $$ ... $$
    local line = vim.api.nvim_get_current_line()
    local pos = vim.api.nvim_win_get_cursor(0)[2]
    
    -- Find all pairs of $ or $$ in the current line
    local starts = {}
    local ends = {}
    local i = 1
    while i <= #line do
        if line:sub(i,i) == '$' then
            if line:sub(i+1,i+1) == '$' then
                -- Found $$
                table.insert(starts, i)
                i = i + 2
            else
                -- Found single $
                table.insert(starts, i)
                i = i + 1
            end
        else
            i = i + 1
        end
    end

    -- Find matching end markers
    i = #line
    while i >= 1 do
        if line:sub(i,i) == '$' then
            if i > 1 and line:sub(i-1,i-1) == '$' then
                -- Found $$
                table.insert(ends, i)
                i = i - 2
            else
                -- Found single $
                table.insert(ends, i)
                i = i - 1
            end
        else
            i = i - 1
        end
    end
    
    -- Check if cursor position is within any math zone
    for j = 1, #starts do
        if starts[j] < pos and ends[j] > pos then
            return true
        end
    end
    
    return false
end

return ls.add_snippets("markdown", {
    s({trig=';a', snippetType="autosnippet", condition=in_mathzone},
        {
            t("\\alpha"),
        }
    ),
    s({trig=';b', snippetType="autosnippet", condition=in_mathzone},
        {
            t("\\beta"),
        }
    ),
    s({trig="env", snippetType="autosnippet", condition=in_mathzone},
        fmta(
            [[
                \begin{<>}
                    <>
                \end{<>}
            ]],
            {
                i(1),
                i(2),
                rep(1),
            }
        )
    ),
    s({trig="bb", snippetType="autosnippet", condition=in_mathzone},
        fmta(
            [[
                \mathbb{<>}
            ]],
            {
                i(1),
            }
        )
    ),
    s({trig="ff", snippetType="autosnippet", condition=in_mathzone},
        fmta(
            [[
                \frac{<>}{<>}
            ]],
            {
                i(1),
                i(2)
            }
        )
    ),
    s({trig="lsum", snippetType="autosnippet", condition=in_mathzone},
        fmta(
            [[
                \sum\limits_{<>}^{<>}
            ]],
            {
                i(1),
                i(2)
            }
        )
    ),
})
