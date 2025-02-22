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
	order = 15,
	config = { vouchers = { "v_prism_myth_merchant","v_prism_booster_box"}},
    unlocked = false,
    unlock_condition = {type = 'win_stake', stake=6}
})