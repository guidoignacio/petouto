local PLUGIN = {}

PLUGIN.triggers = {
	['¯\\_(ツ)_/¯'] = config.command_start .. 'shrug$',
	['( ͡° ͜ʖ ͡°)'] = config.command_start .. 'lenny$',
	['(╯°□°）╯︵ ┻━┻'] = config.command_start .. 'flip$',
	['┌（┌　＾o＾）┐'] = config.command_start .. 'homo$',
	['ಠ_ಠ'] = config.command_start .. 'look$'
}

function PLUGIN.action(msg)

	local message = string.lower(msg.text)

	for k,v in pairs(PLUGIN.triggers) do
		if string.match(message, v) then
			message = k
		end
	end

	if msg.reply_to_message then
		send_msg(msg.reply_to_message, message)
	else
		send_message(msg.chat.id, message)
	end

end

return PLUGIN
