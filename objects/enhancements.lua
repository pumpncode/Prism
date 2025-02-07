SMODS.Enhancement({
    key = "crystal",
    atlas = "prismenhanced",
    pos = {x = 0, y = 0},
    discovered = false,
    config = {extra = {x_mult = 1,x_gain = 0.25}},
    loc_vars = function(self, info_queue, card)
        local card_ability = card and card.ability or self.config
        return {
            vars = { card_ability.extra.x_mult, card_ability.extra.x_gain }
        }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.main_scoring then
            return {
                xmult = card.ability.extra.x_mult
            }
        end
        if context.end_of_round and context.cardarea == G.hand and context.playing_card_end_of_round then
            card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.x_gain
            return{
				colour = G.C.RED,
				message = localize({ type = "variable", key = "a_xmult", vars = { card.ability.extra.x_mult } }),
				card = card,
            }
        end
	end
})
SMODS.Enhancement({
    key = "burnt",
    atlas = "prismenhanced",
    pos = {x = 0, y = 1},
    discovered = false,
})