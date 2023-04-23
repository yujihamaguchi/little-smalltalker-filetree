as yet unclassified
onButtonWasPushed: aNumber
	(onCommands at: aNumber) execute.
	undoCommand := offCommands at: aNumber 