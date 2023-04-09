tests
testMultiThreadedAccess
	"Test accessing the singleton instance from multiple threads"

	| semaphore objects |
	Singleton initialize.

	semaphore := Semaphore new.
	objects := OrderedCollection new.

	[ 
		objects add: Singleton uniqueInstance.
		semaphore signal ] fork.
		
	[ 
		objects add: Singleton uniqueInstance.
		semaphore signal ] fork.

	semaphore wait.
	semaphore wait.

	objects asSet size = 1
		ifFalse: [ self error: 'Singleton instances are not equal' ]
