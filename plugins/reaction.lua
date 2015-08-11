local PLUGIN = {}

PLUGIN.triggers = {
	['¯\\_(ツ)_/¯'] = config.command_start .. 'shrug$',
	['( ͡° ͜ʖ ͡°)'] = config.command_start .. 'lenny$',
	['ಠ_ಠ'] = config.command_start .. 'disapprove$',
	['(╯°□°）╯︵ ┻━┻'] = config.command_start .. 'flip$',
	['┬──┬ ノ( ゜-゜ノ)'] = config.command_start .. 'flipback$',
	['（╯°□°）╯︵(\\ .o.)\\'] = config.command_start .. 'flipperson$',
	['┌（┌　＾o＾）┐'] = config.command_start .. 'homo$',
	['／人 ◕ ‿‿ ◕ 人＼'] = config.command_start .. 'kyubey$',
	['(ಥ﹏ಥ)'] = config.command_start .. 'crying$',
	['(；一_一)'] = config.command_start .. 'shame$',
	['(｡◕‿‿◕｡)'] = config.command_start .. 'catface$',
	['(¬_¬)'] = config.command_start .. 'tired$',
	['ლ(ಠ益ಠლ)'] = config.command_start .. 'raging$',
	["﴾͡๏̯͡๏﴿ O'RLY?"] = config.command_start .. 'orly$',
	['ლ(´ڡ`ლ)'] = config.command_start .. 'licking$',
	['( ﾟヮﾟ)'] = config.command_start .. 'happy$',
	['ᕕ( ᐛ )ᕗ'] = config.command_start .. 'happygary$',
	[':^)'] = config.command_start .. 'dorito$',
	['＼(^o^)／\n\n人生ｵﾜﾀ'] = config.command_start .. 'mylifeisover$',
	['¯\\(°_o)/¯'] = config.command_start .. 'dunno$',
	['๏_๏'] = config.command_start .. 'stare$',
	['(｡･_･｡)'] = config.command_start .. 'blush$',
	['(ﾟーﾟ)'] = config.command_start .. 'cool$',
	['щ（ﾟДﾟщ）'] = config.command_start .. 'why$',
	['《〠_〠》'] = config.command_start .. 'fuckyeah$',
	['(˚ㄥ_˚)'] = config.command_start .. 'oh$',
	['◕︵◕'] = config.command_start .. 'sad$',
	['( ﾟoﾟ)'] = config.command_start .. 'surprised$',
	['˚▱˚'] = config.command_start .. 'gasp$',
	['ザ・ワールド！'] = config.command_start .. 'zawarudo$',
	['時よ止まれ！'] = config.command_start .. 'tokiwotomare$',
	['無駄無駄無駄\n    無駄無駄無駄無駄\n   無駄無駄無駄\n      無駄無駄無駄無駄\n     無駄無駄無駄\n        無駄無駄無駄無駄\n       無駄無駄無駄\n          無駄無駄無駄無駄！'] = config.command_start .. 'mudamudamuda$',
	['無駄だ！'] = config.command_start .. 'mudada$',
	['ウリリイイイイ'] = config.command_start .. 'wry$',
	['オラ'] = config.command_start .. 'ora$',
	['オラオラオラ\n    オラオラオラオラ\n   オラオラオラ\n      オラオラオラオラ\n     オラオラオラ\n        オラオラオラオラ\n       オラオラオラ\n          オラオラオラオラ！'] = config.command_start .. 'oraoraora$'
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
