tests
test0100ReturnTestResult
"
We want to receive some test result(named `TestRezult`) which report a summary like `1 run, 0 failed`.
You can hard-code a text of summary but you should return object `TestRezult`.

Please pass the test below on Playground.
```
(TestCazeTest name: 'testTemplateMethod') run.
(TestCazeTest name: 'testRezult') run
```

If the test is success, nothing is happened.
If the test is failed, you will see some stacktrace.

https://github.com/yujihamaguchi/little-smalltalker-filetree/tree/e50f64e4242c40d74bc210d395fda8f158e0cbe9/Q110-xUnit_work.package
"