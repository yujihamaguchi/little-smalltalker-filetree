tests
test0110ChangeSalaried

	| employee inputEmpId transaction inputSalary salariedClassification |
	"Arrange"
	inputEmpId := Mock new.
	inputSalary := Mock new.

	employee := Mock new.
	(PayrollDatabase stub employeeWithId: inputEmpId) willReturn:
		employee.

	salariedClassification := Mock new.
	(SalariedClassification stub salary: inputSalary) willReturn:
		salariedClassification.

	"Action"
	transaction := ChangeSalaried empId: inputEmpId salary: inputSalary.
	transaction execute.

	"Assert"
	employee should receive classification: salariedClassification