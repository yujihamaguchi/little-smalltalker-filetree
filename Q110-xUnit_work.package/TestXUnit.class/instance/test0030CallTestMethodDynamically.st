tests
test0030CallTestMethodDynamically
"

You should make `testMethod` called dynamically.

Please pass the test below on Playground.
( Same as the previous question )
```
Transcript clear.
test := WasRun name: 'testMethod'.
Transcript show: test wasRun; cr.
test run.
Transcript show: test wasRun; cr
```

You will see nil<CR>1 on a Transcript.
"