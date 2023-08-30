tests
test0140TestSuite
"
We want to treat single tests and multiple tests in the same way.
You should create a `TestZuite` class to do it.
```
```

Please pass the test below on Playground.
```
Transcript clear.
suite := TestZuite new.
suite add: (TestCazeTest name: 'testTemplateMethod').
suite add: (TestCazeTest name: 'testRezult').
suite add: (TestCazeTest name: 'testFailedResultFormatting').
suite add: (TestCazeTest name: 'testFailedResult').
suite add: (TestCazeTest name: 'testZuite').
result := TestRezult new.
suite run: result.
Transcript show: result summary
```

If the test is success, nothing is happened.
If the test is failed, you will see some stacktrace.
"