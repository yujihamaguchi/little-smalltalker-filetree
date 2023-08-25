tests
test0100TearDown
"
Now, testSetUp becomes the test which assert setUp and testMethod.
So you can remove `testRunning`

```
(TestCazeTest name: 'testTemplateMethod') run
```

If the test is success, nothing is happened.
If the test is failed, you will see some stacktrace.
"