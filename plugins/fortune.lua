local PLUGIN = {}

PLUGIN.doc = config.command_start .. config.locale.plugins.fortune.command .. '\n' .. config.locale.plugins.fortune.help

PLUGIN.triggers = {
	'^' .. config.command_start .. config.locale.plugins.fortune.command,
	'^' .. config.command_start .. 'f$'
}

function PLUGIN.action(msg)
	local output = io.popen('fortune')
	message = ''
	for l in output:lines() do
		message = message .. l .. '\n'
	end
	send_msg(msg, message)
end

return PLUGIN
