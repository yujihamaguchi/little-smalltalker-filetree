as yet unclassified
offButtonWasPushed: aSlot

	| targetSlot |
	targetSlot := slots at: aSlot.
	(targetSlot at: #off) execute.
	undoCommand := targetSlot at: #on