 -- shout-out to @luksireiku for showing me this site

local PLUGIN = {}

PLUGIN.triggers = {
	'@' .. bot.username,
	'^' .. bot.first_name
}

function PLUGIN.action(msg)

	local input = get_input(msg.text)
	print(input)
	
	local url = 'http://www.simsimi.com/requestChat?lc=' .. config.locale.plugins.chatter.language .. '&ft=1.0&req=' .. URL.escape(input)

	local jstr, res = HTTP.request(url)

	if res ~= 200 then
		return send_message(msg.chat.id, config.locale.plugins.chatter.no_connection)
	end

	local jdat = JSON.decode(jstr)

	if string.match(jdat.res, '^I HAVE NO RESPONSE.') or not jdat then
		jdat.res = config.locale.plugins.chatter.no_response
	end

	local message = jdat.res

	-- Let's clean up the response a little. Capitalization & punctuation.
	filter = {
		['%aim%aimi'] = bot.first_name,
		['^%s*(.-)%s*$'] = '%1',
		['^%l'] = string.upper
	}

	for k,v in pairs(filter) do
		message = string.gsub(message, k, v)
	end

	if not string.match(message, '%p$') then
		message = message .. '.'
	end

	send_message(msg.chat.id, message)

end

return PLUGIN
