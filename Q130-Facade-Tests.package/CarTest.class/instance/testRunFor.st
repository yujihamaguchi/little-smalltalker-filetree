tests
testRunFor

	| car |
	"Arrange"
	car := Car new.
	
	"Act"
	car speed: 700.
	car runFor: 30.
	
	"Assert"
	self assert: car distance equals: 21000