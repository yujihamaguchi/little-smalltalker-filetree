tests
test0080Logging
"
You should stop to use any flag and use logging.
Replace from assertion of flag to assertion of log.
WasRun log -> 'setUp testMethod' 

Please pass the test below on Playground.

```
(TestCazeTest name: 'testRunning') run
(TestCazeTest name: 'testSetUp') run
```

If the test is success, nothing is happened.
If the test is failed, you will see some stacktrace.
"