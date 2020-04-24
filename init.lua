
-- create formspec from text file
local function get_formspec()
	local news_file = io.open(minetest.get_worldpath().."/news.txt", "r")
	if news_file then
		local news = news_file:read("*a")
		news_file:close()
		return 'size[12,8.25]'..
			"button_exit[-0.05,7.8;2,1;exit;Close]" ..
			"textarea[0.25,0;12.1,9;news;;"..minetest.formspec_escape(news).."]"
	else
		return
	end
end

minetest.register_on_joinplayer(function (player)
	local name = player:get_player_name()
	local fs = get_formspec()
	if fs then
		minetest.show_formspec(name, "news", fs)
	end
end)

-- command to display server news at any time
--[[
minetest.register_chatcommand("news", {
	description = "Shows server news to the player",
	func = function (name)
		minetest.show_formspec(name, "news", get_formspec())
	end
})
]]
