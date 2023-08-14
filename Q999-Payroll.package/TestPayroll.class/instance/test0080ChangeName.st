tests
test0080ChangeName

	"
	[ UseCase6: Change employee's profile ]
	- ChgEmp <EmpID> Name <name>
	- ChgEmp <EmpID> Address <address>
	- ChgEmp <EmpID> Hourly <hourlyRate>
	- ChgEmp <EmpID> Salaried <salary>
	- ChgEmp <EmpID> Commissioned <salary> <rate>
	- ChgEmp <EmpID> Hold
	- ChgEmp <EmpID> Direct <bank> <account>
	- ChgEmp <EmpID> Mail <address>
	- ChgEmp <EmpID> Member <mamberID> Dues <rate>
	- ChgEmp <EmpID> NoMember

	Attachment 1: In the case where the selected empID / memberID is a non-existent one.
	  Output an error message only, and perform no further processing.
	"

	| inputName employee inputEmpId transaction |
	"Arrange"
	inputEmpId := Mock new.
	inputName := Mock new.
	employee := Mock new.
	(PayrollDatabase stub employeeWithId: inputEmpId) willReturn:
		employee.

	"Action"
	transaction := ChangeName empId: inputEmpId name: inputName.
	transaction execute.

	"Assert"
	employee should receive name: inputName