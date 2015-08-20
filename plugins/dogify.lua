local PLUGIN = {}

PLUGIN.doc = config.command_start .. config.locale.plugins.dogify.command .. ' <' .. config.locale.arguments.lines .. '>\n' .. config.locale.plugins.dogify.help

PLUGIN.triggers = {
	'^' .. config.command_start .. 'doge ',
	'^' .. config.command_start .. config.locale.plugins.dogify.command .. ' '
}

function PLUGIN.action(msg)

	local input = get_input(msg.text)
	if not input then
		return send_msg(msg, PLUGIN.doc)
	end

	local input = string.gsub(input, ' ', '')
	local input = string.lower(input)

	url = 'http://dogr.io/' .. input .. '.png'

	send_message(msg.chat.id, url, false, msg.message_id)

end

return PLUGIN
