as yet unclassified
paycheck: anEmpIdNumber
	^ paychecks at: anEmpIdNumber ifAbsent: [ nil ]
	