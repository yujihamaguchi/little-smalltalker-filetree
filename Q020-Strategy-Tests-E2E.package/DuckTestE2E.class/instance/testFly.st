tests
testFly

	| duck duckFlyBehavier |
	"Arrange"
	duck := Duck flyBehavier: FlyWithWings new.

	"Act"
	duckFlyBehavier := duck fly.

	"Assert"
	self assert: duckFlyBehavier equals: 'Flying with wings...'