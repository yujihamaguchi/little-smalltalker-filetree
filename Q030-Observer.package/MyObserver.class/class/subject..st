accessing
subject: aSubject
	| observer |
	observer := self new.
	aSubject register: observer interestedIn: observer interestingValues.
	^ observer