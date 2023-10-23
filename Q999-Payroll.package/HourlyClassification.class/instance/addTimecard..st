adding
addTimecard: aTimecard

	timecards ifNil: [ timecards := Dictionary new ].
	timecards at: aTimecard date put: aTimecard