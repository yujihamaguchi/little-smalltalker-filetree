tests
testExecuteWithBananaAndBlender

	| factory transaction resultString |
	"Arrange"
	factory := BananaAndBlenderFactory new.

	"Act"
	transaction := Transaction factory: factory.
	resultString := transaction execute.

	"Assert"
	self
		assert: resultString
		equals: 'Banana is paste and Blender is off'