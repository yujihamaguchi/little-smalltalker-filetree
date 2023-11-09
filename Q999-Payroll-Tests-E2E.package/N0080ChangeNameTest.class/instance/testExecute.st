tests
testExecute

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

	"
You should pass this test with TDD.
refer: https://github.com/yujihamaguchi/little-smalltalker-filetree/tree/52922af84ccd4f42f3918aa900f76d56b380af66/Q999-Payroll-Tests.package
"

	| empId employee transaction name |
	"Arrange"
	empId := 123.
	name := 'Bob'.

	transaction := AddHourlyEmployee
		               empId: empId
		               name: 'Bill'
		               address: 'Home'
		               hourlyRate: 10.
	transaction execute.

	"Action"
	transaction := ChangeName empId: empId name: name.
	transaction execute.

	"Assert"
	employee := PayrollDatabase employeeWithId: empId.
	self deny: employee isNil.
	self assert: employee name equals: name