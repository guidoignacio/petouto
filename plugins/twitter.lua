local PLUGIN = {}

PLUGIN.doc = config.command_start .. config.locale.plugins.twitter.command .. ' <' .. config.locale.arguments.text .. '>\n' .. config.locale.plugins.twitter.help

PLUGIN.triggers = {
	'^' .. config.command_start .. config.locale.plugins.twitter.command,
	'^' .. config.command_start .. 'tw '
}

function PLUGIN.action(msg)

	local input = get_input(msg.text)
	if not input then
		if msg.reply_to_message then
			msg = msg.reply_to_message
			input = msg.text
		else
			return send_msg(msg, PLUGIN.doc)
		end
	end
	
	local sudo = 0
	for i,v in ipairs(config.admins) do
		if msg.from.id == v then
			sudo = v
		end
	end

	if sudo == 0 then
		return send_msg(msg, config.locale.errors.permission)
	end
		
	local OAuth = require "OAuth"
	local client = OAuth.new(config.twitter.consumer_key, config.twitter.consumer_secret, {
		RequestToken = "https://api.twitter.com/oauth/request_token", 
		AuthorizeUser = {"https://api.twitter.com/oauth/authorize", method = "GET"},
		AccessToken = "https://api.twitter.com/oauth/access_token"
		}, {
		OAuthToken = config.twitter.access_token,
		OAuthTokenSecret = config.twitter.access_token_secret
	})

	if config.twitter.consumer_key == '' then
		return send_msg(msg, "Twitter Consumer Key is empty, write it in config.lua")
	end
	if config.twitter.consumer_secret == '' then
		return send_msg(msg, "Twitter Consumer Secret is empty, write it in config.lua")
	end
	if config.twitter.access_token == '' then
		return send_msg(msg, "Twitter Access Token is empty, write it in config.lua")
	end
	if config.twitter.access_token_secret == '' then
		return send_msg(msg, "Twitter Access Token Secret is empty, write it in config.lua")
	end
  
	local response_code, response_headers, response_status_line, response_body = 
		client:PerformRequest("POST", "https://api.twitter.com/1.1/statuses/update.json", {
		status = input
	})
	if response_code ~= 200 then
		return send_msg(msg, "Error: " .. response_code)
	end
	
	return send_msg(msg, config.locale.plugins.twitter.sent)
	
end

return PLUGIN