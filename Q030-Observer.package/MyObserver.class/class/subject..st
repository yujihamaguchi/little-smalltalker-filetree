accessing
subject: aSubject
	| observer |
	observer := self new.
	aSubject registerObserver: observer.
	^ observer