return {
	interactions = { -- Add to this table as you'd like.
		['Hello, #NAME.'] = {
			'hello,? #BOTNAME',
			'hey,? #BOTNAME',
			'hi,? #BOTNAME'
		},
		['Goodbye, #NAME.'] = {
			'bye,? #BOTNAME',
			'later,? #BOTNAME',
			'see ya,? #BOTNAME'
		},
		['No problem, #NAME.'] = {
			'thanks,? #BOTNAME',
			'thank you,? #BOTNAME'
		},
		['Welcome back, #NAME!'] = {
			'i\'m back',
			'i\'m home',
			'tadaima'
		},
	},
	messages = {
		private_message = 'I have sent you the requested information in a private message.'
	},
	errors = {
		connection	= 'Connection error.',
		results		= 'No results found.',
		argument	= 'Invalid argument.',
		syntax		= 'Invalid syntax.',
		permission	= 'Permission denied.'
	},
	arguments = {
		command		= 'command',
		currency	= 'currency',
		amount		= 'amount',
		verse		= 'verse',
		expression	= 'expression',
		argument	= 'argument',
		lines		= 'lines/separatedby/slashes',
		text		= 'text',
		query		= 'query',
		location	= 'location',
		movie_tv_series	= 'movie | TV series',
		number		= 'number',
		pokemon		= 'pokemon',
		subreddit	= 'r/subreddit',
		delay		= 'delay',
		message		= 'message',
		victim		= 'victim',
		term		= 'term',
		search		= 'search',
		name		= 'name',
		target_lang	= 'target lang',
		tags		= 'tags',
		from		= 'from',
		to			= 'to',
		username	= 'username',
		nickname	= 'nickname',
		topic		= 'topic'
	},
	plugins = {
		about = {
			command		= 'about',
			help		= 'Information about the bot',
			intro		= 'I am #BOT_NAME: a plugin-wielding, multi-purpose Telegram bot.\n' ..
					  'Use /help for a list of commands.',
			version		= 'Petouto is a fork by @luksireiku based on otouto v#VERSION by @topkecleon.\n' ..
					  'petouto and otouto v2 are licensed under the GPLv2.\n' ..
					  'topkecleon.github.io/otouto\n' ..
					  'github.com/luksireiku/petouto'
		},
		help = {
			command		= 'help',
			help		= 'Get list of basic information for all commands, or more detailed documentation on a specified command.',
			intro		= 'Available commands:',
			arguments	= '*Arguments: <required> [optional]'
		},
		admin = {
			command		= 'admin',
			reload		= 'Bot reloaded!',
			halt		= 'Shutting down...'
		},
		nick = {
			command		= 'nick',
			help		= 'Set your nickname for the bot to call you.',
		},
		eightball = {
			command		= '8ball',
			help		= 'Magic 8-ball. Returns a standard 8ball message, unless called with "y/n", where it will return a less verbose answer.',
			answers		= {
				"It is certain.",
				"It is decidedly so.",
				"Without a doubt.",
				"Yes, definitely.",
				"You may rely on it.",
				"As I see it, yes.",
				"Most likely.",
				"Outlook: good.",
				"Yes.",
				"Signs point to yes.",
				"Reply hazy try again.",
				"Ask again later.",
				"Better not tell you now.",
				"Cannot predict now.",
				"Concentrate and ask again.",
				"Don't count on it.",
				"My reply is no.",
				"My sources say no.",
				"Outlook: not so good.",
				"Very doubtful.",
				"There is a time and place for everything, but not now."
			},
			yesno		= {
				'Absolutely.',
				'In your dreams.',
				'Yes.',
				'No.',
				'Maybe.'
			}
		},
		bandersnatch = {
			command		= 'bandersnatch',
			help		= 'This is a Benedict Cumberbatch name generator.',
		},
		btc = {
			command		= 'btc',
			help		= 'Gives bitcoin prices for the given currency, and optionally conversion of an amount to and from that currency.\n' .. 
					  'BitcoinAverage Price Index https://bitcoinaverage.com/',
		},
		bible = {
			command		= 'bible',
			help		= 'Returns a verse from the bible, King James Version. Use a standard or abbreviated reference (John 3:16, Jn3:16).\n' ..
					  'http://biblia.com',
		},
		calc = {
			command		= 'calc',
			help		= 'This command solves math expressions and does conversion between common units. See mathjs.org/docs/expressions/syntax for a list of accepted syntax.',
		},
		chatter = {
			language	= 'en',
			no_connection	= 'I don\'t feel like talking right now.',
			no_response	= 'I don\'t know what to say to that.',
		},
		commit = {
			command		= 'commit',
			help		= 'http://whatthecommit.com.',
		},
		currency = {
			command		= 'cash',
			help		= 'Convert an amount from one currency to another.' ..
						  'Example: /cash USD EUR 5',
		},
		dice = {
			command		= 'roll',
			help		= 'Roll a die. Use any positive number for range or use D&D notation.\n' ..
					  'Example: /roll 4D100 will roll a 100-sided die four times.',
			max		= 'Max 100D100000'
		},
		dogify = {
			command		= 'dogify',
			help		= 'Produces a doge image from dogr.io. Newlines are indicated by a forward slash. Words do not need to be spaced, but spacing is supported. Will post a previewed link rather than an image.',
		},
		echo = {
			command		= 'echo',
			help		= 'Repeat a string.',
		},
		fortune = {
			command		= 'fortune',
			help		= 'Get a random fortune from the UNIX fortune program.',
		},
		gImages = {
			command		= 'image',
			help		= 'This command performs a Google Images search for the given query. One random top result is returned. Safe search is enabled by default; use \'/insfw\' to get potentially NSFW results.\nWant GIFs sent directly to chat? Try @ImageBot.',
		},
		gSearch = {
			command		= 'google',
			help		= 'This command performs a Google search for the given query. Four results are returned. Safe search is enabled by default; use \'/gnsfw\' to get potentially NSFW results. Four results are returned for a group chat, or eight in a private message.',
		},
		gMaps = {
			command		= 'loc',
			help		= 'Sends location data for query, taken from Google Maps. Works for countries, cities, landmarks, etc.',
		},
		giphy = {
			command		= 'giphy',
			help		= 'Returns a random or search-resulted GIF from giphy.com. Results are limited to PG-13 by default; use \'/gifnsfw\' to get potentially NSFW results.\nWant GIFs sent directly to chat? Try @ImageBot.',
		},
		hackernews = {
			command		= 'hackernews',
			help		= 'Returns some top stories from Hacker News. Four in a group or eight in a private message.',
		},
		hex = {
			command		= 'hex',
			help		= 'This function converts a number to or from hexadecimal.',
		},
		imdb = {
			command		= 'imdb',
			help		= 'This function retrieves the IMDB info for a given film or television series, including the year, genre, imdb rating, runtime, and a summation of the plot.',
		},
		lastfm = {
			command		= 'playing',
			help		= 'Get current- or last-played track data from last.fm. If a username is specified, it will return info for that username rather than your own.' ..
						  '"/fmset username" will configure your last.fm username.',
		},
		lmgtfy = {
			command		= 'lmgtfy',
		},
		pokedex = {
			command		= 'dex',
			help		= 'Get Pokedex information for a given Pokemon.\n' ..
					  'Includes national ID number, type, height, weight, and a description from a random regional dex.',
		},
		pun = {
			command		= 'pun',
			help		= 'Get a random pun.\nHave a recommendation? PM @topkecleon.',
		},
		reddit = {
			command		= 'reddit',
			help		= 'This command returns top results for a given query or subreddit. NSFW posts are marked as such.',
		},
		remind = {
			command		= 'remind',
			help		= 'Set a reminder for yourself. First argument is the number of minutes until you wish to be reminded.',
			no_delay	= 'The delay must be a number.',
			no_message	= 'Please include a reminder.',
			minutes		= 'minutes',
			seconds		= 'seconds',
			reminder_set	= 'Your reminder has been set for #DELAY from now:\n#TEXT',
			reminder	= 'Reminder:'
		},
		slap = {
			command		= 'slap',
			help		= 'Slap someone!',
		},
		time = {
			command		= 'time',
			help		= 'Sends the time and timezone for a given location.',
		},
		translate = {
			command		= 'translate',
			help		= 'Reply to a message to translate it to the default language.',
			language	= 'en'
		},
		urbandictionary = {
			command		= 'urbandictionary',
			help		= 'Returns the first definition for a given term from Urban Dictionary.',
		},
		weather = {
			command		= 'weather',
			help		= 'Returns the current temperature and weather conditions for a specified location.\n' ..
					  'Non-city locations are accepted; "/weather Buckingham Palace" will return the weather for Westminster.',
		},
		wikipedia = {
			command		= 'wiki',
			help		= 'Search Wikipedia for a relevant article and return its summary.',
			language	= 'en',
		},
		whoami = {
			command		= 'whoami',
			help		= 'Get the user ID for yourself and the group. Use it in a reply to get info for the sender of the original message.',
			who		= 'who',
			message		= 'You are #FROM and you are messaging #TO.'
		},
		xkcd = {
			command		= 'xkcd',
			help		= 'This command returns an xkcd strip, its number, and its "secret" text. You may search for a specific strip or get a random one.',
		},
		taunt = {
			command		= 'taunt',
			help		= 'Make people feel like shit.',
			quotes = {
				"#VICTIM, your mother should have queefed you into some toilet paper when the milkman was pulling his pants back up.",
				"#VICTIM, you should try out for solo porn...",
				"#VICTIM, your mother should have queefed you into some toilet paper when the milkman was pulling his pants back up.",
				"#VICTIM, did you fail your IQ test?",
				"#VICTIM, your brain must feel good as new, seeing as you never use it.",
				"#VICTIM, your parents must be twins.",
				"#VICTIM, how many extra chromosomes you packin'?",
				"#VICTIM, you must have been born on a highway, because that's where most accidents happen.",
				"#VICTIM, shut up, you'll never be the man your mother is.",
				"#VICTIM, you sir, are a cunt.",
			}
		},
		praise = {
			command		= 'praise',
			help		= 'Makes people feel better.',
			quotes = {
				"#NAME, you look nice today!",
			}
		},
                danbooru = {
                        command         = 'danbooru',
                        help            = 'Gets a random search-resulted image from Danbooru which matches the tags given, the tags are separated by spaces.'
                },
                konachan = {
                        command         = 'konachan',
                        help            = 'Gets a random search-resulted image from Konachan which matches the tags given, the tags are separated by spaces.'
                },
	},
}

