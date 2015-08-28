local doc = config.command_start .. config.locale.plugins.nick.command .. ' <' .. config.locale.arguments.nickname .. '>\n' .. config.locale.plugins.nick.help

local triggers = {
	'^' .. config.command_start .. config.locale.plugins.nick.command
}

local action = function(msg)

	local data = load_data('nicknames.json')
	local id = tostring(msg.from.id)
	local input = get_input(msg.text)
	if not input then
		return send_msg(msg, doc)
	end

	data[id] = input
	save_data('nicknames.json', data)
	send_msg(msg, config.locale.plugins.nick.set .. input .. '.')

end

return {
	doc = doc,
	triggers = triggers,
	action = action
}
