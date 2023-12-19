tests
testExecuteWithTimberAndMobileCrusher

	| transaction factory resultString |
	"Arrange"
	factory := TimberAndMobileCrusherFactory new.

	"Act"
	transaction := Transaction factory: factory.
	resultString := transaction execute.

	"Assert"
	self
		assert: resultString
		equals: 'Timber is pieces and MobileCrusher is off'