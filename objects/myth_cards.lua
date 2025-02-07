SMODS.ConsumableType({
    key = "Myth",
    primary_colour = HEX("6A7D77"),
    secondary_colour = HEX("4A745A"),
    loc_txt = {
        name = "Myth Card",
        collection = "Myth Cards",
        undiscovered = {
            name = 'Unknown Myth Card',
            text = {
                'Find this card in an unseeded',
                'run to find out what it does'
            }
        }
    },
    collection_rows = {6, 5},
    shop_rate = 0.0,
    default = 'c_prism_myth_druid'
})
SMODS.UndiscoveredSprite({
    key = "Myth",
    atlas = "prismmyth",
    pos = { x = 0, y = 0 },
    no_overlay = true
})
SMODS.Consumable({
    key = 'myth_druid',
    set = 'Myth',
    atlas = 'prismmyth',
    pos = {x=0, y=1},
    discovered = false,
    config = {extra = 0},
})

SMODS.Consumable({
    key = 'myth_dwarf',
    set = 'Myth',
    atlas = 'prismmyth',
    pos = {x=1, y=0},
    discovered = false,
    config = {mod_conv = "m_prism_crystal", max_highlighted = 2},
    effect = 'Enhance',
    loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = G.P_CENTERS[self.config.mod_conv]

		return { vars = { self.config.max_highlighted } }
	end,

})
SMODS.Consumable({
    key = 'myth_dragon',
    set = 'Myth',
    atlas = 'prismmyth',
    pos = {x=2, y=0},
    discovered = false,
    config = {mod_conv = "m_prism_burnt", max_highlighted = 2},
    effect = 'Enhance',
    loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = G.P_CENTERS[self.config.mod_conv]

		return { vars = { self.config.max_highlighted } }
	end,

})