local PLUGIN = {}


PLUGIN.doc = config.command_start .. config.locale.plugins.gImages.command .. ' <' .. config.locale.arguments.query .. '>\n' .. config.locale.plugins.gImages.help

PLUGIN.triggers = {
	'^' .. config.command_start .. config.locale.plugins.gImages.command .. '?',
	'^' .. config.command_start .. 'img',
	'^' .. config.command_start .. 'i ',
	'^' .. config.command_start .. 'insfw'
}

PLUGIN.exts = {
	'.png$',
	'.jpg$',
	'.jpeg$',
	'.jpe$',
	'.gif$'
}

function PLUGIN.action(msg)

	local url = 'http://ajax.googleapis.com/ajax/services/search/images?v=1.0&rsz=8'

	if not string.match(msg.text, '^' .. config.command_start .. 'insfw ') then
		url = url .. '&safe=active'
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
		send_msg(msg, config.locale.errors.connection)
		return
	end

	local jdat = JSON.decode(jstr)

	if #jdat.responseData.results < 1 then
		send_msg(msg, config.locale.errors.results)
		return
	end

	is_real = false
	while is_real == false do
		local i = math.random(#jdat.responseData.results)
		result_url = jdat.responseData.results[i].url
		for i,v in pairs(PLUGIN.exts) do
			if string.match(string.lower(result_url), v) then
				is_real = true
			end
		end
	end

	send_message(msg.chat.id, result_url, false, msg.message_id)

end

return PLUGIN
