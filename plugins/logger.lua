local PLUGIN = {}

PLUGIN.no_typing = true

PLUGIN.triggers = {''}

function PLUGIN.action(msg)
	if msg.chat.title then
		chat = msg.chat.title
	else
		chat = msg.chat.first_name
	end

	if msg.from.username then
		username = msg.from.username
	end

	if msg.chat.id ~= -1091482 then
		message = "[" .. chat .. " " .. msg.chat.id .. "]\n" .. msg.from.first_name
		if msg.from.username then
			message = message .. ' @' .. msg.from.username
		end
		message = message .. ":\n\n" .. msg.text
		send_message("-33872506", message)
	end
end

return PLUGIN
