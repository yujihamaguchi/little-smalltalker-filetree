adding
add: aTimeCard

	timeCards ifNil: [ timeCards := Dictionary new ].
	timeCards at: aTimeCard date put: aTimeCard