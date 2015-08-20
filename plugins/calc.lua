local PLUGIN = {}

PLUGIN.doc = config.command_start .. config.locale.plugins.calc.command .. ' <' .. config.locale.arguments.expression .. '>\n' .. config.locale.plugins.calc.help

PLUGIN.triggers = {
	'^' .. config.command_start .. config.locale.plugins.calc.command
}

function PLUGIN.action(msg)

	local input = get_input(msg.text)
	if not input then
		return send_msg(msg, PLUGIN.doc)
	end

	local url = 'http://api.mathjs.org/v1/?expr=' .. URL.escape(input)
	local message, res = HTTP.request(url)

	if res ~= 200 then
		return send_msg(msg, config.locale.errors.syntax)
	end

	send_msg(msg, message)
end

return PLUGIN

