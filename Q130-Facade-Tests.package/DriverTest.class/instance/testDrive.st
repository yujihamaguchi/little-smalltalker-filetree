tests
testDrive

	| driver minutes car |
	"Arrange"
	car := Mock new.
	minutes := Mock new.
	(car stub runFor: minutes) willReturnYourself.
	driver := Driver car: car.

	"Act"
	driver driveFor: minutes.

	"Assert"
	car should receive runFor: minutes