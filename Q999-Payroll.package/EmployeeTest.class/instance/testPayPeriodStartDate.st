tests
testPayPeriodStartDate

	| target inputPayDate schedule expected actual |
	"Arrange"
	inputPayDate := Mock new.

	target := Employee new.
	schedule := Mock new.
	target stub schedule willReturn: schedule.

	expected := Mock new.
	(schedule stub payPeriodStartDate: inputPayDate) willReturn: expected.

	"Act"
	actual := target payPeriodStartDate: inputPayDate.

	"Assert"
	target should receive schedule.
	schedule should receive payPeriodStartDate: inputPayDate.
	self assert: actual equals: expected