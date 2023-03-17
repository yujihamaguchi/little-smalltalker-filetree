tests
testCreateSauce
	| target |
	target := ChicagoIngredientFactory new.
	self assert: target createSauce class equals: CheeseSauce