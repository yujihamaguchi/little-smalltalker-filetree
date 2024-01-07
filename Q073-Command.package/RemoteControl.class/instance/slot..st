as yet unclassified
slot: aSlotInteger

	^ buttonLayout at: aSlotInteger ifAbsent: [ 
		  Exception signal:
			  'Any command is not assigned at slot: ' , aSlotInteger asString ]