local PLUGIN = {}

PLUGIN.doc = config.command_start .. config.locale.plugins.taunt.command .. ' [' .. config.locale.arguments.victim .. ']\n' .. config.locale.plugins.taunt.help

PLUGIN.triggers = {
	'^' .. config.command_start .. config.locale.plugins.taunt.command
}

function PLUGIN.action(msg)

	math.randomseed(os.time())

	local victim = get_input(msg.text)
	if not victim then
		victim = msg.from.first_name
	end

	if msg.reply_to_message then
		victim = msg.reply_to_message.from.first_name
	end

	local message = config.locale.plugins.taunt.quotes[math.random(#config.locale.plugins.taunt.quotes)]
	message = message:gsub('#VICTIM', victim)
	send_message(msg.chat.id, latcyr(message))

end

return PLUGIN
