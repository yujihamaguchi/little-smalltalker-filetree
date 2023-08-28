tests
test0040SeparateWasRunClassOnResponsibilities
"
You should separate `WasRun` class based on responsibilities.

1. Recording whether a method has been executed -> WasRun class
2. Dynamically invoking a test method -> TestCaze class


Please pass the test below on Playground.
( Same as the previous test )
```
Transcript clear.
test := WasRun name: 'testMethod'.
Transcript show: test wasRun; cr.
test run.
Transcript show: test wasRun; cr
```

You will see nil<CR>1 on a Transcript.
"