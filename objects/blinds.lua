SMODS.Atlas({
    key = 'prismblinds',
    path = 'blinds.png',
    atlas_table = 'ANIMATION_ATLAS',
    frames = 21,
    px = 34,
    py = 34
})

SMODS.Blind({
    key = 'rose_club',
    atlas = 'prismblinds',
    pos = {x = 0, y = 0},
    dollars = 8,
    mult = 2,
    boss = {showdown = true, min = 10, max = 10},
    boss_colour = HEX('C4729B'),
    loc_vars = function(self)
        return {vars = {localize(G.GAME.current_round.most_played_poker_hand, 'poker_hands')}}
    end,
    collection_loc_vars = function(self)
        return {vars = {localize('ph_most_played')}}
    end,

    press_play = function(self)
        if not G.GAME.blind.disabled then
            if G.FUNCS.get_poker_hand_info(G.hand.highlighted) == G.GAME.current_round.most_played_poker_hand then
                for i, _card in pairs(G.hand.highlighted) do
                    _card:set_debuff(true)
                end
                G.GAME.blind:wiggle()
---@diagnostic disable-next-line: inject-field
                G.GAME.blind.triggered = true
            end
        end
    end,
})