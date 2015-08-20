local PLUGIN = {}

PLUGIN.doc = config.command_start .. config.locale.plugins.praise.command .. ' [' .. config.locale.arguments.name .. ']\n' .. config.locale.plugins.praise.help

PLUGIN.triggers = {
	'^' .. config.command_start .. config.locale.plugins.praise.command
}

function PLUGIN.action(msg)

	math.randomseed(os.time())

	local name = get_input(msg.text)
	if not name then
		name = msg.from.first_name
	end

	if msg.reply_to_message then
		name = msg.reply_to_message.from.first_name
	end

	local message = config.locale.plugins.praise.quotes[math.random(#config.locale.plugins.praise.quotes)]
	message = message:gsub('#NAME', name)
	send_message(msg.chat.id, latcyr(message))

end

return PLUGIN
