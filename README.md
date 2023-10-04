# A7 Mini Hot Dog Restaurant Script - Free


# A7 Store : https://discord.gg/B6NbFj7dtV

- Add these lines to your qb-core > shared lua under the Items section
	["hotdog"] 		 	 	     = {["name"] = "hotdog", 		            ["label"] = "Hot Dog", 				["weight"] = 1000, 		["type"] = "item", 		["image"] = "hotdog.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "hotdog - Script By A7 Store"},
	["hotdog-fries"] 		 	 	     = {["name"] = "hotdog-fries", 		            ["label"] = "Fries", 				["weight"] = 1000, 		["type"] = "item", 		["image"] = "hotdog-fries.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "hotdog - Script By A7 Store"},
	["hotdog-drink"] 		 	 	     = {["name"] = "hotdog-drink", 		            ["label"] = "Hotdog Drink", 				["weight"] = 1000, 		["type"] = "item", 		["image"] = "hotdog-drink.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "hotdog - Script By A7 Store"},
	["hotdog-bread"] 		 	 	     = {["name"] = "hotdog-bread", 		            ["label"] = "Bread", 				["weight"] = 1000, 		["type"] = "item", 		["image"] = "hotdog-bread.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "hotdog - Script By A7 Store"},
	["hotdog-lettuce"] 		 	 	     = {["name"] = "hotdog-lettuce", 		            ["label"] = "Lettuce", 				["weight"] = 1000, 		["type"] = "item", 		["image"] = "hotdog-lettuce.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "hotdog - Script By A7 Store"},
	["hotdog-sausage"] 		 	 	     = {["name"] = "hotdog-sausage", 		            ["label"] = "Sausage", 				["weight"] = 1000, 		["type"] = "item", 		["image"] = "hotdog-sausage.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "hotdog - Script By A7 Store"},
	["hotdog-mustard"] 		 	 	     = {["name"] = "hotdog-mustard", 		            ["label"] = "Mustard", 				["weight"] = 1000, 		["type"] = "item", 		["image"] = "hotdog-mustard.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "hotdog - Script By A7 Store"},
	["hotdog-emptycup"] 		 	 	     = {["name"] = "hotdog-emptycup", 		            ["label"] = "Empty Cup", 				["weight"] = 1000, 		["type"] = "item", 		["image"] = "hotdog-emptycup.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "hotdog - Script By A7 Store"},
	["hotdog-potato"] 		 	 	     = {["name"] = "hotdog-potato", 		            ["label"] = "Potato", 				["weight"] = 1000, 		["type"] = "item", 		["image"] = "hotdog-potato.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "hotdog - Script By A7 Store"},


- Add the image files from the file img to your `qb-inventory > html > images` folder


- Add these lines to your qb-core > shared lua under the Jobs section

    ['hot-dog'] = {
        label = 'Hot Dog',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Employed',
                payment = 100
            },
			['1'] = {
                name = 'Food Maker',
                payment = 150
            },
			['2'] = {
                name = 'Manager',
                isboss = true,
                payment = 200
            },
			['3'] = {
                name = 'Owner',
                isboss = true,
                payment = 300
            },
        },
    },

* [Preview ](https://youtu.be/ODVOAzXNsY0 )

* [Join Our Discord](https://discord.gg/B6NbFj7dtV)






