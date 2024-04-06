tests
testPrintList

	| dictionaryOrderListPrinter result |
	"Arrange"
	dictionaryOrderListPrinter := DictionaryOrderListPrinter new.

	"Act"
	result := dictionaryOrderListPrinter printList:
		          (MyArray newFrom: { 'banana'. 'cake'. 'apple' }).

	"Assert"
	self assert: result equals: 'a MyArray(''apple'' ''banana'' ''cake'')'