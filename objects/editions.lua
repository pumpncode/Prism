----Not Implemented---
SMODS.Shader {
    key = 'goldfoil',
    path = 'goldfoil.fs'
}

SMODS.Edition {
    key = 'gold_foil',
    shader = 'goldfoil',
    sound = {
        sound = 'foil1',
        per = 1,
        vol = 0.4
    },
    discovered = true,
    weight = 2,
    in_shop = true,
    extra_cost = 7,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                (card.edition or {}).extra or self.config.extra
            }
        }
    end,
	calculate = function(self, card, context)
		if context.other_card == card and ((context.repetition and context.cardarea == G.play)
        or (context.retrigger_joker_check and not context.retrigger_joker))
		then
			return {
				message = localize('k_again_ex'),
				repetitions = 1,
				card = card,
			}
		end
	end,
}

local orig_calculate_retriggers = SMODS.calculate_retriggers
function SMODS.calculate_retriggers(card, context, _ret)
    local old_check = context.retrigger_joker_check
    local old_blue = context.blueprint
    context.retrigger_joker_check = true
    context.blueprint = (context.blueprint and (context.blueprint + 1)) or 1
    for k, v in pairs(G.GAME.probabilities) do
        G.GAME.probabilities[k] = v * 9999
    end
    local do_ret = eval_card(card,context)
    for k, v in pairs(G.GAME.probabilities) do
        G.GAME.probabilities[k] = v / 9999
    end
    context.retrigger_joker_check = old_check
    context.blueprint = old_blue
    return next(do_ret) and orig_calculate_retriggers(card, context, _ret) or {}
end