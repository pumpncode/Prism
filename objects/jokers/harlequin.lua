SMODS.Joker({
	key = "harlequin",
	atlas = "prismjokers",
	pos = { x = 0, y = 4 },
	soul_pos = { x = 0, y = 5 },
	rarity = 4,
	cost = 20,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = false,
	config = { extra = { bonus = 0.1, x_mult = 1}, first_s=false,first_h=false,first_c=false,first_d=false},
	loc_vars = function(self, info_queue, center)
		return { vars = {center.ability.extra.bonus,center.ability.extra.x_mult} }
	end,
	calculate = function(self, card, context)
		if context.cardarea == G.jokers and context.before then
			card.ability.first_s = false
			card.ability.first_h = false
			card.ability.first_c = false
			card.ability.first_d = false
		end
		if context.joker_main then
			return {
				xmult = card.ability.extra.x_mult,
			}
		end
		local upgrade = false
		if context.cardarea == G.play and context.individual and not context.blueprint then
			if context.other_card:is_suit('Spades') and card.ability.first_s == false then
				card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.bonus
				card.ability.first_s = true
				upgrade = true
			end
			if context.other_card:is_suit('Hearts') and card.ability.first_h == false then
				card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.bonus
				card.ability.first_h = true
				upgrade = true
			end
			if context.other_card:is_suit('Clubs') and card.ability.first_c == false then
				card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.bonus
				card.ability.first_c = true
				upgrade = true
			end
			if context.other_card:is_suit('Diamonds') and card.ability.first_d == false then
				card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.bonus
				card.ability.first_d = true
				upgrade = true
			end
			if upgrade == true then
				return {
					colour = G.C.RED,
					extra = { focus = card, message = localize({ type = "variable", key = "a_xmult", vars = { card.ability.extra.x_mult } })},
					card = card,
				}
			end
		end
	end,
	
})