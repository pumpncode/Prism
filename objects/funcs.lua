function G.PRISM.get_suits(scoring_hand, bypass_debuff)
    local suits = {}
    for k, _ in pairs(SMODS.Suits) do
        suits[k] = 0
    end
    for _, card in ipairs(scoring_hand) do
        if not SMODS.has_any_suit(card) then
            for suit, count in pairs(suits) do
                if card:is_suit(suit, bypass_debuff) and count == 0 then
                    suits[suit] = count + 1
                    break
                end
            end
        end
    end
    for _, card in ipairs(scoring_hand) do
        if SMODS.has_any_suit(card) then
            for suit, count in pairs(suits) do
                if card:is_suit(suit, bypass_debuff) and count == 0 then
                    suits[suit] = count + 1
                    break
                end
            end
        end
    end
    return suits
end

function G.PRISM.get_unique_suits(scoring_hand, bypass_debuff)
    local suits = G.PRISM.get_suits(scoring_hand, bypass_debuff)
    local num_suits = 0
    for _, v in pairs(suits) do
        if v > 0 then num_suits = num_suits + 1 end
    end
    return num_suits
end

function G.PRISM.create_booster()
	G.GAME.current_round.used_packs = G.GAME.current_round.used_packs or {}
	if not G.GAME.current_round.used_packs[1] then
		G.GAME.current_round.used_packs[1] = get_pack('shop_pack').key
	end

	if G.GAME.current_round.used_packs[1] ~= 'USED' then 
		local card = Card(G.shop_booster.T.x + G.shop_booster.T.w/2,
		G.shop_booster.T.y, G.CARD_W*1.27, G.CARD_H*1.27, G.P_CARDS.empty, G.P_CENTERS[G.GAME.current_round.used_packs[1]], {bypass_discovery_center = true, bypass_discovery_ui = true})
		create_shop_card_ui(card, 'Booster', G.shop_booster)
		card.ability.booster_pos = 1
		card:start_materialize()
		G.shop_booster:emplace(card)
	end
end

function G.PRISM.remove_joker(card)
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.7,
        func = function()
            play_sound('tarot1')
            card.T.r = -0.2
            card:juice_up(0.3, 0.4)
            card.states.drag.is = true
            card.children.center.pinch.x = true
            card:start_dissolve()
            card = nil
            return true
    end}))
end