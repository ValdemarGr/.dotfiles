local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local l = require("luasnip.extras").lambda
local r = require("luasnip.util.functions").rep
local p = require("luasnip.util.functions").partial

function getname(args, state)
  return args[1][1]
end

ls.snippets = {
  all = {
    s({trig = "funk", name = "funk", dscr = "Kleisli arrow in IO"}, {
      t("def "),
      i(1, "name"),
      t(": Kleisli[IO, "),
      i(2, "deps"),
      t(", "),
      i(3, "out"),
      t({"] =", "\tKleisli{ "}),
      i(4, "deps"),
      t(" =>"),
      t({"", "\t\t"}),
      i(5, "//code"),
      t({"", "\t\t???", "\t}"})
    }),
    s({trig = "co", name = "co", dscr = "Case object"}, {
      t("case object "),
      i(1),
    }),
    s({trig = "cc", name = "cc", dscr = "Case class"}, {
      t("final case class "),
      i(1),
      t("("),
      i(0),
      t(")"),
    }),
    s({trig = "adt", name = "adt", dscr = "Bad excuse for an ADT"}, {
      t("sealed trait "),
      i(1, "name"),
      t({"", "", "object "}),
      f(getname, { 1 }),
      t({" {", "\t"}),
      i(0),
      t(" extends "),
      f(getname, { 1 }),
      t({"", "}"})
    }),
    s({trig = "adti", name = "adti", dscr = "Bad excuse for an ADT, with typeclasses"}, {
      t("sealed trait "),
      i(1, "name"),
      t({"", "", "object "}),
      f(getname, { 1 }), t({" extends "}), f(getname, { 1 }), t({"Instances"}),
      t({" {", "\t"}),
      i(0),
      t(" extends "),
      f(getname, { 1 }),
      t({"", "}", "", "sealed abstract class "}), f(getname, { 1 }), t({"Instances {", "\t", "}"})
    })
  }
}

