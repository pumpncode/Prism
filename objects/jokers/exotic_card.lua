SMODS.Joker({
	key = "exotic_card",
	atlas = "prismjokers",
	pos = {x=0,y=2},
	rarity = 2,
	cost = 6,
	pixel_size = { w = 59, h = 95},
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	config = {extra = 1},
	loc_vars = function(self, info_queue, center)
		return { vars = {center.ability.extra} }
	end,
	calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            if context.other_card.ability.set == 'Enhanced' then
                return {
                    message = localize('k_again_ex'),
                    repetitions = card.ability.extra,
                    card = card
                }
            end
        end
    end
	
})