tests
test0082ChangeNameE2E

	| inputEmpId employee transaction inputName |
	"Arrange"
	inputEmpId := 1.
	inputName := 'Bob'.

	transaction := AddHourlyEmployee
		               empId: inputEmpId
		               name: 'Bill'
		               address: 'Home'
		               hourlyRate: 10.

	transaction execute.

	"Action"
	transaction := ChangeName empId: inputEmpId name: inputName.
	transaction execute.

	employee := PayrollDatabase employeeWithId: inputEmpId.

	"Assert"
	self deny: employee isNil.
	self assert: employee name equals: inputName