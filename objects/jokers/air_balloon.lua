SMODS.Joker({
	key = "air_balloon",
	atlas = "prismjokers",
	pos = {x=0,y=0},
	rarity = 2,
	cost = 7,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = false,
	config = {chips = 0,extra = 0},
	loc_vars = function(self, info_queue, center)
		return { vars = {center.ability.chips} }
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				chips = card.ability.chips,
			}
		end
        if context.cardarea == G.hand and not context.blueprint then
			local temp_ID = 0
			local raised_card = nil
			for i=1, #G.hand.cards do
				if temp_ID <= G.hand.cards[i].base.id and G.hand.cards[i].ability.effect ~= 'Stone Card' then 
					card.ability.extra = G.hand.cards[i].base.nominal; 
					temp_ID = G.hand.cards[i].base.id; 
					raised_card = G.hand.cards[i] 
				end
			end
			if context.individual and raised_card == context.other_card and not context.end_of_round then 
				if context.other_card.debuff then
					return {
						message = localize('k_debuffed'),
						colour = G.C.RED,
						card = card,
					}
				else
					card.ability.chips = card.ability.chips + card.ability.extra
					return {
						extra = { focus = card, message = localize("k_upgrade_ex") },
						colour = G.C.CHIPS,
						card = card,
					}
				end
			end
        end
    end
	
})