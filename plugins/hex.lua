local PLUGIN = {}

PLUGIN.doc = config.command_start .. config.locale.plugins.hex.command .. ' <' .. config.locale.arguments.number .. '>\n' .. config.locale.plugins.hex.help

PLUGIN.triggers = {
	'^' .. config.command_start .. config.locale.plugins.hex.command .. ' '
}

function PLUGIN.action(msg)

	local input = get_input(msg.text)

	if string.sub(input, 1, 2) == '0x' then
		send_msg(msg, tonumber(input))

	elseif tonumber(input) then
		send_msg(msg, string.format('%x', input))

	else
		send_msg(msg, config.locale.errors.argument)

	end

end

return PLUGIN
