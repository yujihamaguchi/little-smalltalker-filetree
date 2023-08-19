running
run
"
suite := MyTestSuite new.
suite add: (MyTestCaseTest name: 'testTemplateMethod').
suite add: (MyTestCaseTest name: 'testResult').
suite add: (MyTestCaseTest name: 'testFailedResult').
suite add: (MyTestCaseTest name: 'testFailedResultFormatting').
suite add: (MyTestCaseTest name: 'testSuite').
result := MyTestResult new initialize.
suite run: result.
Transcript show: result summary
"
	| result |
	result := MyTestResult new initialize.
	result testStarted.
	self setUp.
	[ self perform: name asSymbol ]
		on: Error
		do: [ :e | result testFailed ].
	self tearDown.
	^ result