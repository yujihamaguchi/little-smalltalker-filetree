accessing
summary

	^ '{1} run, {2} failed' format: { 
			  runCount asString.
			  errorCount asString }