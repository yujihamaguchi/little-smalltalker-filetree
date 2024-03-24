tests
testAnalyzeCold

	| target temperature result |
	"Arrange"
	target := StatisticAnalyze new.
	temperature := 13.
	target stub temperature willReturn: temperature.

	"Act"
	result := target analyze.

	"Assert"
	self
		assert: result
		equals:
		'Statistic / temperature: ' , temperature asString , ' is cold!'