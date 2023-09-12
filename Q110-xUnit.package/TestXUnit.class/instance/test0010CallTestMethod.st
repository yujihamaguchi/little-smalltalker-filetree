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

https://github.com/yujihamaguchi/little-smalltalker-filetree/tree/a98547f2a5574ade14f6a4bf345ae81e1ced871f/Q110-xUnit_work.package
"