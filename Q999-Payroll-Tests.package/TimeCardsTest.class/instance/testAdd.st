tests
testAdd

	| date timeCard timeCards |
	"Arrange"
	timeCards := TimeCards new.
	date := 20231027.
	timeCard := TimeCard date: date hours: 8.

	"Act"
	timeCards add: timeCard.

	"Assert"
	self assert: (timeCards at: date) equals: timeCard