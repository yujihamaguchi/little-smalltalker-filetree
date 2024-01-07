as yet unclassified
pushOffButton: aSlotInteger

	| command slot |
	slot := self slot: aSlotInteger.
	command := slot at: #off.
	undoCommand := slot at: #on.
	command execute