initialization
employeeWithId: anEmpIdNumber

	^ employees at: anEmpIdNumber ifAbsent: [ nil ]