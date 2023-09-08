tests
test0130CountFailedTest
"
You should return object `TestRezult` which has a `errorCount` variable.
Now, you can create a genuine implement which passes the test below.
```
	test := WasRun name: 'testBrokenMethod'.
	result := test run.
	TestCase new assert: result summary equals: '1 run, 1 failed'
```

Please pass the test below on Playground.
```
(TestCazeTest name: 'testTemplateMethod') run.
(TestCazeTest name: 'testRezult') run.
(TestCazeTest name: 'testFailedResultFormatting') run.
(TestCazeTest name: 'testFailedResult') run
```

If the test is success, nothing is happened.
If the test is failed, you will see some stacktrace.
"