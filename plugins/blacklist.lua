 -- Admins can blacklist a user from utilizing this bot. Use via reply or with an ID as an argument. Un-blacklist a user with the same command.

local triggers = {
	'^' .. config.command_start .. config.locale.plugins.blacklist.command,
	'^' .. config.command_start .. 'mute',
	'^' .. config.command_start .. 'ignore'
}

local action = function(msg)

	if not config.admins[msg.from.id] then
		return send_msg(msg, config.locale.errors.permission)
	end

	local input = get_input(msg.text)
	if not input then
		if msg.reply_to_message then
			input = msg.reply_to_message.from.id
		else
			return send_msg(msg, config.locale.errors.id)
		end
	end

	local id = tostring(input)

	if config.blacklist[id] then
		config.blacklist[id] = nil
		send_message(msg.chat.id, config.locale.plugins.blacklist.added)
	else
		config.blacklist[id] = true
		send_message(msg.chat.id, config.locale.plugins.blacklist.removed)
	end

	save_data('blacklist.json', config.blacklist)

end

return {
	doc = doc,
	triggers = triggers,
	action = action
}
