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
end

NFS.load(SMODS.current_mod.path .. 'objects/enhancements.lua')()
NFS.load(SMODS.current_mod.path .. 'objects/jokers.lua')()
NFS.load(SMODS.current_mod.path .. 'objects/myth_cards.lua')()
NFS.load(SMODS.current_mod.path .. 'objects/vouchers.lua')()
NFS.load(SMODS.current_mod.path .. 'objects/decks.lua')()
NFS.load(SMODS.current_mod.path .. 'objects/tags.lua')()
NFS.load(SMODS.current_mod.path .. 'objects/blinds.lua')()
NFS.load(SMODS.current_mod.path .. 'objects/challenges.lua')()

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

local orig_get_chip_mult = Card.get_chip_mult
function Card:get_chip_mult()
    if self.debuff then return 0 end
	return orig_get_chip_mult(self) + (self.ability.perma_mult or 0)
end
local orig_generate_ui = SMODS.Enhancement.generate_ui
function SMODS.Enhancement.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
	orig_generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
	if specific_vars and specific_vars.bonus_mult then
		localize{type = 'other', key = 'card_extra_mult', nodes = desc_nodes, vars = {specific_vars.bonus_mult}}
	end
end