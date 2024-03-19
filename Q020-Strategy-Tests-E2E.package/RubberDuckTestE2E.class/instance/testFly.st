tests
testFly

	| rubberDuck rubberDuckFlyBehavier |
	"Arrange"
	rubberDuck := RubberDuck flyBehavier: FlyNoWay new.

	"Act"
	rubberDuckFlyBehavier := rubberDuck fly.

	"Assert"
	self assert: rubberDuckFlyBehavier equals: 'No way!'