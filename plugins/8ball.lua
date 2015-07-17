local PLUGIN = {}

PLUGIN.doc = config.command_start .. config.locale.plugins.eightball.command .. '\n' .. config.locale.plugins.eightball.help

PLUGIN.triggers = {
	'^' .. config.command_start .. 'helix',
	'^' .. config.command_start .. config.locale.plugins.eightball.command,
	'y/n%p?$'
}

function PLUGIN.action(msg)

	math.randomseed(os.time())

	if msg.reply_to_message then
		msg = msg.reply_to_message
	end

	if string.match(string.lower(msg.text), 'y/n') then
		message = config.locale.plugins.eightball.yesno[math.random(#config.locale.plugins.eightball.yesno)]
	else
		message = config.locale.plugins.eightball.answers[math.random(#config.locale.plugins.eightball.answers)]
	end

	send_msg(msg, message)
end

return PLUGIN
