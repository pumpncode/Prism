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
				if temp_ID <= G.hand.cards[i]:get_id() and not SMODS.has_no_rank(G.hand.cards[i]) then 
					card.ability.extra = G.hand.cards[i].base.nominal; 
					temp_ID = G.hand.cards[i]:get_id();
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
					focus = card,
					colour = G.C.RED,
					message = localize({ type = "variable", key = "a_xmult", vars = { card.ability.extra.x_mult } }),
					card = card,
				}
			end
		end
	end,
	
})
SMODS.Joker({
	key = "medusa",
	atlas = "prismjokers",
	pos = {x=0,y=6},
	rarity = 2,
	cost = 6,
	unlocked = true,
	discovered = false,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = true,
	loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_stone
	end,
	calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.before then
			local faces = {}
			local has_face = false
            for k, v in ipairs(context.scoring_hand) do
				if v:is_face() then 
					faces[#faces+1] = v
					has_face = true
					v:set_ability(G.P_CENTERS.m_stone,nil,true)
					G.E_MANAGER:add_event(Event({
						func = function()
							v:juice_up()
							return true
						end
					}))
				end
			end
			if has_face then
				return {
					message = localize('k_stone'),
					colour = HEX("D0D2D6"),
					card = card
				}
			end
		end
    end
	
})
SMODS.Joker({
	key = "prism",
	atlas = "prismjokers",
	pos = {x=0,y=14},
	rarity = 3,
	cost = 8,
	unlocked = true,
	discovered = false,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = true,
	
})

local get_original_suit = Card.is_suit
---@diagnostic disable-next-line: duplicate-set-field
function Card.is_suit(self, suit, bypass_debuff, flush_calc)
	local orig_suit = get_original_suit(self, suit, bypass_debuff, flush_calc)
    local is_numbered = self:get_id() >= 2 and self:get_id() <= 10
	if not (self.debuff and not bypass_debuff) and (next(SMODS.find_card('j_prism_prism'))) and is_numbered then
        local joker = SMODS.find_card('j_prism_prism')
        for _, card in pairs(joker) do
            return true
        end
	end
    return orig_suit
end

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