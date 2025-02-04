SMODS.Joker({
	key = "rich_joker",
	atlas = "prismjokers",
	pos = {x=0,y=12},
	rarity = 1,
	cost = 5,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	config = {
		odds = 2,money = 4
    },
	loc_vars = function(self, info_queue, center)
		return { vars = {
			"" .. (G.GAME and G.GAME.probabilities.normal or 1), 
			center.ability.odds,
			center.ability.money }
		}
	end,
	calculate = function(self, card, context)
		if context.selling_card and pseudorandom('rich') < G.GAME.probabilities.normal / card.ability.odds then
			ease_dollars(card.ability.money)
			card_eval_status_text(
				context.blueprint_card or card,
				"extra",
				nil,
				nil,
				nil,
				{ message = localize("$") .. card.ability.money, colour = G.C.MONEY, delay = 0.45 }
			)
			return nil,true
		end
	end,
})