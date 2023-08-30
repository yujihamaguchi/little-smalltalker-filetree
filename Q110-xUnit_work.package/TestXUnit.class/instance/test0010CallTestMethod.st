tests
test0010CallTestMethod
"
We want to make our test method executable.

Please execute the script below on a Playground.
You should see nil<CR>1 on a Transcript.

```
Transcript clear.
test := WasRun name: 'testMethod'.
Transcript show: test wasRun; cr.
test testMethod.
Transcript show: test wasRun; cr
```

"