tests
testCreateNoodle

	| target |
	target := ChicagoIngredientFactory new.
	self assert: target createNoodle class equals: ThickNoodle