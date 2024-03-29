tests
testPrintList

	| dictionaryOrderListPrinter result |
	"Arrange"
	dictionaryOrderListPrinter := DictionaryOrderListPrinter new.

	"Act"
	result := dictionaryOrderListPrinter printList:
		          { 'banana'. 'cake'. 'apple' }.

	"Assert"
	self assert: result equals: '#(''apple'' ''banana'' ''cake'')'