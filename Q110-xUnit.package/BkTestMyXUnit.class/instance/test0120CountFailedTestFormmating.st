tests
test0120CountFailedTestFormmating
"
You should return object `TestRezult` which has a `errorCount` variable.

At first, you can do a small step which passes the test below.
You can concentrate to implement `TestRezult` class.
```
	result := TestRezult new.
	result testStarted.
	result testFailed.
	TestCase new assert: result summary equals: '1 run, 1 failed'
```

Please pass the test below on Playground.
```
(TestCazeTest name: 'testTemplateMethod') run.
(TestCazeTest name: 'testRezult') run.
(TestCazeTest name: 'testFailedResultFormatting') run
```

If the test is success, nothing is happened.
If the test is failed, you will see some stacktrace.
"