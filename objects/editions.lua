----Not Implemented---
SMODS.Shader {
    key = 'gold_foil',
    path = 'gold_foil.fs'
}

SMODS.Edition {
    key = 'gold_foil',
    shader = 'gold_foil',
    sound = {
        sound = 'foil1',
        per = 1,
        vol = 0.4
    },
    discovered = true,
    weight = 3,
    in_shop = false,
    extra_cost = 5,
	config = {
        e_mult = 1.12
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                (card.edition or {}).e_mult or self.config.e_mult
            }
        }
    end,
	calculate = function(self, card, context)
		if context.post_joker or (context.main_scoring and context.cardarea == G.play) then
			return {
				emult = card.edition.e_mult
			}
		end
	end
}