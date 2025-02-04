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
            for k, v in ipairs(context.scoring_hand) do
				if v:is_face() then 
					faces[#faces+1] = v
					v:set_ability(G.P_CENTERS.m_stone, nil, true)
					G.E_MANAGER:add_event(Event({
						func = function()
							v:juice_up()
							return true
						end
					})) 
				end
			end
		end
    end
	
})