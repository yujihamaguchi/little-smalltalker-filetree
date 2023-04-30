as yet unclassified
turnCrank: aMachine
	aMachine dispense.
	aMachine state: (aMachine count = 0
			 ifTrue: [ SoldOut new ]
			 ifFalse: [ NoCoin new ])