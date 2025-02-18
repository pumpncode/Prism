G.PRISM = {}
G.PRISM.C = {}
G.PRISM.extra_draw = 0
G.PRISM.C.myth_1 = HEX("ABB7A8")
G.PRISM.C.myth_2 = HEX("4A745A")

local lc = loc_colour
function loc_colour(_c, _default)
    if not G.ARGS.LOC_COLOURS then
        lc()
    end
    G.ARGS.LOC_COLOURS.moon = HEX('86ADB3')
    return lc(_c, _default)
end


function SMODS.current_mod.reset_game_globals(run_start)
	G.PRISM.extra_draw = 0
end

NFS.load(SMODS.current_mod.path .. 'objects/enhancements.lua')()
NFS.load(SMODS.current_mod.path .. 'objects/jokers.lua')()
NFS.load(SMODS.current_mod.path .. 'objects/myth_cards.lua')()
NFS.load(SMODS.current_mod.path .. 'objects/vouchers.lua')()

SMODS.Sound({
	key = "myth_music",
	path = "myth_music.ogg",
	select_music_track = function()
		return G.pack_cards and G.pack_cards.cards and G.pack_cards.cards[1] and G.pack_cards.cards[1].ability.set == "Myth"
	end,
})