execution
execute

	[ receiver volumeUp ]
		on: Exception
		do: [ :e | 
		Exception signal: 'Command failed because ' , e messageText ]