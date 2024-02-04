tests
testArrivalDate

	| customer arrivalDate deliveryDate adaptee adapter |
	"Arrange"
	customer := Customer new.
	adaptee := Supplier new.
	deliveryDate := '2023/01/14'.

	adaptee deliveryDate: deliveryDate.
	adapter := SupplierAdapter supplier: adaptee.

	customer supplierAdapter: adapter.

	"Act"
	arrivalDate := customer arrivalDate.

	"Assert"
	self assert: arrivalDate equals: deliveryDate