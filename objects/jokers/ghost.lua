SMODS.Joker({
	key = "ghost",
	atlas = "prismjokers",
	pos = {x=0,y=13},
	rarity = 1,
	cost = 5,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = false,
	config = {extra = {mult = 5}},
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.mult, G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.spectral * center.ability.extra.mult or 0} }
	end,
	calculate = function(self, card, context)
		if context.joker_main and G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.spectral > 0 then
			return {
				mult = G.GAME.consumeable_usage_total.spectral * card.ability.extra.mult
			}
		end
    end
	
})