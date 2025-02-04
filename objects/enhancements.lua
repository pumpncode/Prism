SMODS.Enhancement({
    key = "crystal",
    atlas = "prismenhanced",
    pos = {x = 0, y = 0},
    discovered = false,
    config = {extra = {x_mult = 1.5}},
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card and card.ability.extra.x_mult or self.config.extra.x_mult}
        }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.main_scoring then
            return {
                xmult = card.ability.extra.x_mult
            }
        end
	end
})