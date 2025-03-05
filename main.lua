G.PRISM = {}
G.PRISM.C = {}
G.PRISM.FUNCS = {}
G.PRISM.C.myth_1 = HEX("ABB7A8")
G.PRISM.C.myth_2 = HEX("4A745A")

SMODS.Atlas({
    key = 'modicon',
    path = 'modicon.png',
    px = '34',
    py = '34'
})

local lc = loc_colour
function loc_colour(_c, _default)
    if not G.ARGS.LOC_COLOURS then
        lc()
    end
    G.ARGS.LOC_COLOURS.moon = HEX('86ADB3')
	G.ARGS.LOC_COLOURS.myth_light = HEX('80987A')
    return lc(_c, _default)
end


function SMODS.current_mod.reset_game_globals(run_start)
	if run_start then
		G.GAME.modifiers.extra_boosters = 0
		G.GAME.prism_start_deck_ranks = {}
		for i, v in pairs(G.playing_cards) do
			local already_added = false
			for _, k in pairs(G.GAME.prism_start_deck_ranks) do
				if not already_added and v.base.id == k then already_added = true end
			end
			if not already_added then table.insert(G.GAME.prism_start_deck_ranks,v.base.id) end
		end
    else
	end
	G.GAME.prism_extra_draw = 0
	G.GAME.prism_shop_legend = false
end

SMODS.load_file('objects/jokers.lua')()
SMODS.load_file('objects/enhancements.lua')()
SMODS.load_file('objects/myth_cards.lua')()
SMODS.load_file('objects/vouchers.lua')()
SMODS.load_file('objects/decks.lua')()
SMODS.load_file('objects/tags.lua')()
SMODS.load_file('objects/blinds.lua')()
SMODS.load_file('objects/challenges.lua')()
if CardSleeves then SMODS.load_file('objects/cardsleeves.lua')() end

SMODS.Sound({
	key = "myth_music",
	path = "myth_music.ogg",
	select_music_track = function()
		return G.pack_cards and G.pack_cards.cards and G.pack_cards.cards[1] and G.pack_cards.cards[1].ability.set == "Myth"
	end,
})

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