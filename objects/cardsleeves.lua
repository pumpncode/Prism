SMODS.Atlas {
    key = 'prismsleeves',
    path = "cardsleeves.png",
    px = 73,
    py = 95
}
CardSleeves.Sleeve({
    key = "ancientsleeve",
	atlas = "prismsleeves",
	pos = {x = 0, y = 0},
	config = { vouchers = { "v_prism_myth_merchant","v_prism_booster_box"}},
    unlocked = false,
    unlock_condition = {deck = "b_prism_ancient", stake = 5}
})
CardSleeves.Sleeve({
    key = "marketsleeve", 
	atlas = "prismsleeves",
	pos = {x = 1, y = 0},
	config = { vouchers = { "v_overstock_norm","v_reroll_surplus"}},
    unlocked = false,
    unlock_condition = {deck = "b_prism_market", stake = 6}
})