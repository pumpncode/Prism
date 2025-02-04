SMODS.Atlas {
    key = 'prismjokers',
    path = "jokers.png",
    px = 71,
    py = 95
}
SMODS.Atlas {
    key = 'prismenhanced',
    path = "enhanced.png",
    px = 71,
    py = 95
}
SMODS.Atlas({
    key = 'prismmyth',
    path = 'myth.png',
    px = '71',
    py = '95'
})
NFS.load(SMODS.current_mod.path .. 'objects/enhancements.lua')()
NFS.load(SMODS.current_mod.path .. 'objects/jokers/exotic_card.lua')()
NFS.load(SMODS.current_mod.path .. 'objects/jokers/harlequin.lua')()
NFS.load(SMODS.current_mod.path .. 'objects/jokers/medusa.lua')()
NFS.load(SMODS.current_mod.path .. 'objects/jokers/rich_joker.lua')()
NFS.load(SMODS.current_mod.path .. 'objects/jokers/air_balloon.lua')()
NFS.load(SMODS.current_mod.path .. 'objects/jokers/ghost.lua')()
NFS.load(SMODS.current_mod.path .. 'objects/myth_cards.lua')()
--NFS.load(SMODS.current_mod.path .. 'objects/jokers/razor_blade.lua')()