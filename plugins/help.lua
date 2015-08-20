local PLUGIN = {}

PLUGIN.doc = config.command_start .. config.locale.plugins.help.command .. ' [' .. config.locale.arguments.command .. ']\n' .. config.locale.plugins.help.help

PLUGIN.triggers = {
	'^' .. config.command_start .. config.locale.plugins.help.command,
	'^' .. config.command_start .. 'h$',
	'^/start@' .. bot.username,
	'^/start$'
}

function PLUGIN.action(msg)

	if string.find(msg.text, '@') and not string.match(msg.text, config.locale.plugins.help.command .. '@'..bot.username) then return end

	local input = get_input(msg.text)

	if input then
		for i,v in ipairs(plugins) do
			if v.doc then
				if config.command_start .. input == trim_string(first_word(v.doc)) then
					return send_msg(msg, v.doc)
				end
			end
		end
	end

	local message = config.locale.plugins.help.intro .. '\n' .. help_message .. '\n' .. config.locale.plugins.help.arguments

	if msg.from.id ~= msg.chat.id then
		if not send_message(msg.from.id, message, true, msg.message_id) then
			return send_msg(msg, message) -- Unable to PM user who hasn't PM'd first.
		end
		return send_msg(msg, config.locale.messages.private_message)
	else
		return send_msg(msg, message)
	end

end

return PLUGIN
