local PLUGIN = {}

PLUGIN.doc = config.command_start .. config.locale.plugins.imdb.command .. ' <' .. config.locale.arguments.movie_tv_series .. '>\n' .. config.locale.plugins.imdb.help

PLUGIN.triggers = {
	'^' .. config.command_start .. config.locale.plugins.imdb.command
}

function PLUGIN.action(msg)

	local input = get_input(msg.text)
	if not input then
		if msg.reply_to_message then
			msg = msg.reply_to_message
			input = msg.text
		else
			return send_msg(msg, PLUGIN.doc)
		end
	end

	local url = 'http://www.imdbapi.com/?t=' .. URL.escape(input)
	local jstr, res = HTTP.request(url)
	local jdat = JSON.decode(jstr)

	if res ~= 200 or not jdat then
		return send_msg(msg, config.locale.errors.connection)
	end

	if jdat.Response ~= 'True' then
		return send_msg(msg, jdat.Error)
	end

	local message = jdat.Title ..' ('.. jdat.Year ..')\n'
	message = message .. jdat.imdbRating ..' | '.. jdat.Runtime ..' | '.. jdat.Genre ..'\n'
	message = message .. jdat.Plot .. '\n'
	message = message .. 'http://imdb.com/title/' .. jdat.imdbID

	send_msg(msg, message)

end

return PLUGIN
