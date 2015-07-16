return {
	interactions = { -- Add to this table as you'd like.
		['Hello, #NAME.'] = {
			'hola',
			'hey',
			'hi'
		},
		['Goodbye, #NAME.'] = {
			'bye',
			'adios',
			'nos vemos'
		}
	},
	messages = {
		private_message = 'He enviado la información solicitada en un mensaje privado.'
	},
	errors = {
		connection	= 'Error de conexión.',
		results		= 'No se encontraron resultados.',
		argument	= 'Parametro inválido.',
		syntax		= 'Syntaxis inválida.'
	},
	arguments = {
		command = 'comando'
	},
	plugins = {
		help = {
			command		= 'ayuda',
			help		= 'Obtiene una lista de información básica sobre todos los comandos, o una documentación mas detallada sobre un comando específico.',
			intro		= 'Comandos disponibles:',
			arguments	= '*Parametros: <requerido> [opcional]'
		}
	}
}

