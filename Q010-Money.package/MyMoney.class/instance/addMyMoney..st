as yet unclassified
addMyMoney: aMyMoney

	^ self currency = aMyMoney currency
		  ifTrue: [
		  self class amount: amount + aMyMoney amount currency: currency ]
		  ifFalse: [ MyMoneySum monies: (Bag with: self with: aMyMoney) ]