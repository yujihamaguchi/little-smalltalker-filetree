tests
testArrivalDate

	| customer arrivalDate supplier aDate supplierAdaptor |
	"Arrange"
	customer := Customer new.
	supplier := Supplier new.
	aDate := '2023/01/14'.

	supplier deliveryDate: aDate.
	supplierAdaptor := SupplierAdopter supplier: supplier.

	customer supplierAdopter: supplierAdaptor.

	"Act"
	arrivalDate := customer arrivalDate.

	"Assert"
	self assert: arrivalDate equals: aDate