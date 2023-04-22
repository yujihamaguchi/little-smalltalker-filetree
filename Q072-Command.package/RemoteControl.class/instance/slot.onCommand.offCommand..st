as yet unclassified
slot: aNumber onCommand: anOnCommand offCommand: anOffCommand

	slots at: aNumber put: (Dictionary newFrom: { 
				 (#on -> anOnCommand).
				 (#off -> anOffCommand) })