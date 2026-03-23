local ascii_arts = {"startup.ascii_art.rebecca","startup.ascii_art.lucy","startup.ascii_art.face"}
math.randomseed(os.time())

local settings = {
    header = {
        type = "text",
        align = "center",
        fold_section = false,
        title = "Header",
        margin = 5,
        content = require(ascii_arts[math.random(#ascii_arts)]),
        highlight = "Statement",
        default_color = "",
        oldfiles_amount = 0,
    },
    header_2 = {
        type = "text",
        oldfiles_directory = false,
        align = "center",
        fold_section = false,
        title = "",
        margin = 5,
        content = {"CyberVim"},
        highlight = "Statement",
        default_color = "",
        oldfiles_amount = 0,
    },
	options = {
        after = function()
            require("startup.utils").oldfiles_mappings()
        end,
        mapping_keys = true,
        cursor_column = 0.5,
        empty_lines_between_mappings = true,
        disable_statuslines = true,
        paddings = { 2, 2, 2, 2, 2, 2, 2 },
    },
    colors = {
        background = "#1f2227",
        folded_section = "#56b6c2",
    },
    parts = {"header","header_2"},
}
return settings
