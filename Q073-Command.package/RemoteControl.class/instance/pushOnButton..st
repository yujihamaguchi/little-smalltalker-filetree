as yet unclassified
pushOnButton: aSlotInteger

	| command slot |
	slot := self slot: aSlotInteger.
	command := slot at: #on.
	undoCommand := slot at: #off.
	command execute