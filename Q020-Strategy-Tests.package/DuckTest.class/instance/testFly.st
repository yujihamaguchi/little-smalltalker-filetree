tests
testFly

	| flyBehavier duck |
	"Arrange"
	flyBehavier := Mock new.
	duck := Duck flyBehavier: flyBehavier.

	"Act"
	duck fly.

	"Assert"
	flyBehavier should receive fly