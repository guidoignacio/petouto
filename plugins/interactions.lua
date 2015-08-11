 -- config.people is a table of IDs/nicknames the bot can address more familiarly
 -- like so:
 -- 	13227902: "Drew"


local PLUGIN = {}

PLUGIN.no_typing = true

function PLUGIN.action(msg)

	local input = string.lower(msg.text)

	if config.people[tostring(msg.from.id)] then msg.from.first_name = config.people[tostring(msg.from.id)] end

	-- if the first name end with -chan, -tan, -kun or similar it ignores them
	if string.find(bot.first_name, '%-') then
		bot.first_name = string.lower(string.sub(bot.first_name, 1, string.find(bot.first_name, '%-')-1))
	else
		bot.first_name = string.lower(bot.first_name)
	end

	for k,v in pairs(config.locale.interactions) do
		for key,val in pairs(v) do
			if input:match(val:gsub('#BOTNAME', bot.first_name)) then
				return send_message(msg.chat.id, k:gsub('#NAME', msg.from.first_name))
			end
		end
	end

end

return PLUGIN
