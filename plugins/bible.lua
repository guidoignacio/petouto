local PLUGIN = {}

PLUGIN.doc = config.command_start .. config.locale.plugins.bible.command .. ' <' .. config.locale.arguments.verse .. '>\n' .. config.locale.plugins.bible.help

PLUGIN.triggers = {
	'^' .. config.command_start .. config.locale.plugins.bible.command,
	'^'.. config.command_start ..'b '
}

function PLUGIN.action(msg)

	local input = get_input(msg.text)
	if not input then
		return send_msg(msg, PLUGIN.doc)
	end

	local url = 'http://api.biblia.com/v1/bible/content/KJV.txt?key=' .. config.biblia_api_key .. '&passage=' .. URL.escape(input)
	local message, res = HTTP.request(url)

	if res ~= 200 then
		message = config.locale.errors.connection
	end

	send_msg(msg, message)

end

return PLUGIN
