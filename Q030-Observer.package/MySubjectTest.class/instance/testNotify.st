tests
testNotify
	| target observer1 observer2 |
	target := MySubject new initialize.

	observer1 := Mock new.
	observer2 := Mock new.

	target registerObserver: observer1.
	target registerObserver: observer2.

	target notifyObservers.

	(observer1 should receive update: target) once.
	(observer2 should receive update: target) once