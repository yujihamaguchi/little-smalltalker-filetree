tests
testCreatePizza
	| nyPizzaStore |
	nyPizzaStore := NYPizzaStore new.
	self
		assert: (nyPizzaStore createPizza: #Cheese) class
		equals: NYStyleCheesePizza.
	self assert: (nyPizzaStore createPizza: #Karasumi) equals: nil