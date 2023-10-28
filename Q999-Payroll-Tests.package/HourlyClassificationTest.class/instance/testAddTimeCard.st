tests
testAddTimeCard

	| timeCards timeCard hourlyClassification |
	"Arrange"
	timeCards := Mock new.
	hourlyClassification := HourlyClassification
		                        rate: Mock new
		                        timeCards: timeCards.
	timeCard := Mock new.

	"Act"
	hourlyClassification addTimeCard: timeCard.

	"Assert"
	timeCards should receive add: timeCard