tests
testAddTimeCardBlackBox

	| classification date timeCard timeCards |
	"Arrange"
	timeCards := TimeCards new.
	classification := HourlyClassification rate: 10 timeCards: timeCards.
	date := 20231027.
	timeCard := TimeCard date: date hours: 8.

	"Act"
	classification addTimeCard: timeCard.

	"Assert"
	self assert: (classification timeCardAt: date) equals: timeCard