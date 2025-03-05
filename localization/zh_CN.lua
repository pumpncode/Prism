return {
    descriptions = {
        Joker = {
            j_prism_exotic_card = {
                name = "异域卡",
                text = {"重新触发所有",
                    "打出的{C:attention}增强{}牌"
                },
            },
            j_prism_razor_blade = {
                name = "剃须刀片",
                text = {"每个不在",
                    "你牌组中的{C:attention}点数{}",
                    "提供{X:mult,C:white} X#1#{}倍率",
                    "{C:inactive}(当前为{X:mult,C:white}X#2# {C:inactive}倍率)"
                },
            },
            j_prism_harlequin = {
                name = "哈利奎因",
                text = {"第一次打出的牌中",
                    "每有一种{C:attention}花色{}被计分",
                    "这张小丑牌获得{X:mult,C:white} X#1# {}倍率",
                    "{C:inactive}(当前为{X:mult,C:white}X#2#{C:inactive}倍率)",
                },
                unlock= {
                "{E:1,s:1.3}?????",
                }
            },
            j_prism_rigoletto = {
                name = "里戈莱托",
                text = {"在你{C:attention}出牌{}或{C:attention}弃牌{}后",
                    "在本回合内{C:attention}+1{}手牌上限",
                    "{C:inactive}(当前为{C:attention}+#2#{C:inactive}手牌上限)",
                },
                unlock= {
                "{E:1,s:1.3}?????",
                }
            },
            j_prism_medusa = {
                name = "戈耳工",
                text = {"所有打出的{C:attention}人头牌{}",
		    "在计分时",
                    "变为{C:attention}石头牌{}",
                },
            },
            j_prism_rich_joker = {
                name = "富人小丑",
                text ={"每张牌被{C:attention}售出{}时",
 		"有{C:green}#1#/#2#{}几率获得{C:money}$#3#{} ",
                },
            },
            j_prism_air_balloon = {
                name = "热气球",
                text = {"每次你{C:attention}连续{}打出{C:attention}高牌{}",
                    "这张小丑牌获得{C:red}+#2#{}倍率",
                    "{C:inactive}(当前为{C:red}+#1#{C:inactive}倍率)"
                },
            },
            j_prism_ghost = {
                name = "神秘学家",
                text = {"本赛局中每使用过一张{C:spectral}幻灵牌{}",
                    "这张小丑牌获得{C:chips}+#1#{}筹码",
                    "{C:inactive}(当前为{C:chips}+#2#{C:inactive}筹码)",
                },
            },
            j_prism_prism = {
                name = "棱镜",
                text = {"{C:attention}计分{}的牌被视为",
                    "任何花色"
                },
            },
            j_prism_minstrel = {
                name = "唱诗人",
                text = {"当{C:attention}盲注{}被选择时",
                    "生成一张{C:myth_light}神话{}卡",
                    "{C:inactive}(必须有空间)",
                },
            },
            j_prism_happily = {
                name = "从此过上了幸福的生活",
                text = {"如果打出的牌中",
                    "包含一张计分的{C:attention}K{}和{C:attention}Q",
                    "则生成一张{C:myth_light}神话{}卡",
                    "{C:inactive}(必须有空间)",
                },
            },
            j_prism_geo_hammer = {
                name = "地质锤",
                text = {"回合开始时",
                    "将一张随机手牌变成",
                    "{C:attention}水晶牌{}或{C:attention}石头牌{}",
                    "{C:inactive}(忽略增强牌)"
                },
            },
            j_prism_vaquero = {
                name = "牧牛人",
                text = {"打出的{C:attention}万能牌{}",
                    "在计分时给予",
                    "{X:mult,C:white}X#1#{}倍率"
                },
            },
            j_prism_promotion = {
                name = "升变",
                text = {"如果本回合的{C:attention}第一次出牌{}",
                    "只有{C:attention}1{}张牌,",
                    "则将其变为{C:attention}Q"
                },
            },
            j_prism_sculptor  = {
                name = "雕刻家",
                text = {"每张打出的{C:attention}石头牌",
                    "在计分时永久获得",
                    "{C:mult}+#1#{}倍率"
                },
            },
            --[[ j_prism_motherboard = {
                name = "Motherboard",
                text = {""
                },
            }, ]]
            j_prism_reverse_card = {
                name = "UNO反转卡",
                text = {"交换当前的",
                    "{C:chips}筹码{}和{C:mult}倍率"
                },
            },
            j_prism_vip_pass = {
                name = "Vip通行证",
                text = {"{C:chips}普通{C:attention}小丑",
                "将不再出现",
                },
            },
            j_prism_plasma_lamp = {
                name = "等离子灯球",
                text = {"如果{C:attention}打出的牌型",
                    "是{C:attention}#1#{}或{C:attention}#2#{}",
		    "则平衡{C:chips}筹码{}和{C:mult}倍率{}",
                    "{s:0.8}所需牌型会在每回合结束",
                    "{s:0.8}或是生效后切换"
                },
            },
            j_prism_hopscotch = {
                name = "跳房子",
                text = {"每当一张打出的{C:attention}#3#{}被计分，",
                    "这张小丑牌获得{C:red}+#1#{}倍率",
                    "然后将所需点数上调{C:attention}1{}点",
                    "{C:inactive}(当前为{C:red}+#2#{C:inactive}倍率)",
                },
            },
            j_prism_amethyst = {
                name = "紫水晶",
                text = {"回合结束时，",
                    "每有一张留在手中的{C:attention}紫水晶牌{}",
                    "这张小丑牌获得{X:mult,C:white} X#2# {}倍率",
                    "{C:inactive}(当前为{X:mult,C:white}X#1# {C:inactive}倍率)",
                },
            },
            j_prism_aces_high = {
                name = "亡牌飞行员",
                text = {"如果打出的牌中包含",
                    "一张{C:attention}A{}和{C:attention}顺子{}",
                    "则生成一个{C:green}罕见{C:green}标签{}",
                    "或{C:rare}稀有标签{}",
                },
            },
            j_prism_elf = {
                name = "妖精",
                text = {"如果自{C:attention}上回合{}结束起",
                    "使用过神话牌",
                    "则{X:mult,C:white} X#1# {}倍率 ",
                },
            },
        },
        Back = {
            b_prism_ancient = {
                name = "古代牌组",
                text = {"开局时即拥有",
                    "{C:myth_light,T:v_prism_myth_merchant}神话商人{}和",
                    "{C:attention,T:v_prism_booster_box}增强包（箱装）{}"
                },
            },
            b_prism_market = {
                name = "生产过剩牌组",
                text = {"开局时即拥有",
                    "{C:attention,T:v_overstock_norm}库存过剩{}和",
                    "{C:attention,T:v_reroll_surplus}多次重掷{}"
                },
            },
        },
        Sleeve = {
            sleeve_prism_ancientsleeve = {
                name = "古代牌套",
                text = {"开局时即拥有",
                    "{C:myth_light,T:v_prism_myth_merchant}神话商人{}和",
                    "{C:attention,T:v_prism_booster_box}增强包（箱装）{}"
                },
            },
            sleeve_prism_ancientsleeve_alt = {
                name = "古代牌套",
                text = {"商店总会出现",
                    "a {C:myth_light}传说包"
                },
            },
            sleeve_prism_marketsleeve = {
                name = "生产过剩牌套",
                text = {"开局时即拥有",
                    "{C:attention,T:v_overstock_norm}库存过剩{}和",
                    "{C:attention,T:v_reroll_surplus}多次重掷{}"
                },
            },
            sleeve_prism_marketsleeve_alt = {
                name = "生产过剩牌套",
                text = {"开局时即拥有",
                    "{C:attention,T:v_prism_booster_box}增强包（箱装）{}"
                },
            },
        },
        Enhanced = {
            m_prism_crystal = {
                name = "紫水晶牌",
                text = {"{X:mult,C:white} X#1#{}倍率",
                    "如果在回合结束时留在手中",
                    "则获得{X:mult,C:white} X#2#{}倍率"
                }

            },
            m_prism_burnt = {
                name = "烧焦牌",
                text = {"当这张牌被{C:attention}弃掉{}时",
                    "抽{C:attention}#1#{}张牌"
                }
            },
            m_prism_double = {
                name = "双生牌",
                text = {"可以转变成",
                    "{C:attention}#1#{}"
                }
            },
            m_prism_echo = {
                name = "回声牌",
                text = {"每有一张",
		    "其他{C:attention}回声牌{}被打出时",
                    "{C:attention}重新触发{}这张牌"
                }
            },
        },
        Myth = {
            c_prism_myth_druid = {
                name = "德鲁伊",
                text = {"选择{C:attention}#1#{}张牌,",
                    "将{C:attention}右侧{}牌的",
                    "{C:enhanced}强化{}, {C:dark_edition}版本{}和",
                    "{C:attention}蜡封{}添加到{C:attention}左侧{}的牌"
                }

            },
            c_prism_myth_dwarf = {
                name = "侏儒",
                text = {"增强{C:attention}#1#{}张",
                    "选定卡牌成为",
                    "{C:attention}紫水晶牌"
                }
            },
            c_prism_myth_siren = {
                name = "塞壬",
                text = {"增强{C:attention}#1#{}张",
                    "选定卡牌成为",
                    "{C:attention}回声牌"
                }
            },
            c_prism_myth_dragon = {
                name = "巨龙",
                text = {"增强{C:attention}#1#{}张",
                    "选定卡牌成为",
                    "{C:attention}烧焦牌"
                }
            },
            c_prism_myth_twin = {
                name = "双子",
                text = {"增强{C:attention}#1#{}张",
                    "选定卡牌成为",
                    "{C:attention}双生牌",
                    "{C:inactive}(彼此转化)"
                }
            },
            c_prism_myth_wizard = {
                name = "巫师",
                text = {"转化最多{C:attention}#1#{}张",
                    "选定卡牌变成",
                    "{C:attention}右侧{}牌的{C:attention}点数{}"
                }
            },
            c_prism_myth_gnome = {
                name = "地精",
                text = {"生成一个{C:attention}投资标签"
                }
            },
            c_prism_myth_mirror = {
                name = "魔镜",
                text = {"向你随机一张手牌添加",
                    "{C:dark_edition}负片{}",
                }
            },
            c_prism_myth_colossus = {
                name = "巨人",
                text = {"给你手牌中的",
                    "{C:attention}#1#{}张选定卡牌",
                    "加上{C:moon}月球蜡封{}"
                }
            },
            c_prism_myth_beast = {
                name = "吠兽",
                text = {"生成一张随机的",
                    "{C:spectral}幻灵牌{}",
                    "{C:inactive}(必须有空间)"
                }
            },
            c_prism_myth_ooze = {
                name = "淤泥",
                text = {"给你手牌中的",
                    "{C:attention}#1#{}张选定卡牌",
                    "加上{C:green}绿色蜡封{}"
                }
            },
            c_prism_myth_roc = {
                name = "鹏",
                text = {"生成一个{C:attention}双倍标签"
                }
            },
            c_prism_myth_kraken = {
                name = "海妖",
                text = {"生成一个{C:attention}杂耍标签"
                }
            },
            c_prism_myth_treant = {
                name = "树精",
                text = {"转化最多{C:attention}#1#{}张",
                    "选定卡牌变成",
                    "{C:attention}右侧{}牌的{C:attention}花色{}"
                }
            },
        },
        Spectral = {
            c_prism_spectral_djinn = {
                name = "阿拉丁",
                text = {"许愿一张{C:dark_edition}任意",
                    "{C:attention}小丑牌{}",
                    "{C:inactive}(传奇小丑除外)",
                }
            },
        },
        Voucher = {
            v_prism_myth_merchant = {
                name = "神话商人",
                text = {
                    "商店中",
                    "{C:myth_light}神话牌{}",
                    "出现频率{C:attention}X2{}",
                },
            },
            v_prism_myth_tycoon = {
                name = "神话大亨",
                text = {
                    "商店中",
                    "{C:myth_light}神话牌{}",
                    "出现频率{C:attention}X4{}",
                },
            },
            v_prism_booster_box = {
                name = "增强包（箱装）",
                text = {
                    "商店中",
                    "{C:attention}+1{}增强包槽位",
                },
            },
            v_prism_bonus_packs = {
                name = "初回红利包",
                text = {
                    "你在{C:attention}增强包{}可以多选择",
                    "{C:attention}1{}张牌",
                },
            },

        },
        Tag = {
            tag_prism_myth = {
                name = "传颂标签",
                text = {
                    "获得一个免费的",
                    "{C:myth_light}超级传说包",
                },
            },
        },
        Other = {
            p_prism_small_myth_1 = {
                name = "传说包",
                text = {
                    "从最多{C:attention}#2#{C:myth_light}神话牌{}中",
                    "选择{C:attention}#1#{}张",
                },
            },
            p_prism_small_myth_2 = {
                name = "传说包",
                text = {
                    "从最多{C:attention}#2#{C:myth_light}神话牌{}中",
                    "选择{C:attention}#1#{}张",
                },
            },
            p_prism_mid_myth = {
                name = "巨型传说包",
                text = {
                    "从最多{C:attention}#2#{C:myth_light}神话牌{}中",
                    "选择{C:attention}#1#{}张",
                },
            },
            p_prism_large_myth = {
                name = "超级传说包",
                text = {
                    "从最多{C:attention}#2#{C:myth_light}神话牌{}中",
                    "选择{C:attention}#1#{}张",
                },
            },
            prism_green_seal = {
                name = "绿色蜡封",
                text = {"在回合开始时",
                    "有{C:green}1/#1#{}的几率",
                    "抽取这张牌"
                },
            },
            prism_moon_seal = {
                name = "月球蜡封",
                text = {
                    "打出并计分时",
		    "{C:green}#1#/#2#{}几率升级",
                    "你打出的牌型",
                },
            },
            --[[ prism_platinum_sticker={
                name="铂金标贴",
                text={
                    "使用这张小丑牌",
                    "在{C:attention}铂金注{}",
                    "难度下获胜",
                },
            }, ]]
        },
        Blind = {
            bl_prism_rose_club = {
                name = "玫色之杖",
                text = {
                    "打出#1#时",
                    "削弱所有打出的牌"
                },
            },
            bl_prism_birch = {
                name = "桦木",
                text = {
                    "削弱所有",
                    "偶数牌"
                },
            },
            bl_prism_yew = {
                name = "紫衫",
                text = {
                    "削弱所有",
                    "奇数牌"
                },
            }
        },
    },
    misc = {
        challenge_names={
            c_prism_aerial_warfare = "Aerial Warfare",
            c_prism_mvp = "MVP",
        },
        dictionary = {
            k_stone = "Stone",
            k_promoted = "Promoted!",
            k_prism_myth_pack = "Legend Pack",
            k_uno_reverse = "Reversed",
            k_plus_uncommon = "Uncommon",
            k_plus_rare = "Rare",
            prism_create = "Make Wish",
            prism_cancel = "Cancel",
            prism_enter_card = "Enter Card",
            prism_invalid_card = "Invalid Card!",
            prism_switch = "Switch",
            k_inactive = "inactive",
            k_inactive_ex = "Inactive!",
            k_another_card = "another card"
        },
        v_dictionary = {
            a_handsize_plus="+#1# Hand Size",
        },
        labels = {
            prism_green_seal = "Green Seal",
            prism_moon_seal = "Moon Seal",
        }
    }
}

