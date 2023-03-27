tests
testCurrent

	| semaphore object1 object2 |
	Singleton current: nil.
	semaphore := Semaphore new.
	[ 
	Processor yield.
	object1 := Singleton current.
	semaphore signal ] fork.
	object2 := Singleton current.
	semaphore wait.
	self assert: object1 identicalTo: object2