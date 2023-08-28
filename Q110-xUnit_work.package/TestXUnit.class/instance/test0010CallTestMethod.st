tests
test0010CallTestMethod
"
We want to make our test method executable.

Please pass the test below on a Playground?

```
Transcript clear.
test := WasRun name: 'testMethod'.
Transcript show: test wasRun; cr.
test testMethod.
Transcript show: test wasRun; cr
```

You should see nil<CR>1 on a Transcript.
"