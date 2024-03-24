tests
testAnalyzeWarm

	| target temperature result |
	"Arrange"
	target := StatisticAnalyze new.
	temperature := 14.
	target stub temperature willReturn: temperature.

	"Act"
	result := target analyze.

	"Assert"
	self
		assert: result
		equals:
		'Statistic / temperature: ' , temperature asString , ' is warm!'