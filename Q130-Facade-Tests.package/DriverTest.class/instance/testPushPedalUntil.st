tests
testPushPedalUntil

	| car speed driver |
	"Arrange"
	car := Mock new.
	speed := Mock new.
	(car stub speed: speed) willReturnYourself.
	driver := Driver car: car.

	"Act"
	driver pushPedalUntil: speed.

	"Assert"
	car should receive speed: speed