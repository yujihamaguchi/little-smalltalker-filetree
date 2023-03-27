accessing
current

	Transcript
		show: 'start';
		cr.
	Transcript
		show: isProcessing asString;
		cr.
	current := current ifNil: [ 
		           [ isProcessing not ] whileTrue: [  ].
		           isProcessing := false.
		           2 seconds asDelay wait.
		           Transcript
			           show: 'hello';
			           cr.
		           isProcessing := true.
		           self new ].
	Transcript
		show: 'end';
		cr.
	^ current