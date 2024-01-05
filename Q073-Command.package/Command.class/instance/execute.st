execution
execute

	[ self action ]
		on: Exception
		do: [ :e | 
		Exception signal: 'Command failed because ' , e messageText ]