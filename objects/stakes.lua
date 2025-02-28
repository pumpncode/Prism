--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!----
--!!!NOT CURRENTLY IMPLEMENTED!!!----
--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!----

SMODS.Atlas({
    key = 'prismstakes',
    path = 'chips.png',
    px = '29',
    py = '29'
})
SMODS.Atlas({
    key = 'prismstickers',
    path = 'stickers.png',
    px = 71,
    py = 95
})
SMODS.Stake({
    key = "platinum",
    above_stake = "gold",
    applied_stakes = { "gold" },
    prefix_config = {above_stake = { mod = false },applied_stakes = { mod = false }},
    atlas = 'prismstakes',
    pos = {x = 0, y = 0},
    colour = G.C.GREY,
    shiny = true,
    sticker_pos = {x = 0, y = 0},
    sticker_atlas = 'prismstickers',
    modifiers = function()
        G.GAME.modifiers.prism_platinum = true
    end,
})

function get_new_mini_boss()
    G.GAME.perscribed_mini_bosses = G.GAME.perscribed_mini_bosses or {
    }
    if G.GAME.perscribed_mini_bosses and G.GAME.perscribed_mini_bosses[G.GAME.round_resets.ante] then 
        local ret_boss = G.GAME.perscribed_mini_bosses[G.GAME.round_resets.ante] 
        G.GAME.perscribed_mini_bosses[G.GAME.round_resets.ante] = nil
        G.GAME.mini_bosses_used[ret_boss] = G.GAME.mini_bosses_used[ret_boss] + 1
        return ret_boss
    end
    if G.FORCE_MINI_BOSS then return G.FORCE_MINI_BOSS end

    local eligible_bosses = {}
    for k, v in pairs(G.P_BLINDS) do
        if not v.mini_boss then
            -- don't add
        elseif v.in_pool and type(v.in_pool) == 'function' then
            local res, options = v:in_pool()
            eligible_bosses[k] = res and true or nil
        elseif (v.mini_boss.min <= math.max(1, G.GAME.round_resets.ante) and ((math.max(1, G.GAME.round_resets.ante))%G.GAME.win_ante ~= 0 or G.GAME.round_resets.ante < 2)) then
            eligible_bosses[k] = true
        end
    end
    for k, v in pairs(G.GAME.banned_keys) do
        if eligible_bosses[k] then eligible_bosses[k] = nil end
    end

    local _, boss = pseudorandom_element(eligible_bosses, pseudoseed('mini_boss'))
    
    return boss
end

local orig_get_type = Blind.get_type
function Blind:get_type()
    if self.mini_boss then return 'Big'
    else return orig_get_type(self) end
end

SMODS.Blind({
    key = 'mini_hand',
    atlas = 'prismblinds',
    pos = {x = 0, y = 0},
    dollars = 4,
    mult = 1.5,
    mini_boss = {min = 1, max = 10},
    config = {extra = {hands = 1}},
    loc_vars = function(self, info_queue, card)
        return {vars = {self.config.extra.hands}}
    end,
    collection_loc_vars = function(self)
        return {vars = {self.config.extra.hands}}
    end,
    set_blind = function(self)
        ease_hands_played(-self.config.extra.hands)
    end,
    defeat = function(self)
        if not G.GAME.blind.disabled then ease_hands_played(self.config.extra.hands) end
    end,
    disable = function(self)
        ease_hands_played(self.config.extra.hands)
    end
})