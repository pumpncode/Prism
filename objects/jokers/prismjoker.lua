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