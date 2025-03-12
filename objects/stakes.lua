--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!----
--!!!NOT CURRENTLY IMPLEMENTED!!!----
--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!----

SMODS.Atlas({
    key = 'prismstakes',
    path = 'chips.png',
    px = '29',
    py = '29'
})
SMODS.Atlas({
    key = 'prismstickers',
    path = 'stickers.png',
    px = 71,
    py = 95
})
SMODS.Stake({
    key = "platinum",
    above_stake = "gold",
    applied_stakes = { "gold" },
    prefix_config = {above_stake = { mod = false },applied_stakes = { mod = false }},
    atlas = 'prismstakes',
    pos = {x = 0, y = 0},
    colour = G.C.GREY,
    shiny = true,
    sticker_pos = {x = 0, y = 0},
    sticker_atlas = 'prismstickers',
    modifiers = function()
        G.GAME.modifiers.pice_scaling = true
    end,
})