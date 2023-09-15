tests
test0071AddServiceChargeNoSuchMember

	| transaction raisedError inputMemberId |
	"Arrange"
	inputMemberId := 123.
	
	"Action"
	transaction := AddServiceCharge memberId: inputMemberId date: 20230801 amount: 1. 
	
	"Assert"
	[ transaction execute ]
		on: Error
		do: [ :e | raisedError := e ].
	self deny: raisedError isNil.
	self
		assert: raisedError messageText
		equals: 'No such member. id: ', inputMemberId asString