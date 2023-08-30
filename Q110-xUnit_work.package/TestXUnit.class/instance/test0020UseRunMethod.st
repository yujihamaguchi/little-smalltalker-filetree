tests
test0020UseRunMethod
"
Inspite of calling `testMethod` directly,
if we execute `run` method, it's nice to be called `testMethod` indirectly. 
(You can call `testMethod` directory in run method)

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