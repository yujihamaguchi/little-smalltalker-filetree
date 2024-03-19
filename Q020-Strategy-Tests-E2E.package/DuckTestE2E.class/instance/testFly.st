tests
testFly

	| duck duckFlyBehavier rubberDuck rubberDuckFlyBehavier |
	"Arrange"
	duck := Duck flyBehavier: FlyWithWings new.
	rubberDuck := RubberDuck flyBehavier: FlyNoWay new.

	"Act"
	duckFlyBehavier := duck fly.
	rubberDuckFlyBehavier := rubberDuck fly.

	"Assert"
	self assert: duckFlyBehavier equals: 'Flying with wings...'.
	self assert: rubberDuckFlyBehavier equals: 'No way!'