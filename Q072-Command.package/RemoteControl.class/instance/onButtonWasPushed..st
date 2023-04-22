as yet unclassified
onButtonWasPushed: aSlot
	| targetSlot |
	targetSlot := slots at: aSlot.
	(targetSlot at: #on) execute.
	undoCommand := targetSlot at: #off