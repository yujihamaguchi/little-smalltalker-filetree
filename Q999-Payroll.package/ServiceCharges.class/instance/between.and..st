comparing
between: aFromDate and: aToDate

	serviceChargeDictionary := serviceChargeDictionary 
		                           associationsSelect: [ :assoc | 
			                           | date |
			                           date := assoc key.
			                           aFromDate <= date and: date <= aToDate ].
	^ self