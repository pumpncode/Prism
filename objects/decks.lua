SMODS.Atlas {
    key = 'prismdecks',
    path = "decks.png",
    px = 71,
    py = 95
}
SMODS.Back({
	key = "ancient", 
	atlas = "prismdecks",
	pos = {x = 0, y = 0},
	config = { vouchers = { "v_prism_myth_merchant","v_prism_booster_box"}},
    unlocked = false,
    unlock_condition = {type = 'win_stake', stake=6}
})
SMODS.Back({
	key = "market", 
	atlas = "prismdecks",
	pos = {x = 1, y = 0},
	config = { vouchers = { "v_overstock_norm","v_reroll_surplus"}},
    unlocked = false,
    unlock_condition = {type = 'win_stake', stake=8}
})