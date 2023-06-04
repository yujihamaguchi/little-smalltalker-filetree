as yet unclassified
field: aFieldString value: aValueString
	fields ifNil: [ fields := Dictionary new ].
	fields at: aFieldString put: aValueString 
	