tests
testUniqueInstance
		
	| semaphore object1 object2 |
	Singleton initialize.

	semaphore := Semaphore new.

	[ 
	Processor yield.
	object1 := Singleton uniqueInstance.
	semaphore signal ] fork.

	object2 := Singleton uniqueInstance.

	semaphore wait.
	self assert: object1 isNotNil. 
	self assert: object2 isNotNil. 	
	self assert: object1 identicalTo: object2