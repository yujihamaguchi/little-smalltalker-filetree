tests
test0040SeparateWasRunClassOnResponsibilities
"
You should separate `WasRun` class based on responsibilities.
1. Recording whether a method has been executed
2. Dynamically invoking a test method


Please pass the test below on Playground.

```
Transcript clear.
test := WasRun name: 'testMethod'.
Transcript show: test wasRun; cr.
test run.
Transcript show: test wasRun; cr
```

You will see nil<CR>1 on a Transcript.
"