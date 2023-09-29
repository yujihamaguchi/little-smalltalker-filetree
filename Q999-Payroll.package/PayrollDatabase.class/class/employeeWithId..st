as yet unclassified
employeeWithId: empId

	^ employees at: empId ifAbsent: [ nil ]