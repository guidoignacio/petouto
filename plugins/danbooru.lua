local PLUGIN = {}

PLUGIN.doc = config.command_start .. config.locale.plugins.danbooru.command .. ' <' .. config.locale.arguments.tags .. '>\n' .. config.locale.plugins.danbooru.help

PLUGIN.triggers = {
	'^' .. config.command_start .. config.locale.plugins.danbooru.command ,
	'^' .. config.command_start .. 'db'
}

function PLUGIN.action(msg)

	--[[if string.match(input, PLUGIN.triggers[3]) then
		local input = string.sub(msg.text, string.find(msg.text, '#')+1)
	else
		local input = get_input(msg.text)
	end]]

	local input = get_input(msg.text)

	if not input then
		if msg.reply_to_message then
			msg = msg.reply_to_message
			input = msg.text
		else
			return send_msg(msg, PLUGIN.doc)
		end
	end

	local url = 'https://danbooru.donmai.us/posts.json?tags=' .. string.gsub(input, ' ', '+')

	local jstr, res = HTTP.request(url)

	print(url)

	if res ~= 200 then
		return send_msg(msg, config.locale.errors.connection)
	end
	local jdat = JSON.decode(jstr)
	if #jdat ~= 0 then
		result_url = jdat[math.random(#jdat)].source
		send_message(msg.chat.id, result_url, false, msg.message_id)
	else
		send_msg(msg, config.locale.errors.results)
	end

end

return PLUGIN
