as yet unclassified
pushOnButton: aSlotInteger

	| command |
	command := (buttonLayout at: aSlotInteger) at: #on.
	command execute