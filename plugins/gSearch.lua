local PLUGIN = {}

PLUGIN.doc = config.command_start .. config.locale.plugins.gSearch.command .. ' <' .. config.locale.arguments.query .. '>\n' .. config.locale.plugins.gSearch.help

PLUGIN.triggers = {
	'^' .. config.command_start .. 'g ',
	'^' .. config.command_start .. 'g$',
	'^' .. config.command_start .. config.locale.plugins.gSearch.command,
	'^' .. config.command_start .. 'gnsfw'
}

function PLUGIN.action(msg)

	local url = 'http://ajax.googleapis.com/ajax/services/search/web?v=1.0'

	if not string.match(msg.text, '^' .. config.command_start .. 'gnsfw ') then
		url = url .. '&safe=active'
	end

	if not msg.chat.title then
		url = url .. '&rsz=8'
	end

	local input = get_input(msg.text)
	if not input then
		if msg.reply_to_message then
			msg = msg.reply_to_message
			input = msg.text
		else
			return send_msg(msg, PLUGIN.doc)
		end
	end

	url = url .. '&q=' .. URL.escape(input)

	local jstr, res = HTTP.request(url)

	if res ~= 200 then
		return send_msg(msg, config.locale.errors.connection)
	end

	local jdat = JSON.decode(jstr)

	if #jdat.responseData.results < 1 then
		return send_msg(msg, config.locale.errors.results)
	end

	local message = ''

	for i = 1, #jdat.responseData.results do
		local result_url = jdat.responseData.results[i].unescapedUrl
		local result_title = jdat.responseData.results[i].titleNoFormatting
		message = message  .. ' - ' .. result_title ..'\n'.. result_url .. '\n'
	end

	local message = message:gsub('&amp;', '&') -- blah

	send_msg(msg, message)

end

return PLUGIN
