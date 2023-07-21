accessing
subject: aSubject
	| observer |
	observer := self new.
	aSubject register: observer interestingIn: observer interestingProperties.
	^ observer