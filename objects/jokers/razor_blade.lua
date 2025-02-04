SMODS.Joker({
	key = "razor_blade",
	atlas = "prismjokers",
	pos = {x=0,y=10},
	rarity = 2,
	cost = 7,
	pixel_size = { w = 59, h = 95},
	unlocked = true,
	discovered = false,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = true,
	config = {
        cut_card = nil,
        temp_Mult = 15,
		temp_ID = 150
    },
	calculate = function(self, card, context)
        --if context.cardarea == G.jokers and context.before and not context.after then
			--for i,v in pairs(context.full_hand) do
			--	if card.ability.temp_ID >= v:get_id() then 
			--		card.ability.temp_Mult = v:get_nominal(); 
			--		card.ability.temp_ID = v:get_id(); 
			--		card.ability.cut_card = v 
			--		return {
			--			mult = card.ability.temp_Mult,
			--			card = card
			--		}end
			--end
			--if card.ability.cut_card == context.other_card then
			--	return {
			--		mult = card.ability.temp_Mult,
			--		card = card
			--	}
			--end
			--if card.ability.cut_card == context.other_card then 
			---	return {
			---		mult = 2*card.ability.temp_Mult,
			---		card = card,
			---	}
			---end
		if context.full_hand then
			for i=1, #context.full_hand do
				if card.ability.temp_ID >= context.full_hand[i]:get_id() then
					card.ability.temp_Mult = context.full_hand[i].base.nominal; 
					card.ability.temp_ID = context.full_hand[i]:get_id(); 
					card.ability.cut_card = context.full_hand[i]
				end
			end
			if context.full_hand then
				return {
					mult = card.ability.temp_Mult,
					card = card
				}
			end
		end
    end
	
})