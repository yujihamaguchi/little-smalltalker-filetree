tests
test0090ChangeAddress

	| inputEmpId inputAddress employee transaction |
	"Arrange"
	inputEmpId := Mock new.
	inputAddress := Mock new.
	employee := Mock new.
	(PayrollDatabase stub employeeWithId: inputEmpId) willReturn:
		employee.

	"Action"
	transaction := ChangeAddress empId: inputEmpId address: inputAddress.
	transaction execute.

	"Assert"
	employee should receive address: inputAddress

	"	| empId cat e t |
	empId := 2.
	t := AddHourlyEmployee
		     empId: empId
		     name: 'John'
		     address: 'NewYork'
		     hourlyRate: 10.
	t execute.


	cat := ChangeAddressTransaction empId: empId address: 'Boston'.
	cat execute.

	e := PayrollDatabase employeeWithId: empId.

	self deny: e isNil.
	self assert: e address equals: 'Boston'"