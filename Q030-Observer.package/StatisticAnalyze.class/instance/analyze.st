private
analyze

	^ 'Statistic / temperature: {1} is {2}!' format: { 
			  self temperature asString.
			  (self temperature <= 13
				   ifTrue: 'cold'
				   ifFalse: 'warm') }