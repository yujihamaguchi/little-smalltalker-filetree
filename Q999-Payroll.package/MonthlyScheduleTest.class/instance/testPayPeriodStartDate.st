tests
testPayPeriodStartDate

	| inputPayDate expected target actual |
	"Arrange"
	target := MonthlySchedule new.

	inputPayDate := '2023/09/30'.
	expected := '2023/09/01'.

	"Act"
	actual := target payPeriodStartDate: inputPayDate.

	"Assert"
	self assert: actual equals: expected