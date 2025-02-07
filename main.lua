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
NFS.load(SMODS.current_mod.path .. 'objects/jokers.lua')()
NFS.load(SMODS.current_mod.path .. 'objects/myth_cards.lua')()