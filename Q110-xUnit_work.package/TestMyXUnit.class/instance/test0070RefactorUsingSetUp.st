tests
test0070RefactorUsingSetUp
"
You can simplify your code using setUp.

1. You can remove constructor in WasRun to move the function which initializes a `wasRun` attribute.
2. You should not ensure that wasRun is nil before test execution because 1 is done.
3. Now, you can use setUp method to create a `WasRun` instance.

Please pass the test below on Playground.

```
(TestCazeTest name: 'testRunning') run
(TestCazeTest name: 'testSetUp') run
```

If the test is success, nothing is happened.
If the test is failed, you will see some stacktrace.
"