return {
	interactions = { -- Add to this table as you'd like.
		['Hello, #NAME.'] = {
			'hello',
			'hey',
			'hi'
		},
		['Goodbye, #NAME.'] = {
			'bye',
			'later',
			'see ya'
		}
	},
	messages = {
		private_message = 'I have sent you the requested information in a private message.'
	},
	errors = {
		connection	= 'Connection error.',
		results		= 'No results found.',
		argument	= 'Invalid argument.',
		syntax		= 'Invalid syntax.'
	},
	arguments = {
		command = 'command'
	},
	plugins = {
		help = {
			command		= 'help',
			help		= 'Get list of basic information for all commands, or more detailed documentation on a specified command.',
			intro		= 'Available commands:',
			arguments	= '*Arguments: <required> [optional]'
		}
	}
}

