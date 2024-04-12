as yet unclassified
createSushi: aSymbol

	^ aSymbol caseOf: { 
			  (#Ikura -> Ikura new).
			  (#Norimaki -> Norimaki new) }