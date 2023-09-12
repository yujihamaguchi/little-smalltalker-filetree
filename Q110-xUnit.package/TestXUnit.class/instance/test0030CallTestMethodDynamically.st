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

https://github.com/yujihamaguchi/little-smalltalker-filetree/tree/69640fb28849b059633719f8b21e1e5a6057edcb/Q110-xUnit_work.package
"