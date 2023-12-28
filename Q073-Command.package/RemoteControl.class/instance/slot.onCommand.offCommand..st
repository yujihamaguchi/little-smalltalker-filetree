as yet unclassified
slot: anInteger onCommand: anOnCommand offCommand: anOffCommand

	buttonLayout at: anInteger put: (Dictionary newFrom: { 
				 (#on -> anOnCommand).
				 (#off -> anOffCommand) })