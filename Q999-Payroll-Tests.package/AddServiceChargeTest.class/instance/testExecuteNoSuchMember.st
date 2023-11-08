tests
testExecuteNoSuchMember

	| raisedException memberId transaction |
	"Arrange"
	memberId := Mock new.
	(PayrollDatabase stub employeeWithUnionMemberId: memberId) 
		willReturn: nil.

	"Act"
	transaction := AddServiceCharge
		               memberId: memberId
		               date: Mock new
		               amount: Mock new.
	[ transaction execute ]
		on: Exception
		do: [ :e | raisedException := e ].

	"Assert"
	self
		assert: raisedException messageText
		equals: 'No such member. id: ' , memberId asString