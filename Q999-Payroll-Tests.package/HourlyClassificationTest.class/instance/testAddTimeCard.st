tests
testAddTimeCard
| timeCards timeCard classification |
"Arrange"
classification := HourlyClassification rate: 10.
timeCard := TimeCard date: 20231027 hours: 8.

timeCards := Mock new.
(timeCards stub add: timeCard) willReturnYourself.
classification stub timeCards willReturn: timeCards.

"Act"
classification addTimeCard: timeCard.

"Assert"
timeCards should receive add: timeCard