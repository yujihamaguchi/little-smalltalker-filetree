tests
test0081ChangeNameNoSuchEmployee
	| inputEmpId inputName transaction raisedError |

	"Arrange"
	inputEmpId := Mock new.
	inputName := Mock new.
	(PayrollDatabase stub employeeWithId: inputEmpId) willReturn: nil.
	 
	"Action"
	transaction := ChangeName empId: inputEmpId name: inputName.
	[ transaction execute ] on: Error do: [ :e | raisedError := e ].

	"Assert"
	self deny: raisedError isNil.
	self assert: raisedError messageText equals: 'No such employee. id: ', inputEmpId asString
