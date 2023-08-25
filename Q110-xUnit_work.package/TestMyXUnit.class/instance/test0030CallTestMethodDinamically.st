tests
test0030CallTestMethodDinamically
"

Please pass the test below on Playground.
And you should make `testMethod` called dynamically.

```
Transcript clear.
test := WasRun name: 'testMethod'.
Transcript show: test wasRun; cr.
test run.
Transcript show: test wasRun; cr
```

You will see nil<CR>1 on a Transcript.
"