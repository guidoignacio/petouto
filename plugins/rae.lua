
local PLUGIN = {}

PLUGIN.doc = config.command_start .. config.locale.plugins.rae.command .. ' <' .. config.locale.arguments.term .. '>\n' .. config.locale.plugins.rae.help

PLUGIN.triggers = {
	'^' .. config.command_start .. config.locale.plugins.rae.command
}

function PLUGIN.action(msg)

	local input = get_input(msg.text)
	
	if not input then
		return send_msg(msg, PLUGIN.doc)
	end

	local api = 'http://dulcinea.herokuapp.com/api/?query='
	local url = api .. URL.escape(input)
	local jstr, res = HTTP.request(url)

	if res ~= 200 then
		return send_msg(msg, config.locale.errors.connection)
	end

	local jdat = JSON.decode(jstr)

	if jdat.status == "error" then
		return send_msg(msg, config.locale.errors.results)
	end

	while jdat.type == "multiple" do
		text = jdat.response[2].id
		local url = api .. text
		local jstr, res = HTTP.request(url)
		jdat = JSON.decode(jstr)
	end

	local message = ""

	local responses = #jdat.response

	if responses == 0 then
		return send_msg(msg, config.locale.errors.results)
	end

	if (responses > 5) then
		responses = 5
	end

	for i = 1, responses, 1 do 
		message = message .. jdat.response[i].word .. "\n"
		local meanings = #jdat.response[i].meanings
		if (meanings > 5) then
			meanings = 5
		end
		for j = 1, meanings, 1 do
			local meaning = jdat.response[i].meanings[j].meaning 
			message = message .. meaning .. "\n\n"
		end
	end

	send_msg(msg, message)

end

return PLUGIN
