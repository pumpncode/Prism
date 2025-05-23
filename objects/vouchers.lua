SMODS.Atlas({
    key = 'prismvouchers',
    path = 'vouchers.png',
    px = '71',
    py = '95'
})
function G.PRISM.Voucher(table)
	if table.dependency or table.dependency == nil then
		SMODS.Voucher(table)
	end
end

G.PRISM.Voucher({
	dependency = G.PRISM.config.myth_enabled,
    key = "myth_merchant",
	atlas = "prismvouchers",
	pos = { x = 0, y = 0},
    unloked = true,
    redeem = function(self)
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.myth_rate = (G.GAME.myth_rate or 2) * 2
				return true
			end,
		}))
	end,
	unredeem = function(self)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.myth_rate = (G.GAME.myth_rate or 4) * 0.5
                return true
            end,
	    }))
	end
})
G.PRISM.Voucher({
	dependency = G.PRISM.config.myth_enabled,
    key = "myth_tycoon",
	atlas = "prismvouchers",
	pos = { x = 0, y = 1},
    requires = {"v_prism_myth_merchant"},
    unloked = true,
    redeem = function(self)
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.myth_rate = (G.GAME.myth_rate or 4) * 2
				return true
			end,
		}))
	end,
	unredeem = function(self)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.myth_rate = (G.GAME.myth_rate or 8) * 0.5
                return true
            end,
	    }))
	end
})
G.PRISM.Voucher({
    key = "booster_box",
	atlas = "prismvouchers",
	pos = { x = 1, y = 0},
    unloked = true,
    redeem = function(self)
		G.GAME.modifiers.extra_boosters = (G.GAME.modifiers.extra_boosters or 0) + 1
		if G.shop then G.PRISM.create_booster() end
	end,
	unredeem = function(self)
        G.GAME.modifiers.extra_boosters = (G.GAME.modifiers.extra_boosters or 0) - 1
	end
})
G.PRISM.Voucher({
    key = "bonus_packs",
	atlas = "prismvouchers",
	pos = { x = 1, y = 1},
    unloked = true,
	requires = {"v_prism_booster_box"},
})