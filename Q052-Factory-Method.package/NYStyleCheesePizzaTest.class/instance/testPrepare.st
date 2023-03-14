tests
testPrepare
	| pizza |
	pizza := NYStyleCheesePizza new initialize.

	pizza prepare.

	self assert: pizza dough class equals: ThinCraftDough.
	self assert:
		((pizza toppings collect: [ :each | each class ]) includes:
			 NewYorkCheese)