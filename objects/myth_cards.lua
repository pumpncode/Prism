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