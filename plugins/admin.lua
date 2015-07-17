local PLUGIN = {}

PLUGIN.triggers = {
	'^' .. config.command_start .. config.locale.plugins.admin.command .. ' '
}

function PLUGIN.action(msg)

	if msg.date < os.time() - 1 then return end

	local input = get_input(msg.text)

	local message = config.locale.errors.argument

	local sudo = 0
	for i,v in ipairs(config.admins) do
		if msg.from.id == v then
			sudo = v
		end
	end

	if sudo == 0 then
		message = config.locale.errors.permission

	elseif string.lower(first_word(input)) == 'run' then

		local output = get_input(input)
		if not output then
			return send_msg(msg, config.locale.errors.argument)
		end
		local output = io.popen(output)
		message = output:read('*all')
		output:close()

	elseif string.lower(first_word(input)) == 'reload' then

		bot_init()
		message = config.locale.plugins.admin.reload

	elseif string.lower(first_word(input)) == 'halt' then

		is_started = false
		message = config.locale.plugins.admin.halt

	end

	send_msg(msg, message)

end

return PLUGIN
