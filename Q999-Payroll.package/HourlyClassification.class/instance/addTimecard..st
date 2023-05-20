adding
addTimecard: aTimeCard

	timecards := timecards ifNil: [ timecards := Dictionary new ].
	timecards at: aTimeCard date put: aTimeCard