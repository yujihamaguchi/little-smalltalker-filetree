tests
testAddTimeCard

	| timeCard classification date |
	"Arrange"
	date := 20231027.
	classification := HourlyClassification rate: 10.
	timeCard := TimeCard date: 20231027 hours: 8.

	"Act"
	classification addTimeCard: timeCard.

	"Assert"
	self assert: (classification timeCardAt: date) equals: timeCard