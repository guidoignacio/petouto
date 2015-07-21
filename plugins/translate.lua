  -- Glanced at https://github.com/yagop/telegram-bot/blob/master/plugins/translate.lua

local PLUGIN = {}

PLUGIN.triggers = {
	'^' .. config.command_start .. config.locale.plugins.translate.command
}

PLUGIN.doc = config.command_start .. config.locale.plugins.translate.command .. ' [' .. config.locale.arguments.target_lang .. ']\n' .. config.locale.plugins.translate.help

PLUGIN.action = function(msg)

	if not msg.reply_to_message then
		return send_msg(msg, PLUGIN.doc)
	end

	local tl = config.locale.plugins.translate.language or 'en'
	local input = get_input(msg.text)
	if input then
		tl = input
	end

	local url = 'http://translate.google.com/translate_a/single?client=t&ie=UTF-8&oe=UTF-8&hl=en&dt=t&tl=' .. tl .. '&sl=auto&text=' .. URL.escape(msg.reply_to_message.text)

	local str, res = HTTP.request(url)

	if res ~= 200 then
		return send_msg(msg, config.locale.errors.connection)
	end

	local output = str:gmatch("%[%[%[\"(.*)\"")():gsub("\"(.*)", "")

	send_msg(msg.reply_to_message, output)

end

return PLUGIN
