tests
test0090ChangeAddress

	| empId cat e t |
	empId := 2.
	t := AddHourlyEmployee
		     empId: empId
		     name: 'John'
		     address: 'NewYork'
		     hourlyRate: 10.
	t execute.


	cat := ChangeAddressTransaction empId: empId address: 'Boston'.
	cat execute.

	e := PayrollDatabase employee: empId.

	self deny: e isNil.
	self assert: e address equals: 'Boston'