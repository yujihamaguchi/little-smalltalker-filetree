tests
testCurrent
		
	| semaphore object1 object2 |
	Singleton initialize.

	semaphore := Semaphore new.

	[ 
	Processor yield.
	object1 := Singleton initialize current.
	semaphore signal ] fork.

	object2 := Singleton initialize current.

	semaphore wait.
	self assert: object1 isNotNil. 
	self assert: object2 isNotNil. 	
	self assert: object1 identicalTo: object1