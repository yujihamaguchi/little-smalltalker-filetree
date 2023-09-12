tests
test0140TestSuite
"
We want to treat a single test and multiple tests in the same way.
You should create a `TestZuite` class to do it.

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
You can see the result below in the Transcript.
```
5 run, 0 failed
```

https://github.com/yujihamaguchi/little-smalltalker-filetree/tree/227980a2dc0d1316ed1184bf3abc8ab5653fa8a9/Q110-xUnit_work.package
"