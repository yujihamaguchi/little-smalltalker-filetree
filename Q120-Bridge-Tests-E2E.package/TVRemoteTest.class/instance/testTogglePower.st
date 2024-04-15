tests
testTogglePower

	| tv remote |
	"Arrange"
	tv := Television new.
	remote := Remote device: tv.
	self assert: tv isEnabled equals: false.

	"Act"
	remote togglePower.

	"Assert"
	self assert: tv isEnabled equals: true