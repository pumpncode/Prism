SMODS.Atlas({
    key = 'prismvouchers',
    path = 'vouchers.png',
    px = '71',
    py = '95'
})
SMODS.Voucher({
    key = "myth_merchant",
	atlas = "prismvouchers",
	pos = { x = 0, y = 0},
    unloked = true,
    redeem = function(self)
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.myth_rate = (G.GAME.myth_rate or 0.6) * 2
				return true
			end,
		}))
	end,
	unredeem = function(self)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.myth_rate = (G.GAME.myth_rate or 1.2) * 0.5
                return true
            end,
	    }))
	end
})
SMODS.Voucher({
    key = "myth_tycoon",
	atlas = "prismvouchers",
	pos = { x = 0, y = 1},
    requires = {"v_prism_myth_merchant"},
    unloked = true,
    redeem = function(self)
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.myth_rate = (G.GAME.myth_rate or 1.2) * 2
				return true
			end,
		}))
	end,
	unredeem = function(self)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.myth_rate = (G.GAME.myth_rate or 2.4) * 0.5
                return true
            end,
	    }))
	end
})
