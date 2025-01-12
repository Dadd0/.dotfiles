local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("markdown", {
    s("inl", {
        t("$"),
        i(1, "math inline"),
        t("$"),
        i(2)
    }),
    ------------------------------
    s("block", {
        t("$$"),
        i(1, "math block");
        t("$$"),
        i(2)
    }),
    -------------------------------
})

