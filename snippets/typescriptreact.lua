---@diagnostic disable: undefined-global

return {
    s({ trig = "cl" },
        fmta([[
        console.log('<>', <>)
        ]],
            {
                i(1),
                i(2),
            })
    ),

    s({ trig = "edrc" },
        fmta([[
        export default function <>(<>) {
            return (
                <>
            )
        }
        ]],
            {
                i(1),
                i(2),
                i(3),
            })
    ),

    s({ trig = "erc" },
        fmta([[
        export function <>(<>) {
            return (
                <>
            )
        }
        ]],
            {
                i(1),
                i(2),
                i(3),
            })
    ),

    s({ trig = "rc" },
        fmta([[
        function <>(<>) {
            return (
                <>
            )
        }
        ]],
            {
                i(1),
                i(2),
                i(3),
            })
    ),

    s({ trig = "ue" },
        {
            t("useEffect(() => {"),
            t({ "", "\t" }), i(1),
            t({ "", "}, [" }), i(2), t("])")
        }
    ),

    s({ trig = "us" },
        fmta([[
        const [<>, set<>] = useState(<>)
        ]],
            {
                i(1),
                i(2),
                i(3),
            })
    ),
}
