as yet unclassified
togglePower

	device isEnabled
		ifTrue: [ device disable ]
		ifFalse: [ device enable ]