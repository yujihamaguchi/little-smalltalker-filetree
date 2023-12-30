as yet unclassified
pushOnButton: aSlotInteger

	| command |
	command := (buttonLayout at: aSlotInteger ifAbsent: [ 
		            Exception signal:
			            'Any command is not assigned at slot: '
			            , aSlotInteger asString ]) at: #on.
	command execute