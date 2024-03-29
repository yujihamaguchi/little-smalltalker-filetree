tests
testPrintList

	| result lengthOrderListPrinter |
	"Arrange"
	lengthOrderListPrinter := LengthOrderListPrinter new.
	
	"Act"
	result := lengthOrderListPrinter printList:
		          { 'banana'. 'cake'. 'apple' }.
		
	"Assert"
	self assert: result equals: '#(''cake'' ''apple'' ''banana'')'