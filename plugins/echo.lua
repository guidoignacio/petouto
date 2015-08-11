local PLUGIN = {}

PLUGIN.doc = config.command_start .. config.locale.plugins.echo.command .. ' <' .. config.locale.arguments.text .. '>\n' .. config.locale.plugins.echo.help

PLUGIN.triggers = {
	'^' .. config.command_start .. config.locale.plugins.echo.command
}

function PLUGIN.action(msg)

	local input = get_input(msg.text)
	if not input then
		return send_msg(msg, PLUGIN.doc)
	end

	send_message(msg.chat.id, latcyr(input))

end

return PLUGIN
