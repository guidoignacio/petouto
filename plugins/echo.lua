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

	send_msg(msg, latcyr(input))

end

return PLUGIN
