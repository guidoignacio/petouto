local PLUGIN = {}

PLUGIN.doc = config.command_start .. config.locale.plugins.about.command .. '\n' .. config.locale.plugins.about.help

PLUGIN.triggers = {
	'^' .. config.command_start .. config.locale.plugins.about.command,
	'^' .. config.command_start .. 'info'
}

function PLUGIN.action(msg)

	local message = config.locale.plugins.about.intro .. '\n\n' .. config.locale.plugins.about.version -- Please do not remove this message.
	message = message:gsub('#BOT_NAME', bot.first_name)
	message = message:gsub('#VERSION', VERSION)

	send_message(msg.chat.id, message, true)

end

return PLUGIN
