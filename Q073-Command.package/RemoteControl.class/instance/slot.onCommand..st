as yet unclassified
slot: anInteger onCommand: anOnCommand

	buttonLayout
		at: anInteger
		put: (Dictionary newFrom: { (#on -> anOnCommand) })