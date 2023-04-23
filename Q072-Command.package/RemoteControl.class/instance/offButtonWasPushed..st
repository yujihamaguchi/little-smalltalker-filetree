as yet unclassified
offButtonWasPushed: aNumber
	(offCommands at: aNumber) execute.
	undoCommand := onCommands at: aNumber