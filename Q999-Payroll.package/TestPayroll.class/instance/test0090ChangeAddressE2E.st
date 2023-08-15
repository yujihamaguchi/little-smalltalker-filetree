tests
test0090ChangeAddressE2E

	| inputEmpId transaction employee inputAddress |
	"Arrange"
	inputEmpId := Mock new.
	inputAddress := Mock new.
	transaction := AddSalariedEmployee
		               empId: inputEmpId
		               name: 'Bob'
		               address: Mock new
		               salary: 10.
	transaction execute.

	"Action"
	transaction := ChangeAddress empId: inputEmpId address: inputAddress.
	transaction execute.

	"Assert"
	employee := PayrollDatabase employeeWithId: inputEmpId.
	self deny: employee isNil.
	self assert: employee address equals: inputAddress
