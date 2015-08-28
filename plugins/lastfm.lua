local PLUGIN = {}

PLUGIN.doc = config.command_start .. config.locale.plugins.lastfm.command .. ' [' .. config.locale.arguments.username .. ']\n' .. config.locale.plugins.lastfm.help

PLUGIN.triggers = {
	'^' .. config.command_start .. config.locale.plugins.lastfm.command ,
	'^' .. config.command_start .. 'lastfm',
	'^' .. config.command_start .. 'np$',
	'^' .. config.command_start .. 'fm$',
	'^' .. config.command_start .. 'fmset'
}

function PLUGIN.action(msg)

	if msg.text:match('^/fmset') then

		local input = get_input(msg.text)
		if not input then
			return send_msg(msg, PLUGIN.doc)
		end

		local data = load_data('lastfm.json')
		local id = tostring(msg.from.id)

		data[id] = input

		save_data('lastfm.json', data)

		send_msg(msg, config.locale.plugins.lastfm.fmset .. input .. '.')

		return

	end

	local base_url = 'http://ws.audioscrobbler.com/2.0/?method=user.getrecenttracks&format=json&limit=1&api_key=' .. config.lastfm_api_key .. '&user='

	local input = get_input(msg.text)
	if not input then
		local data = load_data('lastfm.json')
		if data[tostring(msg.from.id)] then
			input = data[tostring(msg.from.id)]
		elseif msg.from.username then
			input = msg.from.username
		else
			return send_msg(msg, config.locale.plugins.lastfm.nofmset)
		end
	end

	local jstr, res = HTTP.request(base_url..input)

	if res ~= 200 then
		return send_msg(msg, config.locale.errors.connection)
	end

	local jdat = JSON.decode(jstr)

	if jdat.error then
		return send_msg(msg, config.locale.plugins.lastfm.nofmset)
	end

	if not jdat.recenttracks.track then
		return send_msg(msg, config.locale.plugins.lastfm.nohistory)
	end

	local jdat = jdat.recenttracks.track[1] or jdat.recenttracks.track

	local message = '🎵  ' .. msg.from.first_name .. ' ' .. config.locale.plugins.lastfm.listened .. ':\n'
	if jdat['@attr'] and jdat['@attr'].nowplaying then
		message = '🎵  ' .. msg.from.first_name .. ' ' .. config.locale.plugins.lastfm.listening .. ':\n'
	end

	local artist
	if jdat.artist then
		artist = jdat.artist['#text']
	else
		artist = 'Unknown'
	end

	local message = message .. jdat.name .. ' - ' .. jdat.artist['#text']

	send_message(msg.chat.id, message)

end

return PLUGIN
