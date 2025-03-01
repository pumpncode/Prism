SMODS.Atlas {
    key = 'prismenhanced',
    path = "enhanced.png",
    px = 71,
    py = 95
}
SMODS.Enhancement({
    key = "crystal",
    atlas = "prismenhanced",
    pos = {x = 0, y = 0},
    discovered = false,
    config = {extra = {x_mult = 1,x_gain = 0.25}},
    loc_vars = function(self, info_queue, card)
        local card_ability = card and card.ability or self.config
        return {
            vars = { card_ability.extra.x_mult, card_ability.extra.x_gain}
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
    config = {extra = 2},
    loc_vars = function(self, info_queue, card)
        local card_ability = card and card.ability or self.config
        return {
            vars = {card_ability.extra}
        }
    end,
    calculate = function(self, card, context)
        if context.discard and context.other_card == card then
            G.GAME.prism_extra_draw = G.GAME.prism_extra_draw + card.ability.extra
        end
    end
})
SMODS.Enhancement({
    key = "echo",
    atlas = "prismenhanced",
    pos = {x = 1, y = 2},
    discovered = false,
    calculate = function(self, card, context)
        if context.repetition then
            local retrig = 0
            for i, _card in pairs(G.hand.cards) do
                if SMODS.has_enhancement(_card,'m_prism_echo') then
                    retrig = retrig + 1
                end
            end
            for i, _card in pairs(G.play.cards) do
                if SMODS.has_enhancement(_card,'m_prism_echo') then
                    retrig = retrig + 1
                end
            end
            return {
                message = localize('k_again_ex'),
                repetitions = retrig - 1,
                card = card
            }
        end
    end
})

SMODS.Enhancement({
    key = "double",
    atlas = "prismenhanced",
    pos = {x = 0, y = 2},
    discovered = false,
    config = {extra = {card = nil}},
    loc_vars = function(self, info_queue, card)
        local card_ability = card and card.ability or self.config
        if card.config and not card_ability.extra.card and card.config.card.suit then
            card_ability.extra.card = pseudorandom_element(G.P_CARDS, pseudoseed('double_card'))
        end
        if card_ability.extra.card then 
            return {
                vars = {card_ability.extra.card.name}
            }
        else 
            return {
                vars = {"another card"}
            }
        end
    end,
})

local orig_highlight = Card.highlight
function Card:highlight(highlighted)
    orig_highlight(self, highlighted)
    if highlighted and self.config.center_key == 'm_prism_double' and self.area == G.hand and #G.hand.highlighted == 1 then
        self.children.use_button = UIBox{
            definition = G.UIDEF.use_switch_button(self), 
            config = {align = 'tm', offset = {x=0, y=0.4}, parent = self, id = 'm_prism_double'}
        }
    elseif self.area and #self.area.highlighted > 0 then
        for _, card in ipairs(self.area.highlighted) do
            if card.config.center_key == 'm_prism_double' then
                card.children.use_button = #self.area.highlighted == 1 and UIBox{
                    definition = G.UIDEF.use_switch_button(card), 
                    config = {align = 'tm', offset = {x=0, y=0.4}, parent = card}
                } or nil
            end
        end
    end
end

function G.UIDEF.use_switch_button(card)
    local button = nil
    button = {n=G.UIT.C, config={align = "tm"}, nodes={
            {n=G.UIT.C, config={
                ref_table = card, 
                align = "tm",maxw = 2, 
                padding = 0.1, r=1, 
                minw = 1.4, 
                minh = 0.8, 
                hover = true, 
                colour = G.C.RED, 
                button = 'switch_button'}, 
                nodes={
                {n=G.UIT.T, config={text = localize("prism_switch"), colour = G.C.UI.TEXT_LIGHT, scale = 0.35, shadow = true}}
            }}
        }}
    return button
end

G.FUNCS.switch_button = function(e, mute, nosave)
    local card = e.config.ref_table
    print(card.config.center)
    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.1, func = function()
        local _card = card.config.card
        card:set_base(card.ability.extra.card)
        card.ability.extra.card = _card
        card:juice_up(0.3, 0.5)
    return true end}))
end

SMODS.Seal({
    key = "green",
    atlas = "prismenhanced",
    pos = {x = 1, y = 0},
    discovered = false,
    badge_colour = HEX('65AE5E'),
})


SMODS.Seal({
    key = "moon",
    atlas = "prismenhanced",
    pos = {x = 1, y = 1},
    discovered = false,
    badge_colour = HEX('86ADB3'),
    config = {extra = {odds = 2}},
    loc_vars = function(self, info_queue, card)
        local card_ability = card and card.ability or self.config
        return {
            vars = {
                "" .. (G.GAME and G.GAME.probabilities.normal or 1), 
                card_ability.extra.odds}
        }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.before and context.scoring_hand and pseudorandom('moon') < G.GAME.probabilities.normal / self.config.extra.odds then
            level_up_hand(card,G.GAME.last_hand_played)
        end
    end
})