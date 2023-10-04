accessing
totalAmount

	^ serviceChargeDictionary values
		  inject: 0
		  into: [ :acc :serviceCharge | acc + serviceCharge amount ]