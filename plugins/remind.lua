local PLUGIN = {}

PLUGIN.doc = config.command_start .. config.locale.plugins.remind.command .. ' <' .. config.locale.arguments.delay .. '> <' .. config.locale.arguments.message .. '>\n' .. config.locale.plugins.remind.help

PLUGIN.triggers = {
	'^' .. config.command_start .. config.locale.plugins.remind.command .. '$',
	'^' .. config.command_start .. config.locale.plugins.remind.command .. ' '
}

function PLUGIN.action(msg)

	local input = get_input(msg.text)
	if not input then
		return send_msg(msg, PLUGIN.doc)
	end

	local delay = first_word(input)
	if not tonumber(delay) then
		return send_msg(msg, config.locale.plugins.remind.no_delay)
	end

	if string.len(msg.text) <= string.len(delay) + 9 then
		return send_msg(msg, config.locale.plugins.remind.no_message)
	end
	local text = string.sub(msg.text, string.len(delay)+10) -- this is gross
	if msg.from.username then
		text = text .. '\n@' .. msg.from.username
	end

	local delay = tonumber(delay)

	local reminder = {
		alarm = os.time() + (delay * 60),
		chat_id = msg.chat.id,
		text = text
	}

	table.insert(reminders, reminder)

	if delay <= 1 then
		delay = (delay * 60) .. ' ' .. config.locale.plugins.remind.seconds
	else
		delay = delay .. ' ' .. config.locale.plugins.remind.minutes
	end

	local message = config.locale.plugins.remind.reminder_set:gsub('#DELAY', delay):gsub('#TEXT', text)

	send_msg(msg, message)

end

return PLUGIN
